Feature: Add / edit equipment
  In order to add new pieces of equipment
  As a System Admin
  I want to log in and create, update, and delete a piece of equipment

  @api
  Scenario: Logging in and adding a new piece of equipment
    Given I am logged in as a user with the "System Admin" role
      And I am on "/node/add/equipment"
    When I fill in "edit-title-0-value" with "Behat Test Equipment"
      And I plug lorem ipsum into the "edit-field-description-0-value" field
      And I fill in "edit-field-equipment-type-0-target-id" with "Program"
      And I attach the file "dummy-image-320x200.png" to "edit-field-primary-image-0-upload"
      And I press "Save"
      And I fill in "edit-field-primary-image-0-alt" with "Behat image alt text"
      And I press "Save"
    Then I should see "Equipment Behat Test Equipment has been created."
    When I am on "/admin/content?type=equipment"
      And I click "Behat Test Equipment"
      And I click "Edit"
      And I fill in "edit-title-0-value" with "Behat Test Equipment Edited"
      And I press "Save"
    Then I should see "Equipment Behat Test Equipment Edited has been updated."
    When I am on "/admin/content?type=equipment"
      And I click "Behat Test Equipment Edited"
      And I click "Delete"
      And I press "Delete"
    Then I should see "The Equipment Behat Test Equipment Edited has been deleted."
    # DEBUG: Then save the HTML page to tmp

    # @TODO: If its never been used it can be deleted,
    # or if no one is using it anymore it could be archived?
