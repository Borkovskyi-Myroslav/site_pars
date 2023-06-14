module Uakino
  class MoviesList < Uakino::UakinoLogin
    def scrap_data
      @movie_titles = all('a.movie-title').count
    end
  end
end