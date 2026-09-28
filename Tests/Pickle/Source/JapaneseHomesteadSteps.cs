using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using RimWorks.Pickle;
using RimWorld;
using UnityEngine;
using Verse;
using Verse.AI;

namespace JapaneseHomestead.PickleSteps
{
    /// <summary>
    /// The steps of the Japanese Homestead suite. Every text starts with "Japanese Homestead:" because Pickle loads
    /// the steps of every active suite into one namespace, and two suites declaring the same text make every line
    /// that uses it "Ambiguous step".
    ///
    /// What is NOT here is what the offline suite (Tests/Test-Mod.ps1, Check-DefInjected.ps1) already proves: the
    /// XML, the references, the translation keys. What is here needs a running game: the aura pulse, which is a
    /// MapComponent acting on pawns; the joy givers picking a building; the aquarium cost after the game's own
    /// patch pass; and the languages as the game loaded them.
    ///
    /// The mod's own assembly is not referenced. The aura extension is read by reflection, and a field that was
    /// renamed fails the scenario with a message that names it.
    /// </summary>
    [PickleSteps]
    public class JapaneseHomesteadSteps
    {
        private const string ModPackageId = "nelim.japanesehomestead";
        private const string AuraExtensionName = "HediffAuraExtension";

        // Open ground of Pickle's test-colony, where its own construction and map features place things.
        private static readonly IntVec3 Anchor = new IntVec3(146, 0, 156);

        // ------------------------------------------------------------------ what a scenario remembers

        private sealed class Ledger
        {
            public readonly Dictionary<string, IntVec3> Things = new Dictionary<string, IntVec3>();
            public readonly Dictionary<string, string> ThingDefs = new Dictionary<string, string>();
            public readonly Dictionary<string, IntVec3> Origins = new Dictionary<string, IntVec3>();
        }

        private static Ledger LedgerOf(PickleContext ctx)
        {
            Ledger ledger = null;
            try
            {
                ledger = ctx.Get<Ledger>();
            }
            catch (Exception)
            {
                // nothing remembered yet in this scenario
            }

            if (ledger == null)
            {
                ledger = new Ledger();
                ctx.Set(ledger);
            }

            return ledger;
        }

        internal static Map CurrentMap(PickleContext ctx)
        {
            ctx.Require(Current.Game != null && Find.CurrentMap != null, "load a save first");
            return Find.CurrentMap;
        }

        /// <summary>A pawn is found by its nickname on the map as it is NOW: a reload replaces every object.</summary>
        internal static Pawn PawnNamed(PickleContext ctx, string nickname)
        {
            IEnumerable<Pawn> all = CurrentMap(ctx).mapPawns.AllPawnsSpawned;
            Pawn pawn = all.FirstOrDefault(p => p.Name is NameTriple triple && triple.Nick == nickname)
                ?? all.FirstOrDefault(p => p.LabelShort == nickname);
            ctx.Assert(pawn != null,
                $"no pawn named \"{nickname}\" on the map; the map holds: " +
                string.Join(", ", all.Select(p => "\"" + p.LabelShort + "\"")));
            return pawn;
        }

        private static Thing ThingNamed(PickleContext ctx, string name)
        {
            Ledger ledger = LedgerOf(ctx);
            IntVec3 cell;
            ctx.Assert(ledger.Things.TryGetValue(name, out cell),
                $"nothing was placed under the name \"{name}\"; the scenario placed: " +
                string.Join(", ", ledger.Things.Keys.Select(k => "\"" + k + "\"")));
            string defName = ledger.ThingDefs[name];
            Thing thing = cell.GetThingList(CurrentMap(ctx)).FirstOrDefault(t => t.def.defName == defName);
            ctx.Assert(thing != null,
                $"no {defName} at ({cell.x}, {cell.z}) for \"{name}\"; the cell holds: " +
                string.Join(", ", cell.GetThingList(CurrentMap(ctx)).Select(t => t.def.defName)));
            return thing;
        }

        // ------------------------------------------------------------------ open ground

        private static bool Open(Map map, IntVec3 cell)
        {
            return cell.InBounds(map) && !cell.Fogged(map) && cell.Standable(map) && cell.GetEdifice(map) == null;
        }

