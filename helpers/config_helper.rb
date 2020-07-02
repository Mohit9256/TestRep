require 'capybara'
require 'capybara/dsl'
require 'rspec/core'
require 'capybara/rspec/matchers'
require 'capybara/rspec/features'	
require "selenium-webdriver"
require 'capybara/rspec'

Capybara.register_driver :chrome do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :chrome 


Capybara.configure do |config|
	config.app_host = "https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin"
	config.ignore_hidden_elements = true 
	config.run_server = false
	config.match =:prefer_exact
	config.default_max_wait_time = 4 # the default time is 2 seconds
	config.current_session.driver.browser.manage.window.maximize
end

RSpec.configure do |config|
	config.include Capybara::DSL, :type => :request
	config.include Capybara::DSL, :type => :acceptance
	config.include Capybara::RSpecMatchers, :type => :request
	config.include Capybara::RSpecMatchers, :type => :acceptance
	
	config.after do
		Capybara.use_default_driver
	end 
end