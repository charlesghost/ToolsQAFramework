require 'capybara/dsl'

class DemoQaRegister 
    include Capybara::DSL

    attr_accessor :register_link_text, :username_id, :email_id, :register_button_id, :reset_password, :reset_button_id, :register_account_username, :register_email, :registration_completed_message, :registration_register_link, :registration_confirmation_message

    def initialize
        @register_link_text = 'Register'
        @username_id = 'user_login'
        @email_id = 'user_email'
        @register_button_id = 'wp-submit'
        @reset_password = 'pass1-text'
        @reset_button_id = 'wp-submit'
        @register_account_username = 'Username68790'
        @register_email = 'spartaglobaltest2@gmail.com'
        @registration_completed_message = 'Registration complete. Please check your email.'
        @registration_register_link = 'Enter your new password below.'
        @registration_confirmation_message = 'Your password has been reset. Log in'
    end

    def navigate_register_page
        click_link(@register_link_text)
    end

    def fill_in_username(username)
        fill_in(@username_id, :with => username)
    end

    def fill_in_email(email)
        fill_in(@email_id, :with => email)
    end

    def click_register_button
        click_button(@register_button_id)
    end

    def register_confirmation_message
        within(:id, 'login') do
            find(:css, 'p.message').text
        end
    end

    def fill_in_password(new_password)
        fill_in(@reset_password, :with => new_password)
    end

    def click_reset_password
        click_button(@reset_button_id)
    end

    def account_confirmation_message
        within(:id, 'login') do
            find(:css, 'p.reset-pass').text
        end
    end

    def check_register_link
        within(:css, 'body.login') do 
            within(:css, 'div#login') do
                find(:css, 'p.message').text
            end
        end
    end
end
