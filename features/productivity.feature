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
    And row 1 minutes is 227
    And row 2 minutes is 273

  Scenario: Calculate productivity for normal day
    When I click the add row button 1 time
    And in row 1, I enter time in of 8:14 and time out of 12:01
    And in row 2, I enter time in of 12:36 and time out of 5:09
    And I enter 450 treatment minutes
    Then the productivity is 90.0%
    And row 1 minutes is 227
    And row 2 minutes is 273

  Scenario: Calculate clockout for day with three entries
    When I click the add row button 2 times
    And in row 1, I enter time in of 9:15 and time out of 12:16
    And in row 2, I enter time in of 12:42 and time out of 1:00
    And in row 3, I enter time in of 2:20
    And I enter 425 treatment minutes
    And I enter 95% productivity
    Then the time out is 6:28
    And row 1 minutes is 181
    And row 2 minutes is 18
    And row 3 minutes is 248

  Scenario: Invalid Tx minutes
    When in row 1, I enter time in of 12:35 and time out of 1:01
    And I click Productivity
    Then Tx minutes is invalid

  Scenario: Invalid productivity and Tx minutes
    When in row 1, I enter time in of 9:14
    And I click Clock Out
    Then Tx minutes is invalid
    And Productivity is invalid
