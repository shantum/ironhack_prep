require 'date'
require 'themoviedb'
require 'byebug'
require 'json'

Tmdb::Api.key('4fd341cee85ee7e961c5b83307a5855e')
Tmdb::Api.language('en')
$moviedb = Tmdb::Movie


class Movie
  attr_reader :title, :year, :poster, :movies

  def initialize(movie)
    # @title = movie.title
    # @year = Date.parse(movie.release_date).strftime('%y')
    @poster = "https://image.tmdb.org/t/p/w500#{movie.poster_path}"
  end

  def self.search(string, length)
    $moviedb.find(string)[0..(length-1)]
  end

  def self.list_movies
    @@movies
  end
end

