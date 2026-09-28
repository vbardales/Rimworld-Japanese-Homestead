# The language is fixed at staging (-Language English, -Language French) and never switched inside a run:
# SelectLanguage reloads every def under the runner and the run dies with it. The offline suite proves that every
# key resolves (Check-DefInjected.ps1, 1,896 keys); this proves what the game shows once it has loaded them, in
# the language of the pass. TESTING.md scenario 7.
#
# Two passes play this feature, one per language, and each states which language it ran in.
Feature: the mod's texts in the language of the pass

  Background:
    Given the save "test-colony" is loaded

  @english @timeout:60
  Scenario: the English pass reads English
    Then Japanese Homestead: the game language is English
    And Japanese Homestead: no label, description or report of the mod's defs contains Japanese characters
    And no errors were logged

  @french @timeout:60
  Scenario: the French pass reads French
    Then Japanese Homestead: the game language is French
    And Japanese Homestead: no label, description or report of the mod's defs contains Japanese characters
    And no errors were logged
