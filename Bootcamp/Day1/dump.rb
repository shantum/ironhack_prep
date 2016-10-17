class Home
  attr_accessor :name, :city, :price, :capacity

  def initialize(name, city, price, capacity)
    @catalog = []
    @name = name
    @price = price.to_i
    @city = city
    @capacity = capacity.to_i
    @catalog.push({:name => @name, :city => @city, :price => @price, :capacity => @capacity})
  end

  def self.catalog
      puts @catalog
  end
end

home1 = Home.new('home1', 'barcelona', 100, 3)
home2 = Home.new('home2', 'miami', 200, 4)
home3 = Home.new('home3', 'london', 400, 4)
home4 = Home.new('home4', 'new york', 200, 1)
home5 = Home.new('home5', 'delhi', 50, 3)
home6 = Home.new('home6', 'madrid', 250, 3)
home7 = Home.new('home7', 'rome', 175, 3)
home8 = Home.new('home8', 'milan', 325, 4)
home9 = Home.new('home9', 'toronto', 375, 2)
home10 = Home.new('home10', 'sydney', 320, 3)



puts home1.city
Home.catalog