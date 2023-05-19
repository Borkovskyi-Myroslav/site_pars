require './capybara/capybara'
require './scrapper/scrapper_main'
require './scrapper/uakino/uakino_main'
require './scrapper/uakino/movies_list'

# puts "Enter email for login"
# email = gets.chomp
# puts "Enter password for login"
# password = gets.chomp
#script = Scrapper::Uakino::MoviesList.new(email, "password")

script = Scrapper::Uakino::MoviesList.new("example@gmail.com", "example_password")
script.run