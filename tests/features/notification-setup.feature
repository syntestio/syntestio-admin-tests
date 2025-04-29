Feature: Notification Preferences

Background: 
  Given I am logged in

@notifications
Scenario: Toggle notification settings
  When I navigate to profile Settings page showing notifications, plan, and account management sections
  And I enable all notification options if disabled
  And I save changes
  And I navigate to dashboard
  And I navigate to profile Settings page showing notifications, plan, and account management sections
  Then I should see all notification options enabled
  When I disable all notification options if enabled
  And I save changes
  And I navigate to dashboard
  And I navigate to profile Settings page showing notifications, plan, and account management sections
  Then I should see all notification options disabled




