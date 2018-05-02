Feature: Register

    @skip
    Scenario: If I input valid data in email and username fields I should be sent confirmation message

        Given I visit the DemoQA homepage
        And I navigate to the register page
        When I submit a valid email and username
        Then I receive the confirmation message

    @skip
    Scenario: If I am on my email which has a registration complete email I should open the generated link to create password

        Given I am on the email homepage
        And I successfully logged in
        When I click the confirmation email
        Then I navigate to the password creating page

    @skip
    Scenario: If I open the password generation link I should be able to create my own password

        Given I am on the password creating page
        When I submit the valid password
        Then I should have successfully created an account
