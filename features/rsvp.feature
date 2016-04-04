Feature:
  As a guest
  I want to be able to submit my RSVP
  So that I can notify my attendance

Scenario: Opening the rsvp modal
  Given I visit the site
  And I click on the rsvp menu
  Then the rsvp modal should be visible
