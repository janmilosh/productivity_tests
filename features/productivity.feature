Feature: Exercise productivity page

  Background:
    Given I am on the productivity page

  Scenario: Add and subtract rows
    When I click the add row button 2 times
    Then there are 3 rows of entries
    When I click the remove row button 1 time
    Then there are 2 rows of entries
    When I click the remove row button 3 times
    Then there is 1 row of entries

  Scenario: Calculate clockout for normal day
    When in row 1, I enter time in of 8:14 and time out of 12:01
    And I click the add row button 1 time
    And in row 2, I enter time in of 12:36
    And I enter 450 treatment minutes
    And I enter 90% productivity
    Then the time out is 5:09
    And row 1 minutes equals 227
    And row 2 minutes equals 273
