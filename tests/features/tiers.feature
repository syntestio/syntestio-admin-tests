@var newTierAccountEmail = 'syntestioTest{random(7)}@gmail.com'

Feature: Subscription Plans

@tiers 
Scenario: View tiers after registration
  When I navigate to login page
  And I go to sign up form
  And I create account with email &newTierAccountEmail and password &password (using the visible Submit button, not the aria-hidden one) until I see select tier page
  Then I should see tiers page

@tiers 
Scenario: Verify current plan in account settings
  When I navigate to login page
  And I login with credentials &userEmail and password &password (using the visible Submit button, not the aria-hidden one) until I am on dashboard page 
  And I navigate to profile Settings page showing notifications, plan, and account management sections
  Then I should see "Free" as my current plan

@tiers 
Scenario: Review subscription options
  When I navigate to login page
  And I login with credentials &userEmail and password &password (using the visible Submit button, not the aria-hidden one) until I am on dashboard page 
  And I navigate to profile Settings page showing notifications, plan, and account management sections
  And I click on "Change plan" button
  Then I should see plan selection page with "Free" plan selected
  When I select a paid plan option (but don't finish payment process - just redirect to it)
  Then I should see subscription payment page
