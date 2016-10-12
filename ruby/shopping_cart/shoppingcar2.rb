require 'pry'

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
    puts "Your grand total for today is: $#{total.to_i}"
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
    elsif type == :houseware && @price > 100; @price = @price - (@price * 5/100)
    else @price = @price end
  end
end

def load_inventory
  @banana = Item.new('Banana', 10, :fruit)
  @oj = Item.new('Orange-Juice', 10, :drink)
  @vacuum = Item.new('Vacuum-Cleaner', 150, :houseware)
  @anchovies = Item.new('Anchovies', 2, :food)
  @rice = Item.new('Rice', 1, :food)
end

def new_cart
  load_inventory
  puts 'Hello, what would you like to buy today? We have the following products available:'
  Item.print_catalog
end

def get_choice
  cart = ShoppingCart.new
  user_input = gets.chomp.to_i
  if user_input == 1; cart.add_item(@banana); get_choice
  elsif user_input == 2; cart.add_item(@oj); get_choice
  elsif user_input == 3; cart.add_item(@vacuum); get_choice
  elsif user_input == 4; cart.add_item(@anchovies); get_choice
  elsif user_input == 5; cart.add_item(@rice); get_choice
  elsif user_input == 6; cart.checkout
  elsif user_input == 'quit'; exit!
  else puts'Sorry, invalid response. Please try again.'; get_choice
  end
end

load_inventory
new_cart
get_choice

