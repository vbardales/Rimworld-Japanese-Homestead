# Temporary diagnosis (2026-10-26), deleted with 07-control once the pastime reds are explained. The step of PickleTools
# forces the job of a joy giver on a colonist; when the giver returns no job it fails with the reason per candidate
# (reserve, forbidden, fog, social and political propriety, power, roof, the four cells next to the building).
# 2026-11-10: vanilla Play_Chess failed (c850) because the ChessTable giver requires a chair and the scene had none; WA givers do not set requireChair, so Play_Koto is asked now.
# Needs the ColonistRace companion of PickleTools (wsl-deps.diag.map); skipped where it is not loaded.
Feature: diagnosis, why a joy giver returns no job

  Background:
    Given the save "test-colony" is loaded

  @requires:nelim.pickletools.colonistrace @timeout:180
  Scenario: the giver Play_Koto near a WA_Koto, forced
    Given a colonist "Player" exists
    And "Player" needs "Joy" is set to 10 percent
    And Japanese Homestead: a "WA_Koto" named "Piece" stands on open ground
    And Japanese Homestead: "Player" stands near the "Piece"
    When Nelim's Pickle Tools: the joy giver "Play_Koto" job is forced on "Player"
    Then no errors were logged