        /// <summary>A cell whose row of <paramref name="reach"/> cells to the east is all open ground.</summary>
        private static IntVec3 FindRow(PickleContext ctx, Map map, int reach, IEnumerable<IntVec3> taken)
        {
            List<IntVec3> others = taken.ToList();
            foreach (IntVec3 cell in GenRadial.RadialCellsAround(Anchor, 45f, true))
            {
                if (others.Any(o => Math.Abs(o.z - cell.z) < 3 && cell.x <= o.x + reach && o.x <= cell.x + reach))
                {
                    continue;
                }

                bool clear = true;
                for (int d = 0; d <= reach && clear; d++)
                {
                    clear = Open(map, cell + new IntVec3(d, 0, 0));
                }

                if (clear)
                {
                    return cell;
                }
            }

            ctx.Assert(false, $"no row of {reach} open cells within 45 of ({Anchor.x}, {Anchor.z})");
            return IntVec3.Invalid;
        }

        private static IntVec3 FindSpot(PickleContext ctx, Map map, ThingDef def, IEnumerable<IntVec3> taken)
        {
            List<IntVec3> others = taken.ToList();
            foreach (IntVec3 cell in GenRadial.RadialCellsAround(Anchor, 40f, true))
            {
                if (!cell.InBounds(map) || cell.Fogged(map) || cell.Roofed(map))
                {
                    continue;
                }

                if (others.Any(o => (o - cell).LengthHorizontalSquared < 16))
                {
                    continue;
                }

                if (GenConstruct.CanPlaceBlueprintAt(def, cell, Rot4.North, map).Accepted)
                {
                    return cell;
                }
            }

            ctx.Assert(false, $"no cell within 40 of ({Anchor.x}, {Anchor.z}) accepts a {def.defName}");
            return IntVec3.Invalid;
        }

        [Given("Japanese Homestead: a {string} named {string} stands on open ground")]
        public void PlaceThing(PickleContext ctx, string defName, string name)
        {
            Map map = CurrentMap(ctx);
            Ledger ledger = LedgerOf(ctx);
            ctx.Assert(!ledger.Things.ContainsKey(name), $"a thing named \"{name}\" was already placed");

            ThingDef def = DefDatabase<ThingDef>.GetNamedSilentFail(defName);
            ctx.Assert(def != null, $"no ThingDef \"{defName}\": the game did not load it");
            IntVec3 cell = FindSpot(ctx, map, def, ledger.Things.Values);

            ThingDef stuff = def.MadeFromStuff ? GenStuff.DefaultStuffFor(def) : null;
            Thing thing = ThingMaker.MakeThing(def, stuff);
            thing.SetFaction(Faction.OfPlayer);
            GenSpawn.Spawn(thing, cell, map, Rot4.North);

            ledger.Things[name] = cell;
            ledger.ThingDefs[name] = defName;
            ctx.Attach("thing " + name, $"{defName} at ({cell.x}, {cell.z})");
        }

        // ------------------------------------------------------------------ the joy givers, asked as the game asks

        private static Job Offer(JoyGiverDef giverDef, Pawn pawn, out string why)
        {
            JoyGiver giver = giverDef.Worker;
            if (!giver.CanBeGivenTo(pawn))
            {
                PawnCapacityDef missing = giver.MissingRequiredCapacity(pawn);
                why = missing != null
                    ? $"CanBeGivenTo is false: {pawn.LabelShort} lacks the capacity {missing.defName}"
                    : "CanBeGivenTo is false";
                return null;
            }

            Job job = giver.TryGiveJob(pawn);
            why = job == null ? "CanBeGivenTo holds but TryGiveJob returned no job" : null;
            return job;
        }

        private static JoyGiverDef Giver(PickleContext ctx, string defName)
        {
            JoyGiverDef def = DefDatabase<JoyGiverDef>.GetNamedSilentFail(defName);
            ctx.Assert(def != null, $"no JoyGiverDef \"{defName}\": the game did not load it");
            return def;
        }

        /// <summary>
        /// Asked directly instead of waiting for recreation time to pick the giver: how often the game picks it is
        /// <c>baseChance</c>, a die roll the base game owns. What the giver decides once picked is decided here.
        /// </summary>
        [When("Japanese Homestead: the joy giver {string} sends {string} to the {string}")]
        public void SendTo(PickleContext ctx, string giverName, string nickname, string thingName)
        {
            Pawn pawn = PawnNamed(ctx, nickname);
            Thing thing = ThingNamed(ctx, thingName);
            JoyGiverDef giver = Giver(ctx, giverName);
            string why;
            Job job = Offer(giver, pawn, out why);
            ctx.Assert(job != null, $"{giverName} offered {nickname} nothing: {why}");
            ctx.Assert(job.def == giver.jobDef, $"{giverName} gave a {job.def.defName} job, not {giver.jobDef.defName}");
            ctx.Assert(job.targetA.Thing == thing,
                $"{giverName} sent {nickname} to {job.targetA.Thing?.def.defName} at {job.targetA.Cell}, " +
                $"not to \"{thingName}\" at {thing.Position}");
            pawn.jobs.StartJob(job, JobCondition.InterruptForced);
        }

