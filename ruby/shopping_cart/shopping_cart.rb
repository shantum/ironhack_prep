class Item
  attr_accessor :name, :price, :type

  @@catalog = []

  def initialize(name, price, type)
    @name = name
    @price = price.to_i
    @type = type
    @@catalog += ["#{name} for $#{price}"]
  end

  def price
    if type == :Fruit && (Time.now.saturday? || Time.now.sunday?); @price = @price - (@price * 1/10)
    elsif type == :Houseware && @price > 100; @price = @price - (@price * 5/100)
    else @price = @price end
  end

  def self.print_catalog
    puts @@catalog.to_s
  end

end

class ShoppingCart
  attr_accessor :items, :total
  attr_reader :discount

  def initialize(items=[], total=[])
    @items = items
    @total = total
  end

  def checkout
    if @items.count > 5; @discount = @total.sum * 1/10
      else @discount = 0
    end

    if @discount != 0
      puts "You have bought the following items today: #{@items.to_s}. Your total for today is $#{(@total.sum) - @discount} including a discount of $#{@discount}"
      else puts "You have bought the following items today: #{@items.to_s}. Your total for today is $#{@total.sum}. "
    end
  end
end

class Array
  def sum
    inject { |sum, x| sum + x }
  end
end

def get_order
  puts 'Hello! Welcome to the store. The following items are available today:'
  puts Item.print_catalog
  puts 'What would you like to buy today? Please enter the item name below:'
  get_option
end

def add_to_cart(item)
  @cart.items += [item.name]
  @cart.total += [item.price]
  puts "#{item.name} has been added to your cart for $#{item.price}. Your cart total is now $#{@cart.total.sum}"
end

def get_option
  input = gets.chomp.to_s.delete(' ').strip.downcase
  case input
    when 'banana'; add_to_cart(@banana)
    when 'orangejuice'; add_to_cart(@oj)
    when 'anchovies'; add_to_cart(@anchovies)
    when 'rice'; add_to_cart(@rice)
    when 'vacuumcleaner'; add_to_cart(@vacuum)
    when 'checkout'; @cart.checkout
    when 'exit'; puts 'Thank You for shopping with us'; exit!
    else puts 'Invalid option. Please try again or type exit to quit'
  end
  get_option
end

@banana = Item.new('Banana', 10, :Fruit)
@vacuum = Item.new('Vacuum Cleaner', 150, :Houseware)
@oj = Item.new('Orange Juice', 10, :Drinks)
@anchovies = Item.new('Anchovies', 2, :Food)
@rice = Item.new('Rice', 1, :Food)
@cart = ShoppingCart.new

get_order