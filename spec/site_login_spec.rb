require './spec/spec_main'

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