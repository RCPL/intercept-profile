@openedu @api
Feature: News article(s)

  @javascript
  Scenario: Accessing the site news articles anonymously
    Given I am an anonymous user
    When I visit "/news"
    Then I should see "In The News"
    And I should see "The Latest from OpenEDU News"

  @javascript
  Scenario: Searching the site news articles anonymously
    Given I am an anonymous user
    When I visit "/news"
    And I fill in "search" with "Students"
    And I press "Search"
    And I wait 2 seconds
    Then I should not see "choices"

  @javascript
  Scenario: Administration content
    Given I am logged in as a user with the "administrator" role
    And I am on "/"
    When I go to "admin/content"
    Then I should see "Kevin Hu"
    And I should see "admin"
