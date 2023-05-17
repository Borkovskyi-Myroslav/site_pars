require './module.rb'

class MyCapybaraScript
  include Capybara::DSL

  def initialize(email,password)
      @email=email
      @password=password
  end
end

class Runner < MyCapybaraScript
  
  def run
    visit('https://uakino.club/')
    find(:xpath, '//span[contains(text(), "Авторизація")]').click
    fill_in "login_name", with: "#{@email}" 
    fill_in "login_password", with: "#{@password}"
    click_button("Ввійти на сайт")
    
    a_elements = all('a.movie-title')
    img_elements = all('img')
    img_count = img_elements.length

    File.open('Parser_site.txt', 'w') do |file|
    file.puts "count of all movies - #{a_elements.length}"
    a_elements.each { |el| file.puts el.text }
    file.puts "Number of Pictures on the site: #{img_count}"
    end

    page.driver.browser.quit

  end
end


script = Runner.new("example@gmail.com", "example_password")
script.run


