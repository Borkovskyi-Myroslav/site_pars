require './scrapper/scrapper_main'
require './scrapper/uakino'

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



