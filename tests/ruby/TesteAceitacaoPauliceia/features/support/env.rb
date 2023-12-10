require 'capybara/cucumber'
require 'selenium/webdriver'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument("--window-size=1600,900")


Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(
    app, 
    browser: :chrome,
    options: options
  )
end

Capybara.default_driver = :chrome
Capybara.default_selector = :css
