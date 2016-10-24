require "pry"
require "pry-nav"

class CarDealer
  def initialize(inventory)
    @inventory = inventory
  end

  def cars(brand)
    @inventory[brand.to_sym]
  end

  def print_inventory
    # ???
  end
end

my_inventory = {
  :Ford => ["Fiesta", "Mustang"],
}

car_dealer = CarDealer.new(my_inventory)
car_dealer.cars("Ford")  # ["Fiesta", "Mustang"]

binding.pry

# car_dealer.print_inventory
# Ford: Fiesta, Mustang
# Honda: Civic, CR-V
