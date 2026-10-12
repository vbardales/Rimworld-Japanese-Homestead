# Temporary control (2026-10-12), to be deleted once the pastime reds are explained. The seven pastime scenarios fail
# identically ("CanBeGivenTo holds but TryGiveJob returned no job") although the building is reachable, reservable and
# not forbidden. This asks the SAME question of a vanilla building and its vanilla giver, placed by the same step on the
# same ground: if the vanilla giver also offers nothing, the cause is the fixture, not the mod.
Feature: control, a vanilla pastime

  Background:
    Given the save "test-colony" is loaded

  @timeout:180
  Scenario: the vanilla giver Play_Chess sends a colonist to a vanilla ChessTable
    Given a colonist "Player" exists
    And "Player" needs "Joy" is set to 10 percent
    And Japanese Homestead: a "ChessTable" named "Piece" stands on open ground
    And game speed is ultrafast
    When Japanese Homestead: the joy giver "Play_Chess" sends "Player" to the "Piece"
    Then Japanese Homestead: "Player" is doing the job of the joy giver "Play_Chess" within 30 seconds
    And no errors were logged
