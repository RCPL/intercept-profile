Feature: Set up / edit equipment categories
  In order to add brand new categories of equipment
  As a System Admin
  I want to log in and create, update, and delete a category

  @api
  Scenario: Logging in and adding a new category
    Given I am logged in as a user with the "System Admin" role
      And I am on "/admin/structure/taxonomy/manage/equipment_category/overview"
    When I click "Add term"
      And I fill in "edit-name-0-value" with "Behat Test Category"
      And I plug lorem ipsum into the "edit-description-0-value" field
      And I attach the file "dummy-image-320x200.png" to "edit-field-equipment-category-image-0-upload"
      And I press "Save"
      And I fill in "edit-field-equipment-category-image-0-alt" with "Behat image alt text"
      And I press "Save"
    Then I should see "Created new term"
    When I am on "/admin/structure/taxonomy/manage/equipment_category/overview"
      And I click "Behat Test Category"
      And I click "Edit"
      And I fill in "edit-name-0-value" with "Behat Test Category Edited"
      And I press "Save"
    Then I should see "Updated term"
    When I am on "/admin/structure/taxonomy/manage/equipment_category/overview"
      And I click "Behat Test Category Edited"
      And I click "Edit"
      And I click "Delete"
      And I press "Delete"
    Then I should see "Deleted term"
