# A save taken while the aura is running, reloaded. WaAuraMapComponent is a MapComponent registered by Scribe under
# its full type name; what has to survive is that the map loads clean and the pulses go on. Every pawn is found again
# by name after the reload: the objects held before it belong to the game that was replaced. TESTING.md scenario 2.
Feature: a save with the aura running

  Background:
    Given the save "test-colony" is loaded

  @timeout:400
  Scenario: a save taken with a friend already heartened loads clean and the pulses go on
    Given a colonist "Princess" exists
    And a colonist "Near" exists
    And Japanese Homestead: "Princess" stands on a row of open ground 8 cells long
    And "Princess" is wearing "WA_Dressing_Princess"
    And Japanese Homestead: "Near" stands 5 cells east of "Princess"
    And game speed is ultrafast
    When Japanese Homestead: I wait for 1 pulses of the aura of "WA_Dressing_Princess"
    Then Japanese Homestead: "Near" carries "HDA_Hediff_EncouragementOfThePrincess" at a severity above zero and at most 1.0
    When I save and reload
    Then no errors were logged
    And Japanese Homestead: "Near" carries "HDA_Hediff_EncouragementOfThePrincess" at a severity above zero and at most 1.0
    When Japanese Homestead: I wait for 2 pulses of the aura of "WA_Dressing_Princess"
    Then Japanese Homestead: "Near" carries "HDA_Hediff_EncouragementOfThePrincess" at a severity above zero and at most 1.0
    And no errors were logged
