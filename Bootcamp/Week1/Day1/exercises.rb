class Home
  attr_accessor :name, :city, :price, :capacity

  @@catalog = []

  def initialize(name, city, price, capacity)
    @name = name.capitalize
    @price = price.to_i
    @city = city.capitalize
    @capacity = capacity.to_i
    @@catalog.push({:name => @name, :city => @city, :price => @price, :capacity => @capacity})
  end

  def self.catalog
    puts @@catalog
  end

  def self.sort_by_price
    puts @@catalog.sort{|x, y| x[:price] <=> y[:price] }
  end

  def self.sort_by_capacity
    puts @@catalog.sort{|x, y| x[:capacity] <=> y[:capacity] }
  end

  def self.by_city(city)
    city_homes = @@catalog.select {|x| x[:city] == city}
    puts city_homes
  end

  def self.average_price
    average_price = (@@catalog.reduce(0) {|sum, x| sum + x[:price]}) / @@catalog.size
    puts average_price
  end

  def self.by_price(price)
    matches = @@catalog.find_all {|x| x[:price] == price.to_i}
    puts matches
  end

end

homes = [ Home.new('home1', 'barcelona', 100, 3),
          Home.new('home2', 'miami', 200, 4),
          Home.new('home3', 'london', 400, 4),
          Home.new('home4', 'new york', 200, 1),
          Home.new('home5', 'delhi', 50, 3),
          Home.new('home6', 'madrid', 250, 3),
          Home.new('home7', 'rome', 175, 3),
          Home.new('home8', 'milan', 325, 4),
          Home.new('home9', 'toronto', 375, 2),
          Home.new('home10', 'sydney', 320, 3)]

#homes.each {|home| puts "#{home.name} is available in #{home.city} for a price of $#{home.price} and can host upto #{home.capacity}"}

#Home.sort_by_price
#Home.sort_by_capacity
#Home.by_city('Milan')
#Home.average_price
#Home.by_price(200)
