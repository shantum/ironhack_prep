require "sinatra"
require "sinatra/reloader" if development?
require "pry"
require "byebug"
require_relative "model/movies"

$list = List.new

get '/movies' do
  erb :view
end

post '/movies' do
  erb :view
end

post '/movie_input' do
  movie_name = params[:movie_name]
  movie_year = params[:movie_year]
  movie = Movie.new(movie_name, movie_year)

  save_button = params['add_to_list']
  if save_button
    $list.add_movie(movie)
  end
  @list = $list.print_list
  erb :view
end
