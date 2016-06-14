class MilkShake

attr_reader :name

  def initialize(name)
 	@name = name
    @base_price = 3
    @ingredients = [ ]    
  end


  def add_ingredient(ingredient)
    @ingredients.push(ingredient)
  end
	

	def price_of_milkshake

		total_price_of_milkshake = @base_price

		@ingredients.each do |ingredient|

			total_price_of_milkshake += ingredient.price
		end

		   total_price_of_milkshake

	end

end


class Ingredient

	 attr_reader :name, :price

  def initialize(name, price)

    @name = name
    @price = price

  end

end

class Shack_shop
	
	def initialize

	@milkshakes_list=[]

end


def add_milkshakes(milkShake)

	@milkshakes_list.push(milkShake)

end

def checkout_milshakes

	checkout = ""
	n=0

	@milkshakes_list.each do |y|
		n+=1

	checkout +=y.name + " "
	
	end

	checkout
end

end


banana = Ingredient.new("Banana", 2)
chocolate_chips = Ingredient.new("Chocolate Chips", 1)


nizars_milkshake = MilkShake.new("ChocoBan")
miquel_milkshake = MilkShake.new("MikeShake")


nizars_milkshake.add_ingredient(banana)
nizars_milkshake.add_ingredient(chocolate_chips)

miquel_milkshake.add_ingredient(banana)

first_customers = Shack_shop.new

first_customers.add_milkshakes(miquel_milkshake)
first_customers.add_milkshakes(nizars_milkshake)


puts nizars_milkshake.price_of_milkshake

puts first_customers.checkout_milshakes


