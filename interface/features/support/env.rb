require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

case ENV["BROWSER"]
when "firefox"
    @driver = :selenium
when "chrome"
    @driver = :selenium_chrome
when "headless"
    @driver = :selenium_chrome_headless
else
    puts "Browser inválido!"
end
Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app,:browser => :selenium,timeout: 30)
end

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = "https://connect-sandbox.moip.com.br"
    config.default_max_wait_time = 10
end