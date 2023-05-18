module Parser
    require 'capybara'
    require 'capybara/dsl'
    require 'selenium-webdriver'
    
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :firefox)
    end
    
     Capybara.default_driver = :selenium

     SITE = 'https://uakino.club/'
end