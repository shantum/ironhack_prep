class Movie
  attr_reader :name, :year

  def initialize(name, year)
    @name = name.to_s;
    @year = year.to_i;
  end
end

class List
  attr_reader :list

  def initialize
    @list = {}
  end

  def add_movie(movie)
    @list[:movie_name] = movie.name
    @list[:movie_year] = movie.year
  end

  def print_list
    @list.to_s
  end
end
