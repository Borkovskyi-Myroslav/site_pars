require './scrapper/scrapper_main'
require './scrapper/uakino/uakino_main'

script = Uakino::MoviesList.new("example@gmail.com", "example_password")
script.run