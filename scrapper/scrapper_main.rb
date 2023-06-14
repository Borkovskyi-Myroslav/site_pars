module Scrapper
  require 'capybara'
  require 'capybara/rspec'
  require 'capybara/dsl'
  require 'selenium-webdriver'
    
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  end
      
  Capybara.default_driver = :selenium

  class ScrapperMain
    include Capybara::DSL
  end
end