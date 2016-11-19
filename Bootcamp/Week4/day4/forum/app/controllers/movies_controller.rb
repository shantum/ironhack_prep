class MoviesController < ApplicationController
require 'date'

  def search
  end

  def find
    Tmdb::Api.key("a424db17ea742a824a4160a4789d7d42")
    @tmdb = Tmdb::Movie
    @list = @tmdb.find(params[:movie])
    @base_url = 'http://image.tmdb.org/t/p/w300'
  end

  def add
    @title = params[:title]
    @year = Date.parse(params[:release_date]).strftime('%Y')
    @poster_path = params[:poster_path]
    @synopsis = params[:synopsis]
    @all_movies = Movie.all

    if Movie.exists?(:title => @title)
      @exists = true
      @sorry = 'Sorry this movie already exists in the DB'
    else
      @movie = Movie.new
      @movie.title = @title
      @movie.year = @year
      @movie.poster = @poster_path
      @movie.synopsis = @synopsis
      @movie.save
    end
  end
end
