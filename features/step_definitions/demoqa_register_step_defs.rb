Given("I navigate to the register page") do
    demo_homepage.click_on_my_account_button
    demo_register.navigate_register_page
end

When("I submit a valid email and username") do
    demo_register.fill_in_username(demo_register.register_account_username)
    demo_register.fill_in_email(demo_register.register_email)
    demo_register.click_register_button
end

Then("I receive the confirmation message") do
    expect(demo_register.register_confirmation_message).to eq demo_register.registration_completed_message
end

Given("I am on the email homepage") do
    gmail_homepage.visit_home_page
end

Given("I successfully logged in") do
    gmail_homepage.fill_in_username(gmail_homepage.log_in_username)
    gmail_homepage.click_next_after_inputing_username
    gmail_homepage.fill_in_password(gmail_homepage.log_in_password)
    gmail_homepage.click_next_after_inputing_password
end

When("I click the confirmation email") do
    gmail_homepage.click_on_more
    gmail_homepage.click_spam_email
    gmail_homepage.click_on_email
end

Then("I navigate to the password creating page") do
    @gmail = gmail_homepage
    @gmail.click_on_confirmation_link
end

Given("I am on the password creating page") do
    @gmail.visit_password_set_page
    expect(demo_register.check_register_link).to eq demo_register.registration_register_link
end

When("I submit the valid password") do
    gmail_homepage.fill_in_password('Password!23456')
    demo_register.click_reset_password
end

Then("I should have successfully created an account") do
    expect(demo_register.account_confirmation_message).to eq demo_register.registration_confirmation_message
end
