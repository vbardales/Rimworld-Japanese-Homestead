using System.Collections.Generic;
using RimWorld;
using UnityEngine;
using Verse;

namespace WA
{
    // Drives the two aura kimonos. HealthDifferenceAuraCore did this from the
    // apparel's own Tick(), but RimWorld 1.6 never ticks worn apparel:
    // Pawn_ApparelTracker only handles wear-and-tear and locked apparel, so a
    // tickerType on a piece of clothing does nothing once someone puts it on.
    // The pulse therefore has to come from the map.
    public class WaAuraMapComponent : MapComponent
    {
        private static List<ThingDef> auraApparelCached;

        public WaAuraMapComponent(Map map) : base(map)
        {
        }

        private static List<ThingDef> AuraApparel
        {
            get
            {
                if (auraApparelCached == null)
                {
                    auraApparelCached = new List<ThingDef>();
                    foreach (ThingDef def in DefDatabase<ThingDef>.AllDefsListForReading)
                    {
                        if (def.IsApparel && def.GetModExtension<HediffAuraExtension>()?.hediffToAdd != null)
                        {
                            auraApparelCached.Add(def);
                        }
                    }
                }

                return auraApparelCached;
            }
        }

        public override void MapComponentTick()
        {
            List<ThingDef> auras = AuraApparel;
            if (auras.Count == 0)
            {
                return;
            }

            // Cheap gate: on the vast majority of ticks nothing is due, and we
            // must not walk the pawn list to find that out.
            int now = Find.TickManager.TicksGame;
            bool anyDue = false;
            for (int i = 0; i < auras.Count; i++)
            {
                int interval = auras[i].GetModExtension<HediffAuraExtension>().auraTickInterval;
                if (interval > 0 && now % interval == 0)
                {
                    anyDue = true;
                    break;
                }
            }

            if (!anyDue)
            {
                return;
            }

            IReadOnlyList<Pawn> spawned = map.mapPawns.AllPawnsSpawned;
            for (int i = 0; i < spawned.Count; i++)
            {
                Pawn wearer = spawned[i];
                if (wearer.Dead || wearer.apparel == null)
                {
                    continue;
                }

                List<Apparel> worn = wearer.apparel.WornApparel;
                for (int j = 0; j < worn.Count; j++)
                {
                    HediffAuraExtension ext = worn[j].def.GetModExtension<HediffAuraExtension>();
                    if (ext?.hediffToAdd == null || ext.auraTickInterval <= 0 || now % ext.auraTickInterval != 0)
                    {
                        continue;
                    }

                    if (ext.enableOnlyPlayerFaction && wearer.Faction != Faction.OfPlayer)
                    {
                        continue;
                    }

                    Pulse(wearer, ext, spawned);
                }
            }
        }

        private static void Pulse(Pawn wearer, HediffAuraExtension ext, IReadOnlyList<Pawn> spawned)
        {
            float rangeSquared = ext.auraDistance * ext.auraDistance;

            for (int i = 0; i < spawned.Count; i++)
            {
                Pawn target = spawned[i];
                if (target == wearer || target.Dead || target.health == null)
                {
                    continue;
                }

                if (target.HostileTo(wearer) != ext.targetsEnemies)
                {
                    continue;
                }

                if ((target.Position - wearer.Position).LengthHorizontalSquared > rangeSquared)
                {
                    continue;
                }

                Hediff existing = target.health.hediffSet.GetFirstHediffOfDef(ext.hediffToAdd);
                if (existing != null)
                {
                    existing.Severity = Mathf.Min(ext.maxHediffSeverity, existing.Severity + ext.addHediffSeverity);
                    continue;
                }

                Hediff fresh = HediffMaker.MakeHediff(ext.hediffToAdd, target);
                fresh.Severity = Mathf.Min(ext.maxHediffSeverity, ext.addHediffSeverity);
                target.health.AddHediff(fresh);
            }
        }
    }
}
