class ShoppingCart
  attr_reader :items, :name, :price
  def initialize
    @items = []
    @total = []
  end

  def list_items
    puts "Your cart contains the following items: #{@items.to_s}"
  end

  def checkout
    total = @total.inject(0, :+)
    puts "Your grand total for today is: $#{total}"
  end

  def add_item(item)
    if @items.empty?; @items = [item.name]; else @items.push(item.name) end
    if @total.empty?; @total = [item.price.to_i]; else @total.push(item.price.to_i) end
    @name = item.name
    @price = item.price
    puts "#{@name} has been added to your cart for $#{@price}"
  end
end

class Item
  attr_accessor :name, :price, :type

  @catalog = []
  @names = []

  def initialize(name, price, type)
    @name = name
    @price = price
    @type = type
    Item.record(@name, @price)
  end

  def self.record(name, price)
    @catalog.push("#{name} for $#{price} each")
    @names.push(name.to_s.downcase.strip)
  end

  def self.get_names
   puts @names.to_s.split(" ")
  end

  def self.print_catalog
    puts @catalog
  end

  def price
    if type == :fruit && (Time.now.saturday? || Time.now.sunday?); @price = @price - (@price * 1/10)
    elsif type == :housewear && @price > 100; @price = @price - (@price * 1/10)
    else @price = @price end
  end
end

def load_inventory
  @banana = Item.new('Banana', 10, :fruit)
  @oj = Item.new('Orange-Juice', 10, :drink)
  @vacuum = Item.new('Vacuum-Cleaner', 150, :housewear)
  @anchovies = Item.new('Anchovies', 2, :food)
end

def new_cart
  load_inventory
  cart = ShoppingCart.new
  puts 'Hello, what would you like to buy today? We have the following products available:'
  Item.print_catalog
  puts '>'
  user_input = gets.chomp.to_i
  if user_input == 1
    cart.add_item(@banana)
    cart.list_items
  elsif user_input == 3 || 4
    puts 'go'
  else puts 'no'
  end
end

new_cart

