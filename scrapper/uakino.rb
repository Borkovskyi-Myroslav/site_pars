module Uakino
    class UakinoLogin < Scrapper::ScrapperMain
      SITE_URL = 'http://uakino.club'
      def initialize(email, password)
        @email=email
        @password=password
      end
  
      def login
        visit(SITE_URL)
        find(:xpath, '//span[contains(text(), "Авторизація")]').click
        fill_in "login_name", with: "#{@email}" 
        fill_in "login_password", with: "#{@password}"
        click_button("Ввійти на сайт")
      end
  
      def scrap_data
        @movie_titles = all('a.movie-title').count
      end
         
      def quit
        page.driver.browser.quit
      end
    end
  end