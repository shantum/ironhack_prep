require_relative '../models/list'
require_relative '../models/movie'
require 'rspec'

describe 'movielist class' do
  it 'should create an array of movies' do
    list = MovieList.new
    list.add_array(Movie.search('batman', 9))

    expect(list.movies).to be_a(Array)
    expect(list.movies.length).to eq(9)
    expect(list.movies[0].title).to eq('Batman')
  end

  it 'should return the poster link for a movie' do
    list = MovieList.new
    list.add_array(Movie.search('Batman', 9))
    @img_tags = list.img_tags
  end

end


