# The joy givers of the pastimes, asked as the game asks them (CanBeGivenTo, then TryGiveJob) instead of waiting for
# recreation time to roll their baseChance, which the base game owns. What is checked is the mod's part: the giver
# finds THIS building, gives ITS job, and the colonist starts it. TESTING.md scenario 4.
#
# Not here: the tea ceremony (Make_GreenTea and Drink_GreenTea need tea leaves and hot water to be worth a run, and
# the recipes are proved offline) and the tobacco pipe (a vanilla-shaped giver on a brazier).
Feature: the pastimes

  Background:
    Given the save "test-colony" is loaded

  @timeout:180
  Scenario Outline: the giver <giver> sends a colonist to the <building> and the colonist starts the job
    Given a colonist "Player" exists
    And "Player" needs "Joy" is set to 10 percent
    And Japanese Homestead: a "<building>" named "Piece" stands on open ground
    And game speed is ultrafast
    When Japanese Homestead: the joy giver "<giver>" sends "Player" to the "Piece"
    Then Japanese Homestead: "Player" is doing the job of the joy giver "<giver>" within 30 seconds
    And no errors were logged

    Examples:
      | giver             | building         |
      | Play_Koto         | WA_Koto          |
      | Play_PoemCardGame | WA_Karuta        |
      | Play_BozuMekuri   | WA_Karuta        |
      | Play_ShellMatching| WA_ShellMatching |
      | Play_Sugoroku     | WA_Sugoroku      |
      | WatchTheFire      | WA_Irori         |
      | Enjoy_Aroma       | WA_Cassolette    |
      | Enjoy_Aquarium    | WA_Aquarium      |

  # The other half of "finds THIS building": with none on the map, the giver has nothing to offer.
  @timeout:120
  Scenario: with no koto on the map the giver offers nothing
    Given a colonist "Alone" exists
    And "Alone" needs "Joy" is set to 10 percent
    Then Japanese Homestead: the joy giver "Play_Koto" offers "Alone" nothing