        [Then("Japanese Homestead: the joy giver {string} offers {string} nothing")]
        public void OffersNothing(PickleContext ctx, string giverName, string nickname)
        {
            Pawn pawn = PawnNamed(ctx, nickname);
            string why;
            Job job = Offer(Giver(ctx, giverName), pawn, out why);
            ctx.Assert(job == null,
                $"{giverName} offered {nickname} a {job?.def.defName} job aimed at {job?.targetA.Thing?.def.defName}, " +
                "and it should have offered nothing");
        }

        [Then("Japanese Homestead: {string} is doing the job of the joy giver {string} within {int} seconds", TimeoutSeconds = 60f)]
        public async Task DoingTheJob(PickleContext ctx, string nickname, string giverName, int seconds)
        {
            Pawn pawn = PawnNamed(ctx, nickname);
            JobDef expected = Giver(ctx, giverName).jobDef;
            try
            {
                await ctx.WaitUntil(() => pawn.CurJob != null && pawn.CurJob.def == expected, seconds);
            }
            catch (TimeoutException)
            {
                ctx.Assert(false,
                    $"after {seconds} s {nickname} is doing " + (pawn.CurJob == null ? "nothing" : pawn.CurJob.def.defName) +
                    $", not {expected.defName}");
            }
        }

        // ------------------------------------------------------------------ the aura

        private static object AuraOf(PickleContext ctx, string apparelDefName)
        {
            ThingDef def = DefDatabase<ThingDef>.GetNamedSilentFail(apparelDefName);
            ctx.Assert(def != null, $"no ThingDef \"{apparelDefName}\"");
            DefModExtension ext = def.modExtensions?.FirstOrDefault(e => e.GetType().Name == AuraExtensionName);
            ctx.Assert(ext != null, $"{apparelDefName} carries no {AuraExtensionName}; its extensions are: " +
                string.Join(", ", (def.modExtensions ?? new List<DefModExtension>()).Select(e => e.GetType().Name)));
            return ext;
        }

        private static T AuraField<T>(PickleContext ctx, object ext, string field)
        {
            FieldInfo info = ext.GetType().GetField(field);
            ctx.Require(info != null, $"{AuraExtensionName} has no field \"{field}\" any more: the mod renamed it");
            return (T)info.GetValue(ext);
        }

        [Given("Japanese Homestead: {string} stands on a row of open ground {int} cells long")]
        public void StandOnRow(PickleContext ctx, string nickname, int reach)
        {
            Map map = CurrentMap(ctx);
            Ledger ledger = LedgerOf(ctx);
            Pawn pawn = PawnNamed(ctx, nickname);
            IntVec3 cell = FindRow(ctx, map, reach, ledger.Origins.Values);
            Teleport(pawn, cell);
            ledger.Origins[nickname] = cell;
            ctx.Attach("row " + nickname, $"({cell.x}, {cell.z}) eastward for {reach} cells");
        }

        private static void Teleport(Pawn pawn, IntVec3 cell)
        {
            pawn.jobs.StopAll();
            pawn.pather.StopDead();
            pawn.Position = cell;
            pawn.Notify_Teleported(true, true);
        }

        [Given("Japanese Homestead: {string} stands {int} cells east of {string}")]
        public void StandEastOf(PickleContext ctx, string nickname, int cells, string other)
        {
            Map map = CurrentMap(ctx);
            Pawn pawn = PawnNamed(ctx, nickname);
            Pawn reference = PawnNamed(ctx, other);
            IntVec3 cell = reference.Position + new IntVec3(cells, 0, 0);
            ctx.Assert(Open(map, cell), $"the cell {cells} east of {other} ({cell.x}, {cell.z}) is not open ground");
            Teleport(pawn, cell);
        }

