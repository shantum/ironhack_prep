require 'themoviedb'
require 'byebug'
require 'sinatra'
require_relative 'models/movie'
require_relative 'models/list'
require 'date'
require 'pry'



get '/' do
  erb :home
end

post '/search' do
  search_string = params[:movie].to_s
  @list = MovieList.new
  @list.add_array(Movie.search(search_string, 9))
  erb :movies
end

