# Temporary diagnosis (2026-10-26), deleted with 07-control once the pastime reds are explained. The step of PickleTools
# forces the job of a joy giver on a colonist; when the giver returns no job it fails with the reason per candidate
# (reserve, forbidden, fog, social and political propriety, power, roof, the four cells next to the building).
# Asked of the vanilla Play_Chess first: its failure text names the cause that 07-control only reports as "no job".
# Needs the ColonistRace companion of PickleTools (wsl-deps.diag.map); skipped where it is not loaded.
Feature: diagnosis, why a joy giver returns no job

  Background:
    Given the save "test-colony" is loaded

  @requires:nelim.pickletools.colonistrace @timeout:180
  Scenario: the vanilla giver Play_Chess near a vanilla ChessTable, forced
    Given a colonist "Player" exists
    And "Player" needs "Joy" is set to 10 percent
    And Japanese Homestead: a "ChessTable" named "Piece" stands on open ground
    And Japanese Homestead: "Player" stands near the "Piece"
    When Nelim's Pickle Tools: the joy giver "Play_Chess" job is forced on "Player"
    Then no errors were logged