        [Given("Japanese Homestead: a hostile pawn {string} lies unconscious {int} cells east of {string}")]
        public void HostileEastOf(PickleContext ctx, string nickname, int cells, string other)
        {
            Map map = CurrentMap(ctx);
            Pawn reference = PawnNamed(ctx, other);
            Faction pirates = Find.FactionManager.FirstFactionOfDef(FactionDefOf.Pirate);
            ctx.Require(pirates != null, "the test colony's world has no pirate faction to be hostile with");
            PawnKindDef kind = DefDatabase<PawnKindDef>.GetNamedSilentFail("Pirate");
            ctx.Require(kind != null, "the game has no PawnKindDef named Pirate any more");

            IntVec3 cell = reference.Position + new IntVec3(cells, 0, 0);
            ctx.Assert(Open(map, cell), $"the cell {cells} east of {other} ({cell.x}, {cell.z}) is not open ground");

            Pawn hostile = PawnGenerator.GeneratePawn(new PawnGenerationRequest(kind, pirates, PawnGenerationContext.NonPlayer, map.Tile));
            hostile.Name = new NameTriple("Hostile", nickname, "Test");
            GenSpawn.Spawn(hostile, cell, map);
            // Anaesthetic keeps the pawn where it lies for the whole scenario without hurting it: a pirate left awake
            // would walk to the wearer and fight, and the aura's range would stop being what the scenario measures.
            Hediff sleep = HediffMaker.MakeHediff(HediffDefOf.Anesthetic, hostile);
            sleep.Severity = 1f;
            hostile.health.AddHediff(sleep);
            ctx.Assert(hostile.HostileTo(reference), $"{nickname} is not hostile to {other}: the scenario would measure nothing");
        }

        [When("Japanese Homestead: I wait for {int} pulses of the aura of {string}", TimeoutSeconds = 60f)]
        public async Task WaitForPulses(PickleContext ctx, int pulses, string apparelDefName)
        {
            int interval = AuraField<int>(ctx, AuraOf(ctx, apparelDefName), "auraTickInterval");
            ctx.Require(interval > 0, $"{apparelDefName} has a pulse interval of {interval}");
            int now = Find.TickManager.TicksGame;
            // Up to the next multiple of the interval, then the following ones, plus a few ticks of margin: the
            // map component pulses on the tick where TicksGame is a multiple of the interval.
            int ticks = interval - (now % interval) + interval * (pulses - 1) + 5;
            await ctx.WaitTicks(ticks);
        }

        [When("Japanese Homestead: {string} takes off {string}")]
        public void TakeOff(PickleContext ctx, string nickname, string apparelDefName)
        {
            Pawn pawn = PawnNamed(ctx, nickname);
            Apparel worn = pawn.apparel.WornApparel.FirstOrDefault(a => a.def.defName == apparelDefName);
            ctx.Assert(worn != null, $"{nickname} does not wear {apparelDefName}; wears: " +
                string.Join(", ", pawn.apparel.WornApparel.Select(a => a.def.defName)));
            Apparel dropped;
            pawn.apparel.TryDrop(worn, out dropped);
        }

        [Then("Japanese Homestead: {string} carries {string} at a severity above zero and at most {float}")]
        public void CarriesHediff(PickleContext ctx, string nickname, string hediffDefName, float ceiling)
        {
            Pawn pawn = PawnNamed(ctx, nickname);
            Hediff hediff = pawn.health.hediffSet.hediffs.FirstOrDefault(h => h.def.defName == hediffDefName);
            ctx.Assert(hediff != null, $"{nickname} carries no {hediffDefName}; carries: " +
                string.Join(", ", pawn.health.hediffSet.hediffs.Select(h => h.def.defName)));
            ctx.Assert(hediff.Severity > 0f && hediff.Severity <= ceiling + 0.0001f,
                $"{nickname}'s {hediffDefName} is at severity {hediff.Severity:0.000}, outside (0, {ceiling}]");
        }

        [Then("Japanese Homestead: {string} carries no {string}")]
        public void CarriesNoHediff(PickleContext ctx, string nickname, string hediffDefName)
        {
            Pawn pawn = PawnNamed(ctx, nickname);
            Hediff hediff = pawn.health.hediffSet.hediffs.FirstOrDefault(h => h.def.defName == hediffDefName);
            ctx.Assert(hediff == null, $"{nickname} carries {hediffDefName} at severity {hediff?.Severity:0.000}");
        }

        private sealed class SeverityNote
        {
            public string Nickname;
            public string Def;
            public float Severity;
        }

