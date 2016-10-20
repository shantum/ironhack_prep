require "date"

class ShoppingCart
  attr_reader :items, :total, :discount

  def initialize
    @items = {}
    @total = 0
    @discount = 0
  end

  def add_to_cart(item, quantity=1)
    @items[item.name] = {quantity => item.get_price * quantity};
    @total += item.price.to_s.to_i
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


banana     = Items.new('Banana', [20, 20, 20, 21])
grapes     = Items.new('Grapes', [15, 15, 15, 15])
oranges    = Items.new('Banana', [20, 20, 20, 21])
apples     = Items.new('Apples', [10, 10, 15, 12])
watermelon = Items.new('Watermelon', [50, 50, 50, 50])

fruits = [banana, grapes, oranges, apples, watermelon]

cart = ShoppingCart.new
cart.add_to_cart(watermelon, 2)
cart.add_to_cart(apples, 2)
puts cart.items
puts cart.items.keys.include?('Apples')
