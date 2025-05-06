@var apiKeyName = 'myApiKey'

Feature: API Keys Management

Background: 
  Given I am logged in
  And I have project assigned
  When I navigate to API keys page

@apikeys
Scenario: Create new API key
  Then I should see the API keys list (empty or not)
  When I create API key with name &apiKeyName
  Then I should see &apiKeyName in the API keys list
  And Secret key should be partially masked
  When I reveal secret value for &apiKeyName to see not masked API key
  Then I should see the full secret key without masking
  When I navigate to dashboard page
  Then I should see API key step marked as completed

@apikeys
Scenario: Remove API key
  When I create API key with random name if API keys list is empty
  And I remove ALL API keys until I am sure API keys list is empty
  Then I should see empty API keys list
  When I navigate to dashboard page
  Then I should see API key step marked as not completed
