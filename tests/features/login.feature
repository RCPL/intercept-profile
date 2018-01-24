@openedu @api
Feature: Logging in and out

  @javascript
  Scenario: Logging in and out as an anonymous user
    Given I am an anonymous user
    When I visit "/user/login"
    Then I should see "Username"
    And I should see "Password"
    And I fill in "name" with "rcpl"
    And I fill in "pass" with "rcpl"
    And I press "op"
    And I should see "admin"
    When I press "admin"
    Then I should see "Log out"
    When I click on ".logout a"
    Then I should be on "/"
    And I should see "Welcome"
