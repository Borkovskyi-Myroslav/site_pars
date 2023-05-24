module Uakino
    class UakinoMain < Scrapper::ScrapperMain
        SITE_URL = 'http://uakino.club'
        def initialize(email, password, filename: nil)
            @email=email
            @password=password
            @filename = filename
        end
                
        #private 
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

    class MoviesList < UakinoMain
        def run
            login
            scrap_data
            write_to_file
            quit
        end
    
        #private 
        def scrap_data
            @movie_titles = all('a.movie-title')
            @images = all('img')
            @images_count = @images.length
        end

        def write_to_file
            File.open(export_file, 'w') do |file|
                file.puts "Count of all movies - #{@movie_titles.length}"
                @movie_titles.each { |el| file.puts el.text }
                file.puts "Number of Pictures on the site: #{@images_count}"
            end
        end

        def export_file
            # @filename || "uakino_movies_list-#{Time.now.strftime('%y-%m-%d-%H-%M-%S')}.txt"
            @filename || "uakino_movies_list.txt"
        end
    end
end 
