module Scrapper
    module Uakino
        class UakinoMain < Scrapper::ScrapperMain
            SITE_URL = 'http://uakino.club'
            def initialize(email, password, filename: nil)
                @email=email
                @password=password
                @filename = filename
            end
                
            private 
            def login
                visit(SITE_URL)
                find(:xpath, '//span[contains(text(), "Авторизація")]').click
                fill_in "login_name", with: "#{@email}" 
                fill_in "login_password", with: "#{@password}"
                click_button("Ввійти на сайт")
            end
                
            def quit
                page.driver.browser.quit
            end
        end
    end 
end