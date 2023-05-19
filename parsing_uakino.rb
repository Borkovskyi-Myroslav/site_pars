require './capybara/capybara'
require './scrapper/scrapper_main'
require './scrapper/uakino/uakino_main'
require './scrapper/uakino/movies_list'

# script = Scrapper::Uakino::MoviesList.new("example@gmail.com", "example_password")
script = Scrapper::Uakino::MoviesList.new("goodluckknots@gmail.com", "1qwedsazxcdewsxzaq123")
script.run