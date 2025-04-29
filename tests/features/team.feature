@var projectName2 = 'Project {random(7)}'
@var newProjectDescription = 'New project description'
@var newProjectName = 'Project {random(7)}'
@var unexistingEmail = 'test{random(7)}@syntestio.com'

Feature: Team Management

Background: 
  Given I am logged in
  And I have project assigned
  When I navigate to Team page

@team
Scenario: Search team members
  Then I should see team member list
  And I should see &userEmail as project owner
  When I search for part of owner's email
  Then I should see filtered list with owner's email
  When I search for non-existent email
  Then I should see empty team list

@team 
Scenario: Validate team member invitation
  When I click on 'Invite member' button to open modal
  And I enter invalid email 'admin' with role 'Reader' and try to submit modal
  Then I should see invalid email message
  When I enter existing email &userEmail with role 'Reader' and try to submit modal
  Then I should see message that user already exists
  When I enter non-registered email &unexistingEmail with role 'Reader' and try to submit modal
  Then I should see message that user needs to create account first

@team
Scenario: Invite and leave team
  When I remove &anotherUserEmail from team if present
  And I click on 'Invite member' button (only click button, not filling dialog form yet)
  And I invite &anotherUserEmail with role 'Reader'
  Then I should see &anotherUserEmail in team list
  When I log out
  And I log in as &anotherUserEmail with password &password (using the visible Submit button, not the aria-hidden one)
  And I select free tier if on tier selection page (otherwise skip)
  And I expand projects list in sidebar
  Then I should see &projectName in projects list
  When I select &projectName from projects list
  And I navigate to Team page
  Then I should see &anotherUserEmail with leave option
  When I leave team and confirm
  Then I should be on dashboard page and project &projectName should not be selected anymore
  When I expand projects list in sidebar (only if any projects exists, otherwise skip)
  Then I should not see &projectName in projects list

@team
Scenario: Remove team member
  When I remove &anotherUserEmail from team if present
  And I click on 'Invite member' button
  And I invite &anotherUserEmail with role 'Reader'
  Then I should see &anotherUserEmail in team list
  When I remove &anotherUserEmail from team
  And I remove all other team members until only &userEmail is left
  Then I should not see &anotherUserEmail in team list
  When I log out
  And I log in as &anotherUserEmail with password &password (using the visible Submit button, not the aria-hidden one)
  And I select free tier if on tier selection page (otherwise skip)
  And I expand projects list in sidebar (only if any projects exists, otherwise skip)
  Then I should not see &projectName in projects list
  



