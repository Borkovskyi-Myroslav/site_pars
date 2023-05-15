require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.default_driver = :selenium
Capybara.current_driver = :selenium

class MyCapybaraScript
  include Capybara::DSL

  def initialize(email,password)
      @email=email
      @password=password
  end

  def run
    visit('https://uakino.club/')
        
    find(:xpath, '//span[contains(text(), "Авторизація")]').click
        
    #find(:xpath, '//input[contains(@id, "login_name")]').set("#{@email}")
    fill_in "login_name", with: "#{@email}" 

    #find(:xpath, '//input[contains(@id, "login_password")]').set("#{@password}")
    fill_in "login_password", with: "#{@password}"

    click_button("Вход")

    puts '**************************'
    a_elements = all('a.movie-title')
    puts "count of all movies - #{a_elements.length}"
    a_elements.each { |el| puts el.text }
    puts '**************************'

    img_elements = all('img')
    img_count = img_elements.length
    puts "Number of Pictures on the site: #{img_count}"

    File.open('Parser_site.txt', 'w') do |file|
      file.puts "count of all movies - #{a_elements.length}"
      a_elements.each { |el| file.puts el.text }
      file.puts "Number of Pictures on the site: #{img_count}"
    end
          
    sleep(10)
  end
end

script = MyCapybaraScript.new("example@gmail.com", "example_password")
script.run