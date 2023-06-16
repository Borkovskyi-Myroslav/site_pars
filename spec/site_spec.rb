require './spec/spec_main'

RSpec.describe Uakino::UakinoLogin, type: :feature do
  let(:email) { '************' }
  let(:password) { '********' }

  subject { described_class.new(email, password) }

  before do
    visit(Uakino::UakinoLogin::SITE_URL)
  end

  describe '#login' do
    it 'logs in successfully' do
      subject.login
      expect(page).to have_content('Мій кабінет')
    end
  end

  describe '#scrap_data' do
    it 'scrapes movie titles' do
      subject.login
      subject.scrap_data
      expect(subject.instance_variable_get(:@movie_titles)).to be_an(Integer)
    end
  end

  describe '#quit' do
    it 'quits the browser' do
      expect(page.driver.browser).to receive(:quit)
      subject.quit
    end
  end
end