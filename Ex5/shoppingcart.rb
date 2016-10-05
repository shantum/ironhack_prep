class Items
	def initialize(name, price)
		@name = name
		@price = price
	end
	attr_reader :name, :price
end

	class Foods < Items
	end
		class Fruits < Foods
			def price
				today = Time.now
				if today.saturday? || today.sunday? == true 
					@price = @price - (@price * 1/10)
				else
					@price = @price
				end
			end
		end

		class Drinks < Foods
		end

	class Houseware < Items
		def price
			if @price > 100
				@price = @price - (@price * 5/100)
			else
				@price = @price
			end
		end
	end

class ShoppingCart
  @@items = []
  @@total = 0

	def initialize
		@items = Array.new
    @total = Array.new
	end
	def add_item(name, price)
    @items.push(name.to_s)
    @total.push(price.to_i)
	end
	def show_cart
		@items + @total
	end
end

@banana = Fruits.new('Banana', 10)
@orange_juice = Drinks.new('Orange Juice', 10)
@rice = Foods.new('Rice', 1)
@vacuum_cleaner = Houseware.new('Vacuum Cleaner', 150)
@anchovies = Foods.new('Anchovies', 2)

def get_choice
  cart = ShoppingCart.new
  choice = gets.chomp.to_i
  item = nil

  if choice == 1
   item = @banana
   cart.add_item(item.name, item.price)
   cart.show_cart
   get_choice
  elsif choice == 2
    item = @orange_juice
    cart.add_item(item.name, item.price)
    cart.show_cart
    get_choice
  elsif choice == 3
    item = @rice
    cart.add_item(item.name, item.price)
    cart.show_cart
    get_choice
  elsif choice == 4
    item = @vacuum_cleaner
    cart.add_item(item.name, item.price)
    cart.show_cart
    get_choice
  elsif choice == 5
    item = @anchovies
    cart.add_item(item.name, item.price)
    cart.show_cart
    get_choice
  elsif choice == 6
    puts 'thank you for shopping with us'
    puts cart.show_cart
  end

end

puts 'Hello, we have the following items available:
1. banana $10
2. orange-juice $10
3. rice $1
4. vacuum cleaner $150
5. anchovies $2
What would you like to add to your cart? Enter the number of the
desired product, or enter 6 to checkout'

get_choice




		



