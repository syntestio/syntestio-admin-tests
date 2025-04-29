<div align="center">
  <img src="https://syntestio.com/logo-small.png" alt="Syntestio Logo" height="40"/>
  <h3>End-to-End Test Automation for Syntestio.com</h3>
</div>

## Overview

This project contains end-to-end automated tests for the Syntestio platform, using Syntestio's own test automation tool. The tests cover the core functionality of syntestio.com including:

- Authentication (login and registration)
- Dashboard navigation
- Project management
- Account settings
- API keys management
- Teams management
- Notification setup
- Subscription tiers

## Test Structure

The tests are organized into feature files located in the `tests/features` directory:

- `auth.feature` - Login, registration, and account management tests
- `navigation.feature` - Dashboard navigation tests
- `project.feature` - Project creation and management tests
- `apikeys.feature` - API key management tests
- `team.feature` - Team collaboration features tests
- `tiers.feature` - Subscription tier selection and management tests
- `notification-setup.feature` - Notification configuration tests

## Configuration

The test execution is configured in `config.json`, which specifies:

- API key (populated from GitHub Secrets during CI runs)
- Target application URL
- Test directory structure
- Execution mode (headless/headed)
- Retry configuration

## GitHub Actions Integration

This project uses GitHub Actions workflows for automated test execution:

- `.github/workflows/syntestio-tests.yml` - Main workflow triggered on push and PR events
- `.github/workflows/syntestio-github-test-execution-template.yml` - Reusable template workflow

The workflows handle:

- Setting up the testing environment
- Substituting sensitive values from GitHub Secrets
- Executing tests in headless mode
- Collecting and uploading test reports

### Sensitive Data Handling

Sensitive data is managed through:

- `tests/secrets.feature` containing placeholder values that are replaced during CI pipeline execution
- GitHub Secrets for API keys, user credentials, and other sensitive information

## Getting Started

### Prerequisites

- Node.js 18 or higher
- Syntestio CLI installed (`npm install -g @syntestio/cli-linux` or platform-specific variant)
- A Syntestio API key

### Local Setup

1. Clone this repository
2. Update `config.json` with your Syntestio API key
3. Run tests with `syn --config config.json`
4. Replace sensitive data in `tests/secrets.feature` with actual values

## Documentation & Resources

- [Syntestio Documentation](https://syntestio.com/doc/quickstart)
- [GitHub Actions Integration Guide](https://syntestio.com/doc/github-template)
- [Syntestio Website](https://syntestio.com)
