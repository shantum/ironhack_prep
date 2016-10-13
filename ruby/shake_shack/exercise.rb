class MilkShake
  attr_reader :name, :price, :ingredients

  @@list = Hash.new

  def initialize(name, base_price=3)
    @base_price = base_price
    @name = name
    @ingredients = [ ]
    @@list[name] = base_price.to_i
    puts "A new shake, #{name}, has been created with a base price of $#{base_price}"
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

  @@list = Hash.new

  def initialize(name, price)
    @name = name
    @price = price
    @@list[@name] = price.to_i
    puts "A new ingredient, #{name}, has been added for $#{price.to_i}"
  end

  def self.get_ingredients
    puts @@list
  end
end

class ShakeShop
  def initialize
    @list = []
  end

  def self.add_shake
    puts "The following shakes are available today. To pick a shake please enter its name below or to create a new shake, please enter 'new':"

    name = gets.chomp.to_s.downcase.delete(' ')
    if name == 'new'; ShakeShop.new_shake
      else
    end

    puts "Please enter the base price of #{name}"
    base_price = gets.chomp.to_i
    new_shake = MilkShake.new(name, base_price)
    puts 'Please pick the ingredients for the shake. The following ingredients are available:'
    Ingredient.get_ingredients
    puts "To add a new ingredient please enter 'new'. Else, please enter the name of the ingredient you would like to add to #{name}"
  end

  def self.new_shake
    input = gets.chomp.to_s.downcase.delete(' ')
    case input
      when 'new'
        puts "Please enter the name of the ingredient:"
        ingredient_name = gets.chomp.to_s
        puts 'Please enter the price of the ingredient'
        ingredient_price = gets.chomp.to_i
        new_ingredient = Ingredient.new(ingredient_name, ingredient_price)
    end

  end
end



nizars_milkshake = MilkShake.new('Nizars Milkshake')
banana = Ingredient.new("Banana", 2)
chocolate_chips = Ingredient.new("Chocolate Chips", 1)
nizars_milkshake.add_ingredient(banana)
nizars_milkshake.add_ingredient(chocolate_chips)
