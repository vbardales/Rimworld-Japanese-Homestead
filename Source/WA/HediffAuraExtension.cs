using Verse;

namespace WA
{
    // Carried by the two aura kimonos. Replaces HealthDifferenceAuraCore's
    // ThingDef_HediffAura, which was a custom ThingDef subclass; a mod extension
    // does the same job without owning the def's type.
    public class HediffAuraExtension : DefModExtension
    {
        // The wearer must belong to the player faction for the aura to run.
        public bool enableOnlyPlayerFaction = true;

        // Severity handed out on each pulse, and the ceiling it accumulates to.
        public float addHediffSeverity = 0.5f;
        public float maxHediffSeverity = 1f;

        // Radius in cells, and the interval between two pulses.
        public float auraDistance = 10f;
        public int auraTickInterval = 1000;

        // What the aura applies, and to whom.
        public HediffDef hediffToAdd;
        public bool targetsEnemies = false;
    }
}