        [When("Japanese Homestead: I note the severity of {string} on {string}")]
        public void NoteSeverity(PickleContext ctx, string hediffDefName, string nickname)
        {
            Pawn pawn = PawnNamed(ctx, nickname);
            Hediff hediff = pawn.health.hediffSet.hediffs.FirstOrDefault(h => h.def.defName == hediffDefName);
            ctx.Assert(hediff != null, $"{nickname} carries no {hediffDefName} to note");
            ctx.Set(new SeverityNote { Nickname = nickname, Def = hediffDefName, Severity = hediff.Severity });
        }

        [Then("Japanese Homestead: the severity of {string} on {string} has not risen since it was noted")]
        public void SeverityDidNotRise(PickleContext ctx, string hediffDefName, string nickname)
        {
            SeverityNote note = ctx.Get<SeverityNote>();
            ctx.Assert(note.Def == hediffDefName && note.Nickname == nickname,
                $"the note is about {note.Def} on {note.Nickname}, not {hediffDefName} on {nickname}");
            Pawn pawn = PawnNamed(ctx, nickname);
            Hediff hediff = pawn.health.hediffSet.hediffs.FirstOrDefault(h => h.def.defName == hediffDefName);
            float now = hediff?.Severity ?? 0f;
            ctx.Assert(now <= note.Severity + 0.0001f,
                $"{nickname}'s {hediffDefName} rose from {note.Severity:0.000} to {now:0.000} after the wearer took the garment off");
        }

        // ------------------------------------------------------------------ the aquarium, after the game's patch pass

        [Then("Japanese Homestead: the def {string} costs {int} of {string}")]
        public void CostsOf(PickleContext ctx, string defName, int count, string costDefName)
        {
            ThingDef def = DefDatabase<ThingDef>.GetNamedSilentFail(defName);
            ctx.Assert(def != null, $"no ThingDef \"{defName}\"");
            ThingDefCountClass cost = def.costList?.FirstOrDefault(c => c.thingDef.defName == costDefName);
            ctx.Assert(cost != null && cost.count == count,
                $"{defName} costs " + (def.costList == null ? "nothing" : string.Join(", ", def.costList.Select(c => c.count + " " + c.thingDef.defName))) +
                $", not {count} {costDefName}");
        }

        [Then("Japanese Homestead: the def {string} does not cost {string}")]
        public void DoesNotCost(PickleContext ctx, string defName, string costDefName)
        {
            ThingDef def = DefDatabase<ThingDef>.GetNamedSilentFail(defName);
            ctx.Assert(def != null, $"no ThingDef \"{defName}\"");
            ctx.Assert(def.costList == null || def.costList.All(c => c.thingDef.defName != costDefName),
                $"{defName} still costs {costDefName}: " + string.Join(", ", def.costList.Select(c => c.count + " " + c.thingDef.defName)));
        }

        // ------------------------------------------------------------------ the language as the game loaded it

        [Then("Japanese Homestead: the game language is {word}")]
        public void LanguageIs(PickleContext ctx, string folderName)
        {
            string active = LanguageDatabase.activeLanguage.folderName;
            ctx.Assert(active == folderName, $"the pass runs in {active}, not {folderName}");
        }

        private static readonly Regex Japanese = new Regex(@"[぀-ヿ㐀-䶿一-鿿]");

        /// <summary>
        /// The original mod's text was Japanese in places. In an English or a French pass, none of it may reach a
        /// label, a description or a job report. Developer mode (which every Pickle run has) shows a missing key as
        /// accented gibberish, so what this catches is Japanese left in the def itself, not a missing key.
        /// </summary>
        [Then("Japanese Homestead: no label, description or report of the mod's defs contains Japanese characters")]
        public void NoJapanese(PickleContext ctx)
        {
            ModContentPack pack = LoadedModManager.RunningMods.FirstOrDefault(m => m.PackageId.Equals(ModPackageId, StringComparison.OrdinalIgnoreCase));
            ctx.Require(pack != null, $"mod {ModPackageId} is not running");
            var offenders = new List<string>();
            foreach (Def def in pack.AllDefs)
            {
                foreach (string text in new[] { def.label, def.description, (def as JobDef)?.reportString })
                {
                    if (!string.IsNullOrEmpty(text) && Japanese.IsMatch(text))
                    {
                        offenders.Add(def.GetType().Name + " " + def.defName + ": " + text.Replace("\n", " "));
                        break;
                    }
                }
            }

            ctx.Assert(offenders.Count == 0,
                $"{offenders.Count} defs keep Japanese text in the pass's language ({LanguageDatabase.activeLanguage.folderName}): " +
                string.Join(" | ", offenders.Take(8)));
        }
    }
}
