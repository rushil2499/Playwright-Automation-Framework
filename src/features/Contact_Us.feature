@regression @contact-us
Feature: WebdriverUniversity.com - Contact Us Page

Background: Pre conditions
    Given I navigate to the Webdriveruniversity homepage
    When I click on the contact us button
    And I switch to the new browser tab

Scenario: Valid Contact Us Form Submission
    And I type a first name
    And I type a last name
    And I enter an email address
    And I type a comment
    And I click on the submit button
    Then I should be presented with a successful contact us submission message


Scenario: Invalid Contact Us Form Submission
    And I type a first name
    And I type a last name
    And I enter an email address
    # And I type a comment
    And I click on the submit button
    Then I should be presented with a unsuccessful contact us message

Scenario: Valid Contact Us Form Submission - Using Specific Data
    And I type a specific first name "Rushil"
    And I type a specific last name "Panchal"
    And I enter a specific email address "rushill_123@example.com"
    And I type specific text "Hello World!" and a number 2 within the comment input field
    And I click on the submit button
    Then I should be presented with a successful contact us submission message


Scenario: Contact Us Form Submission - Using Random Data
    And I type a random first name
    And I type a randon last name
    And I enter a random email address
    And I type a comment
    And I click on the submit button
    Then I should be presented with a successful contact us submission message

@smoke
Scenario Outline: Validate Contacct Us Page
    And I type a first name '<firstName>' and a last name '<lastName>'
    And I type a email address '<emailAddress>' and a comment '<comment>'
    And I click on the submit button
    Then I should be presented with a header text '<message>'

Examples:
      | firstName | lastName | emailAddress | comment | message |
      | Rushil | Panchal | rushil_123@example.com    | Hello world ? | Thank you for your Message! |
      | Mia | Carter | mia_carter123@example.com | Test123 Test123 ? | Thank you for your Message! |
      | Grace | Hudson | grace_hudson@example.com | Do you create websites ? | Invalid email address |
