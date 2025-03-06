@regression @login
Feature: WebdriverUniversity.com - Login Portal Page

  // Background: Pre conditions
  //   Given I navigate to the webdriverunviersity homepage
  //   When I click on the login portal button
  //   And I switch to the new browser tab

  Scenario Outline: Validate valid & invalid Login
    Given I navigate to the WebdriverUniversity login page
    And I type a username <username>
    And I type a password <password>
    And I wait for 2 seconds
    And I click on the login button
    Then I should be presented with an alert box which contains text '<expectedAlertText>'

    Examples:
      | username | password | expectedAlertText |
      | webdriver | webdriver123 | validation succeeded |
      | webdriver | Password123 | validation failed |

    @smoke
      Examples:
      | username | password | expectedAlertText |
      | webdriver | webdriver123 | validation succeeded |
