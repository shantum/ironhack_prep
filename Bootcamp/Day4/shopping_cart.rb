require "date"
require "byebug"

class ShoppingCart
  attr_reader :items, :total, :discount

  def initialize
    @items = []
    @total = 0
    @discount = 0
  end

  def add_to_cart(item, quantity=1, price=item.get_price)
    puts "#{quantity} x #{item.name} have been added to your cart for $#{price * quantity}."
    @items.push "#{quantity} x #{item.name} have been added to your cart for $#{price * quantity}."
    if @total == 0; @total = price * quantity; else @total += price * quantity end
    self.discount(item, quantity)
  end

  def discount(item, quantity)
    discount = 0
    if item.name == 'Apples' && quantity >= 2
      discount = (quantity - (quantity % 2))  * item.get_price
    elsif item.name == 'Oranges' && quantity >= 3
      discount = (quantity - (quantity % 3)) * item.get_price
    elsif item.name == 'Grapes' && quantity >= 4
      puts "Special Offer: You may get #{quantity/4} banana/s for free! Would you like to? (Y/N)"
      print '>'
      while user_input = gets.chomp
        case user_input
        when 'Y' || 'y'
          add_to_cart($banana, quantity/4, 0)
          break;
        when 'N' || 'n'
          puts "Ok! Thank you."
          break;
        else
          puts "Please enter Y or N'"
        end
      end
    else discount = 0
    end
    if discount != 0 || nil
      puts "You have received a discount of $#{discount} on your purchase of #{item.name}"
      if @discount == 0; @discount = discount; else @discount -= discount end
    end
    return discount
  end
end

class Items
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def get_price
    season = self.get_season

    case season
    when 'spring'
      @price = @price[0]
    when 'summer'
      @price = @price[1]
    when 'fall'
      @price = @price[2]
    else @price = @price[3] #when 'winter'
    end

    if self.name == 'Watermelon' && Date.today.sunday?
      @price = @price * 2
    end

    return @price
  end

  def get_season
    current_month = Date.today.strftime("%m")
    if [1,2,3].include?(current_month)
      season = 'spring'
    elsif [4,5,6].include?(current_month)
      season = 'summer'
    elsif [7,8,9].include?(current_month)
      season = 'fall'
    else season = 'winter'
    end
    return season
  end
end


$banana     = Items.new('Banana', [20, 20, 20, 21])
@grapes     = Items.new('Grapes', [15, 15, 15, 15])
@oranges    = Items.new('Banana', [20, 20, 20, 21])
@apples     = Items.new('Apples', [10, 10, 15, 12])
@watermelon = Items.new('Watermelon', [50, 50, 50, 50])

fruits = [$banana, @grapes, @oranges, @apples, @watermelon]

cart = ShoppingCart.new
cart.add_to_cart(@watermelon, 2)
cart.add_to_cart(@apples, 2)
cart.add_to_cart(@grapes, 4)
puts cart
