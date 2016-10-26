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
    @list[movie.name] = movie.year
  end

  def print_list
    array = []
    @list.each do |key, value|
      array << "#{key} : #{value}"
    end
  return array.to_s
  end
end
