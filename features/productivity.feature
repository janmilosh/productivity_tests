Feature: Exercise productivity page

  Background:
    Given I am on the productivity page

  Scenario:
    When I click the add row button twice
    Then there are three rows of entries
    When I click the remove row button once
    Then there are two rows of entries