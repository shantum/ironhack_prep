require_relative 'movie'
require 'nokogiri'
require 'open-uri'
require 'erb'



class MovieList
  attr_reader :movies

  def initialize
    @movies = []
  end

  def add_array(movies)
    movies.each do |movie|
      @movies << Movie.new(movie)
    end
  end

  def img_tags
    i = 0
    img_tags = []
    @movies.each do |movie|
      img_tags << "<img src=\"<%= @list.movies[#{i}].poster %>\">"
      i += 1
    end
    puts img_tags.to_s
    file.close
  end
end

@list = MovieList.new
@list.img_tags
# @list.add_array(Movie.search(search_string, 9))
