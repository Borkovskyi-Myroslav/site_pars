require './capybara/capybara'
require './scrapper/scrapper_main'
require './scrapper/uakino/uakino_main'
require './scrapper/uakino/movies_list'

RSpec.describe Scrapper::Uakino::MoviesList, type: :scrapper do
              #Scrapper::Uakino::MoviesList
  let(:email) { 'goodluckknots@gmail.com' }
  let(:password) { '1qwedsazxcdewsxzaq12' }
  let(:filename) { 'scrapper_test.txt' }

  subject { described_class.new(email, password, filename: filename) }

  after { File.delete(filename) if File.exist?(filename) }

  it 'logins, parses movies and saves into file' do
    subject.run
    expect(File.exist?(filename)).to be_truthy

    file = File.open(filename, 'r')
    content = file.read
    expect(content).to include('Count of all movies')
    expect(content).to include('Number of Pictures on the site:')
    file.close
  end
end


