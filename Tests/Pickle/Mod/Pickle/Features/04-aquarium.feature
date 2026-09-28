# The aquarium used to cost glass cullet, which no longer exists. It costs wood and steel, and a patch switches it back
# to wood and glass when Glass+Lights is installed. The offline suite proves both costs by applying the patch itself
# (Tests/Test-Mod.ps1); this proves them on the def the game's OWN patch pass produced, in the two passes that differ
# by that one mod. TESTING.md scenario 3.
#
# The bare scenario is tagged @without-optional and the glass pass excludes it (README, "Passes"): in a pass that
# stages Glass+Lights it would be false by design.
Feature: the aquarium's cost

  Background:
    Given the save "test-colony" is loaded

  @without-optional @timeout:60
  Scenario: without Glass+Lights the aquarium costs wood and steel
    Then mod "NanoCE.GlassLights" is not loaded
    And Japanese Homestead: the def "WA_Aquarium" costs 80 of "WoodLog"
    And Japanese Homestead: the def "WA_Aquarium" costs 40 of "Steel"
    And Japanese Homestead: the def "WA_Aquarium" does not cost "Glass"
    And no errors were logged

  @requires:NanoCE.GlassLights @timeout:60
  Scenario: with Glass+Lights the aquarium costs wood and glass, and no steel
    Then mod "NanoCE.GlassLights" is loaded
    And Japanese Homestead: the def "WA_Aquarium" costs 80 of "WoodLog"
    And Japanese Homestead: the def "WA_Aquarium" costs 60 of "Glass"
    And Japanese Homestead: the def "WA_Aquarium" does not cost "Steel"
    And no errors were logged
