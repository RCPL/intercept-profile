Feature: Set up / edit locations and rooms
  In order to add new locations and rooms
  As a System Admin
  I want to log in and create, update, and delete a location and a room

  @api
  Scenario: Logging in and adding a new location and room
    # Add/Edit Location
    Given I am logged in as a user with the "System Admin" role
      And I am on "/node/add/location"
    When I fill in "edit-title-0-value" with "Behat Test Location"
      And I plug lorem ipsum into the "edit-field-description-0-value" field
      And I attach the file "dummy-image-320x200.png" to "edit-field-primary-image-0-upload"
      And I press "Save"
      And I fill in "edit-field-primary-image-0-alt" with "Behat image alt text"
      And I press "Save"
    Then I should see "Location Behat Test Location has been created."
    When I am on "/admin/content?type=location"
      And I click "Behat Test Location"
      And I click "Edit"
      And I fill in "edit-title-0-value" with "Behat Test Location Edited"
      And I press "Save"
    Then I should see "Location Behat Test Location Edited has been updated."

    # Add/Edit/Delete Room
    When I am on "/node/add/room"
      And I fill in "edit-title-0-value" with "Behat Test Room"
      And I plug lorem ipsum into the "edit-field-description-0-value" field
      And I attach the file "dummy-image-320x200.png" to "edit-field-primary-image-0-upload"
      And I press "Save"
      And I fill in "edit-field-primary-image-0-alt" with "Behat image alt text"
      And I press "Save"
    Then I should see "Room Behat Test Room has been created."
    When I am on "/admin/content?type=room"
      And I click "Behat Test Room"
      And I click "Edit"
      And I fill in "edit-title-0-value" with "Behat Test Room Edited"
      And I press "Save"
    Then I should see "Room Behat Test Room Edited has been updated."
    When I am on "/admin/content?type=room"
      And I click "Behat Test Room Edited"
      And I click "Delete"
      And I press "Delete"
    Then I should see "The Room Behat Test Room Edited has been deleted."

    # Delete Location
    When I am on "/admin/content?type=location"
      And I click "Behat Test Location Edited"
      And I click "Delete"
      And I press "Delete"
    Then I should see "The Location Behat Test Location Edited has been deleted."
    # DEBUG: Then save the HTML page to tmp
