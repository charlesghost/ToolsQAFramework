require 'capybara/cucumber'
require 'capybara/dsl'
require_relative '../lib/demoqa_site'
require_relative '../lib/gmail_site'

Capybara.register_driver :chrome do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.configure do |config|
	config.ignore_hidden_elements = false # hidden elements are available to capybara
	config.default_max_wait_time = 10 # asynchronous process wait time
	config.match = :prefer_exact 
	config.default_driver = :chrome
end

World(DemoSite)
World(GmailSite)