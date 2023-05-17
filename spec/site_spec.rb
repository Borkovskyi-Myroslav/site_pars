

require 'rspec'
require 'capybara'
require 'capybara/rspec'

Capybara.configure do |config|
  config.default_driver = :selenium
  
end





RSpec.describe 'Parsing Uakino website', type: :feature do
  before(:each) do
    visit('https://uakino.club/')
  end

  it 'displays login button' do
    expect(page).to have_xpath('//span[contains(text(), "Авторизація")]')
  end

  it 'logs in successfully' do
    find(:xpath, '//span[contains(text(), "Авторизація")]').click
    fill_in 'login_name', with: 'example@gmail.com'
    fill_in 'login_password', with: 'example_password'
    click_button('Ввійти на сайт')
    expect(page).to have_content('Мій кабінет')
  end

  it 'count of all images' do
    images = page.all('img')
    expect(images.count).to eq(63) 
  end

end

