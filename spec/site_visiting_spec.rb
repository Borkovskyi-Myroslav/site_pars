require './spec/spec_main'

RSpec.describe Uakino::UakinoLogin, type: :scrapper do
  before(:each) do
    @uakino = Uakino::UakinoLogin.new("goodluckknots@gmail.com", "1qwedsazxcdewsxzaq123")
  end

  it 'Visiting' do
    @uakino.visiting
    expect(page).to have_content('ФІЛЬМИ') 
  end
end