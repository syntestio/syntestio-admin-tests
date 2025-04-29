@var newProjectDescription = 'New project description'
@var newProjectName = 'Project {random(7)}'

Feature: Project Management

@projects
Scenario: Create new project
  Given I am logged in
  When I am on dashboard page
  And I remove all existing projects if any is assigned (select in project list and go to project settings page to see remove button) until project list is empty
  Then I should see information but no selected projects
  And I should not see any projects in the project list, but instead button to create new project
  When I create project with name &projectName and description &projectDescription
  Then I should see &projectName as my active project
  When I navigate to project settings page
  Then I should see project name &projectName and description &projectDescription
  When I navigate to dashboard
  And I try to create another project 'TestProject2' with any random description
  Then I should see validation message about project limit for my tier

@projects
Scenario: Edit project
  Given I am logged in
  And I have project assigned
  When I navigate to project settings page
  And I update project name to &newProjectName and description to &newProjectDescription
  Then I should see &newProjectName as my active project
  When I navigate to project settings page
  Then I should see project name &newProjectName and description &newProjectDescription
  When I update project name to &projectName and projectName to &projectDescription
  Then I should see &projectName as my active project

@projects
Scenario: Remove project
  Given I am logged in
  And I have project assigned
  When I navigate to project settings page
  And I remove project (please note there is no confirmation information about project removal, so I will be just redirected to dashboard page)
  Then I should see information about no selected projects
  When I create project with name &projectName and description &projectDescription
  Then I should see &projectName as my active project




