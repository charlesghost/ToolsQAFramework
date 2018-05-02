require 'capybara/dsl'

class GmailHomepage
    include Capybara::DSL

    attr_accessor :url, :gmail_username_id, :gmail_password_id, :search_id, :log_in_username, :log_in_password

    def intialize
        @url = "https://accounts.google.com/ServiceLogin/identifier?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&ss=1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=AddSession"
        @gmail_username_id = "identifierId"
        @gmail_password_id = "password"
        @search_id = 'gbqfq'
        @log_in_username = 'spartaglobaltest2@gmail.com'
        @log_in_password = 'Password!123'
    end

    def visit_home_page
        visit(@url)
    end

    def fill_in_username email
        fill_in(@gmail_username_id, :with => email )
    end

    def click_next_after_inputing_username
        find(:css, 'div#identifierNext').click
    end

    def fill_in_password password
        fill_in(@gmail_password_id, :with => password)
    end

    def click_next_after_inputing_password
        find(:css, 'div#passwordNext').click
    end

    def click_on_more
        find(:css, 'span.CJ').click
    end

    def fill_in_search_with_spam(spam_text)
        fill_in(@search_id, :with => spam_text )
    end

    def click_search
        find(:id, "gbqfb").click
    end

    def click_spam_email
        click_link('Spam')
    end

    def click_on_email
        within(:css, 'table.F') do
            find('tr').click
        end
    end

    def click_on_confirmation_link
        within(:css, 'div.a3s') do
            @confirmation_link = find('a').text
        end
    end

    def visit_password_set_page
        visit(@confirmation_link)
    end
end
