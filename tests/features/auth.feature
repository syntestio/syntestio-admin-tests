@var newRegisteredAccountEmail = 'syntestioTest{random(7)}@gmail.com'

Feature: Authentication

@auth
Scenario: Navigate to login page
  When I navigate to login page
  Then I should be on the login page

@auth
Scenario: Successful login
  Given I am logged in
  Then I should see page to choose a plan or dashboard page

@auth
Scenario: Unsuccessful login
  When I navigate to login page
  And I enter invalid credentials 'invalid{random(7)}@gmail.com' and 'invalidPassword123!'
  And I click on 'Continue' button (using the visible Submit button, not the aria-hidden one) and I see validation error message 
  Then I should see login error message

@auth
Scenario: Register new user and then remove account
  When I navigate to login page
  And I go to sign up form
  And I create account with email &newRegisteredAccountEmail and password &password (using the visible Submit button, not the aria-hidden one), then I see page to choose a plan
  Then I should see page to choose a plan
  When I select free tier
  Then I should see dashboard page
  When I navigate to profile Settings page showing notifications, plan, and account management sections
  And I delete my account. If after deletion I was not redirected to login page, then it means account was not deleted successfully, so I will try again
  Then I should see login page