Feature: Set up / edit locations and rooms
  In order to add new locations and rooms
  As a System Admin
  I want to log in and create, update, and delete a location and a room

  @api
  Scenario: Logging in and adding a new location and room
    # Add/Edit Location
    Given I am logged in as a user with the "System Admin" role
      And I am on "/node/add/location"
    When I fill in "Location Name" with "Behat Test Location"
      And I plug lorem ipsum into the "Primary Content" field
      And I plug lorem ipsum into the "Intro Text" field
      And I attach the file "dummy-image-320x200.png" to "Primary Image"
      And I press "Save"
      And I fill in "Alternative text" with "Behat image alt text"
      # Open Hours
      And I fill in "edit-field-open-hours-value-0-starthours-hour" with "9"
      And I fill in "edit-field-open-hours-value-0-starthours-minute" with "0"
      And I fill in "edit-field-open-hours-value-0-endhours-hour" with "21"
      And I fill in "edit-field-open-hours-value-0-endhours-minute" with "0"
      And I fill in "edit-field-open-hours-value-2-starthours-hour" with "9"
      And I fill in "edit-field-open-hours-value-2-starthours-minute" with "0"
      And I fill in "edit-field-open-hours-value-2-endhours-hour" with "21"
      And I fill in "edit-field-open-hours-value-2-endhours-minute" with "0"
      And I fill in "edit-field-open-hours-value-4-starthours-hour" with "9"
      And I fill in "edit-field-open-hours-value-4-starthours-minute" with "0"
      And I fill in "edit-field-open-hours-value-4-endhours-hour" with "21"
      And I fill in "edit-field-open-hours-value-4-endhours-minute" with "0"
      And I fill in "edit-field-open-hours-value-6-starthours-hour" with "9"
      And I fill in "edit-field-open-hours-value-6-starthours-minute" with "0"
      And I fill in "edit-field-open-hours-value-6-endhours-hour" with "21"
      And I fill in "edit-field-open-hours-value-6-endhours-minute" with "0"
      And I fill in "edit-field-open-hours-value-8-starthours-hour" with "9"
      And I fill in "edit-field-open-hours-value-8-starthours-minute" with "0"
      And I fill in "edit-field-open-hours-value-8-endhours-hour" with "21"
      And I fill in "edit-field-open-hours-value-8-endhours-minute" with "0"
      And I fill in "edit-field-open-hours-value-10-starthours-hour" with "9"
      And I fill in "edit-field-open-hours-value-10-starthours-minute" with "0"
      And I fill in "edit-field-open-hours-value-10-endhours-hour" with "21"
      And I fill in "edit-field-open-hours-value-10-endhours-minute" with "0"
      And I fill in "edit-field-open-hours-value-12-starthours-hour" with "9"
      And I fill in "edit-field-open-hours-value-12-starthours-minute" with "0"
      And I fill in "edit-field-open-hours-value-12-endhours-hour" with "21"
      And I fill in "edit-field-open-hours-value-12-endhours-minute" with "0"
      # End Open Hours
      And I fill in "Contact Number" with "(803) 799-9084"
      And I fill in "Street address" with "1431 Assembly St."
      And I fill in "City" with "Columbia"
      And I fill in "Zip code" with "29201"
      And I fill in "Map Link" with "https://www.google.com/maps/place/Richland+Library+Main/@34.004159,-81.0395968,17z/data=!3m1!4b1!4m5!3m4!1s0x88f8a4d350c8150f:0x5984db0f9984221a!8m2!3d34.0041546!4d-81.0374081"
      And I fill in "Branch Location" with "library"
      And I press "Save"
    Then I should see "Location Behat Test Location has been created."
    When I am on "/admin/content?type=location"
      And I click "Behat Test Location"
      And I click "Edit"
      And I fill in "Location Name" with "Behat Test Location Edited"
      And I press "Save"
    Then I should see "Location Behat Test Location Edited has been updated."


    # Add/Edit/Delete Room
    When I am on "/node/add/room"
      And I fill in "Room Name and Number" with "Behat Test Room"
      And I plug lorem ipsum into the "Intro Text" field
      And I plug lorem ipsum into the "Teaser Text" field
      And I plug lorem ipsum into the "Primary Content" field
      And I plug lorem ipsum into the "Equipment in Room" field
      And I plug lorem ipsum into the "Fees" field
      And I attach the file "dummy-image-320x200.png" to "Primary Image"
      And I press "Save"
      And I fill in "Alternative text" with "Behat image alt text"
      And I fill in "Min. Capacity" with "20"
      And I fill in "Max. Capacity" with "100"
      And I fill in "Room Type" with "Auditorium"
      And I fill in "Location" with "Behat Test Location Edited"
      And I check "Staff Use Only"
      And I press "Save"
    Then I should see "Room Behat Test Room has been created."
    When I am on "/admin/content?type=room"
      And I click "Behat Test Room"
      And I click "Edit"
      And I fill in "Room Name and Number" with "Behat Test Room Edited"
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
