Feature: Application Navigation

@navigation
Scenario: Navigate through public pages
  When I click on 'Changelog' link in the header
  Then I should see changelog page with version history
  When I click on 'docs' in the header
  Then I should see documentation page
  When I click on 'Quickstart' in 'Guides' sidebar menu
  Then I should see 'Quickstart' documentation page
  When I click on 'Support' in header
  Then I should see Support center page
