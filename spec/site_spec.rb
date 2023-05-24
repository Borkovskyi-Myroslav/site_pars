 require './scrapper/scrapper_main'
 require './scrapper/uakino/uakino_main'

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

RSpec.describe Uakino::UakinoMain, type: :scrapper do
  before(:each) do
    @uakino = Uakino::UakinoMain.new("goodluckknots@gmail.com", "1qwedsazxcdewsxzaq123")
  end

  it 'повинен виконати авторизацію' do
    @uakino.login
    expect(page).to have_content('Мій кабінет') 
  end
end

describe Uakino::MoviesList, type: :scrapper do
  before(:each) do
    @movies_list = Uakino::MoviesList.new("goodluckknots@gmail.com", "1qwedsazxcdewsxzaq123")
  end

  it 'повинен збирати дані про фільми' do
    @movies_list.login
    @movies_list.scrap_data
    expect(@movies_list.instance_variable_get(:@movie_titles)).not_to be_empty 
  end

  it 'повинен записувати дані  файл' do
    @movies_list.login
    @movies_list.scrap_data
    @movies_list.write_to_file
    expect(File.exist?(@movies_list.export_file)).to be true 
  end

  it 'logins, parses movies and saves into file' do
    @movies_list.login
    @movies_list.scrap_data
    @movies_list.write_to_file
    expect(File.exist?(@movies_list.export_file)).to be_truthy

    file = File.open(@movies_list.export_file, 'r')
    content = file.read
    expect(content).to include('Count of all movies')
    expect(content).to include('Number of Pictures on the site:')
    file.close
  end

  it 'Correct count of movies' do
    @movies_list.login
    movies = page.all('a.movie-title')
    expect(movies.count).to eq(42)
  end

  it 'should run login, scrap data, and write to file' do
    expect(@movies_list).to receive(:login)
    expect(@movies_list).to receive(:scrap_data)
    expect(@movies_list).to receive(:write_to_file)
    expect(@movies_list).to receive(:quit)

    @movies_list.run
  end
 end


