require './scrapper/scrapper_main'
require './scrapper/uakino/uakino_login'
require './scrapper/uakino/uakino_list'

RSpec.configure do |config|
    config.include Capybara::DSL
  
    config.before(:each, type: :scrapper) do
      Capybara.current_driver = :selenium
    end

    config.after(:each, type: :scrapper) do
        Capybara.reset_sessions!
        Capybara.use_default_driver
    end
end

RSpec.describe Uakino::UakinoLogin, type: :scrapper do
    before(:each) do
      @uakino = Uakino::UakinoLogin.new("goodluckknots@gmail.com", "1qwedsazxcdewsxzaq123")
    end
  
    it 'Visiting' do
      @uakino.visiting
      expect(page).to have_content('ФІЛЬМИ') 
    end
end

RSpec.describe Uakino::UakinoLogin, type: :scrapper do
    before(:each) do
      @uakino = Uakino::UakinoLogin.new("goodluckknots@gmail.com", "1qwedsazxcdewsxzaq123")
      visit('http://uakino.club')
    end
  
    it 'Login' do
      @uakino.login
      expect(page).to have_content('Мій кабінет')
    end

    it 'Movie' do
        movies = page.all('a.movie-title')
        expect(movies.count).to eq(42)
    end

end

