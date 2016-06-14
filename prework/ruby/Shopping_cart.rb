class ShoppingCart

  def initialize

    @items = []

  end

    def add_item(item)
      
      @items.push(item)

  end

  def checkout

  	total_price= 0 
 

  	@items.each do |x|

  		total_price += x.price
  		puts "#{x.name}: #{x.price}"
  	end

  	if @items.count>5

  		puts "you get an extra 10% discount $#{total_price}-10%"

  		total_price= total_price*0.9
  	end

  	 puts "Your total today is $#{total_price}. Have a nice day!"

  end


end

class Item

	attr_reader :name, :price

	def initialize (name, price)
		@name = name
		@price = price
	end

	def name
		@name
	end

	def price

	final_price = @price

	end

end



class Houseware < Item

  def price	

	if @price<100

		final_price = @price

	else

		final_price = 0.95*@price
	end	
  end
end



class Fruit < Item

  def price
    if Time.now.wday != 6 || 0

		final_price = @price

	else

		final_price = 0.9*@price

	end
  end
end

banana = Fruit.new("Banana", 10)
orange_juice = Fruit.new("Orange juice", 10)
rice = Item.new("Rice", 1)
vacuum_cleaner = Houseware.new("Vacuum cleaner", 150)
anchovies = Item.new("Anchovies", 2)
salmon = Item.new("Salmon", 7)


mike = ShoppingCart.new
joshs_cart = ShoppingCart.new

joshs_cart.add_item(orange_juice)
joshs_cart.add_item(rice)
joshs_cart.add_item(banana)
joshs_cart.add_item(vacuum_cleaner)
joshs_cart.add_item(salmon)
joshs_cart.add_item(anchovies)

mike.add_item(orange_juice)

joshs_cart.checkout
puts" "

mike.checkout



