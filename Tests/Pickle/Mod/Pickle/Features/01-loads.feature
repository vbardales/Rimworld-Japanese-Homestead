# The mod as the game's OWN loader built it. The XML, the cross-references and the translation keys are proved offline
# (Tests/Test-Mod.ps1, Check-DefInjected.ps1); this is the same defs after the game read them, patches applied, and the
# config errors only the loader can raise. TESTING.md scenario 1.
Feature: Japanese Homestead loads

  Background:
    Given the save "test-colony" is loaded

  @timeout:60
  Scenario: the mod loads and the game holds its key defs
    Then mod "nelim.japanesehomestead" is loaded
    And def "WA_Aquarium" of type "ThingDef" exists
    And def "WA_Irori" of type "ThingDef" exists
    And def "WA_Koto" of type "ThingDef" exists
    And def "WA_Dressing_Princess" of type "ThingDef" exists
    And def "WA_Dressing_Sumoman" of type "ThingDef" exists
    And def "HDA_Hediff_EncouragementOfThePrincess" of type "HediffDef" exists
    And def "HDA_Hediff_IntimidateOfTheYokozuna" of type "HediffDef" exists
    And def "Play_Koto" of type "JoyGiverDef" exists
    And def "Enjoy_ChanoYu" of type "JoyKindDef" exists
    And no errors were logged
    And no warnings from mod "nelim.japanesehomestead"

  # The mod removed a component the game dropped after 1.0 from thirteen buildings; left in, it would have taken each
  # whole def down. If the loader had rejected one, the def would be missing here.
  @timeout:60
  Scenario Outline: the buildings that carried the dropped component are all there
    Then def "<def>" of type "ThingDef" exists

    Examples:
      | def                 |
      | WA_Fusuma01_Akebono |
      | WA_Futon01m         |
      | WA_Seat_Zabuton_Red |
      | WA_Cassolette       |
      | WA_Karuta           |
      | WA_ShellMatching    |
      | WA_Sugoroku         |
      | WA_SutrasDesk       |
      | WA_Chagama          |
