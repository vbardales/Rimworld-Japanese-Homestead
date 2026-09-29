# The two aura kimonos. WaAuraMapComponent pulses from the MAP because 1.6 never ticks worn apparel, so what has to be
# seen in a running game is the pulse itself: who receives it, who does not, and that it stops. The numbers in the
# defs (range, interval, severity) are proved offline; nothing here restates them. TESTING.md scenarios 5 and 6.
#
# Princess: range 10, friends only. Rikishi: range 15, enemies only. Severity is bounded by 1.0 in both.
Feature: the aura kimonos

  Background:
    Given the save "test-colony" is loaded

  @timeout:300
  Scenario: the princess's kimono heartens a friend in range, and only a friend in range
    Given a colonist "Princess" exists
    And a colonist "Near" exists
    And a colonist "Far" exists
    And Japanese Homestead: "Princess" stands on a row of open ground 13 cells long
    And I dress "Princess" in "WA_Dressing_Princess"
    And Japanese Homestead: "Near" stands 5 cells east of "Princess"
    And Japanese Homestead: "Far" stands 12 cells east of "Princess"
    And Japanese Homestead: a hostile pawn "Foe" lies unconscious 5 cells east of "Princess"
    And game speed is ultrafast
    When Japanese Homestead: I wait for 2 pulses of the aura of "WA_Dressing_Princess"
    Then Japanese Homestead: "Near" carries "HDA_Hediff_EncouragementOfThePrincess" at a severity above zero and at most 1.0
    And Japanese Homestead: "Far" carries no "HDA_Hediff_EncouragementOfThePrincess"
    And Japanese Homestead: "Princess" carries no "HDA_Hediff_EncouragementOfThePrincess"
    And Japanese Homestead: "Foe" carries no "HDA_Hediff_EncouragementOfThePrincess"
    And no errors were logged

  @timeout:300
  Scenario: the rikishi's kimono cows an enemy in range, and no friend
    Given a colonist "Rikishi" exists
    And a colonist "Friend" exists
    And Japanese Homestead: "Rikishi" stands on a row of open ground 18 cells long
    And I dress "Rikishi" in "WA_Dressing_Sumoman"
    And Japanese Homestead: "Friend" stands 5 cells east of "Rikishi"
    And Japanese Homestead: a hostile pawn "Near" lies unconscious 12 cells east of "Rikishi"
    And Japanese Homestead: a hostile pawn "Beyond" lies unconscious 17 cells east of "Rikishi"
    And game speed is ultrafast
    When Japanese Homestead: I wait for 2 pulses of the aura of "WA_Dressing_Sumoman"
    Then Japanese Homestead: "Near" carries "HDA_Hediff_IntimidateOfTheYokozuna" at a severity above zero and at most 1.0
    And Japanese Homestead: "Beyond" carries no "HDA_Hediff_IntimidateOfTheYokozuna"
    And Japanese Homestead: "Friend" carries no "HDA_Hediff_IntimidateOfTheYokozuna"
    And Japanese Homestead: "Rikishi" carries no "HDA_Hediff_IntimidateOfTheYokozuna"
    And no errors were logged

  # A pulse only comes from a wearer. Taking the kimono off must stop the hediff from being fed: the severity may fall
  # by its own decay, never rise.
  @timeout:400
  Scenario: the pulses stop when the kimono comes off
    Given a colonist "Princess" exists
    And a colonist "Near" exists
    And Japanese Homestead: "Princess" stands on a row of open ground 8 cells long
    And I dress "Princess" in "WA_Dressing_Princess"
    And Japanese Homestead: "Near" stands 5 cells east of "Princess"
    And game speed is ultrafast
    When Japanese Homestead: I wait for 1 pulses of the aura of "WA_Dressing_Princess"
    Then Japanese Homestead: "Near" carries "HDA_Hediff_EncouragementOfThePrincess" at a severity above zero and at most 1.0
    When Japanese Homestead: "Princess" takes off "WA_Dressing_Princess"
    And Japanese Homestead: I note the severity of "HDA_Hediff_EncouragementOfThePrincess" on "Near"
    And Japanese Homestead: I wait for 3 pulses of the aura of "WA_Dressing_Princess"
    Then Japanese Homestead: the severity of "HDA_Hediff_EncouragementOfThePrincess" on "Near" has not risen since it was noted
    And no errors were logged
