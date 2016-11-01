require_relative '../models/movie'
require "rspec"

describe 'movie class' do
  it 'should search for a new movie and return given number of matches' do
    search_list = Movie.search('Batman', 1)
    expect(search_list.length).to eq(1)
    expect(search_list).to be_a(Array)
    expect(search_list[0].title).to be_a(String)
  end

  it 'should add a movie/s using the search methods' do
    movies = Movie.search('inception', 4)
    inception1 = movies[0]
    inception_mov = Movie.add_movie(inception1)
    expect(inception_mov.title).to eq('Inception')
  end

  it 'should push a newly added movie to the class variable' do
    movie = Movie.search('inception', 1)
    Movie.add_movie(movie)
    expect(Movie.list_movies[0].title).to eq('Inception')
  end
end
