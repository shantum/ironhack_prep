class MilkShake
  attr_reader :name, :price

  def initialize(name, base_price=3)
    @name = name
    @base_price = base_price
    @ingredients = [ ]
  end

  def add_ingredient(ingredient)
    @ingredients.push(ingredient)
  end

  def price
    total_price = @base_price
    @ingredients.each do |ingredient|
      total_price += ingredient.price
      return total_price
    end
  end
end

class Ingredient
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
end

class ShakeShop
  @@list = []
  @@total = []

  def add(shake)
    @@list.push(shake.name)
    @@total.push(shake.price)
  end

  def total
    puts @@total.inject(0){|sum,x| sum + x }
  end

  def checkout
    puts "You have bought the following shakes today: #{@@list}. Your total for today is $#{@@total.inject(0){|sum,x| sum + x }}"
  end

end

nizars_milkshake = MilkShake.new('Nizars Milkshake')
banana = Ingredient.new("Banana", 2)
chocolate_chips = Ingredient.new("Chocolate Chips", 1)
nizars_milkshake.add_ingredient(banana)
nizars_milkshake.add_ingredient(chocolate_chips)

shop = ShakeShop.new
shop.add(nizars_milkshake)
shop.add(nizars_milkshake)
shop.add(nizars_milkshake)
shop.total
shop.checkout
