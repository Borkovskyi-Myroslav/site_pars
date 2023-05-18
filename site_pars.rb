require './parser.rb'

class BaseScrapper
  include Capybara::DSL
  include Parser
end

#class Scrappers::Uakino < BaseScrapper
class Uakino < BaseScrapper
  def initialize(email,password)
      @email=email
      @password=password
  end

  private 
  def login
    visit(SITE)
    find(:xpath, '//span[contains(text(), "Авторизація")]').click
    fill_in "login_name", with: "#{@email}" 
    fill_in "login_password", with: "#{@password}"
    click_button("Ввійти на сайт")
  end

  def quit
    page.driver.browser.quit
  end
end

#class Scrappers::Uakino::Images < Scrappers::Uakino
class Images < Uakino

  def run
    login
    scrap_data
    write_to_file
    quit
  end

  private 
  def scrap_data
    @movie_title = all('a.movie-title')
    @images = all('img')
    @images_count = @images.length
  end

  def write_to_file
    File.open("Uakino_pars-#{Time.now.strftime('%y-%m-%d-%H-%M-%S')}.txt", 'w') do |file|
    file.puts "count of all movies - #{@movie_title.length}"
    @movie_title.each { |el| file.puts el.text }
    file.puts "Number of Pictures on the site: #{@images_count}"
    end
  end
    
end

script = Images.new("example@gmail.com", "example_password")
script.run
