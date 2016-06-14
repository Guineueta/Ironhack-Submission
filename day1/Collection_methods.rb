class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]

homes.each do |x|
  puts " #{x.name} in #{x.city} \n Price:$#{x.price} a night"
end

cities = homes.map do |hm|
  hm.city
end

puts cities

average_places = homes.reduce(0.0) do |x,y|
  x + y.capacity.to_f/(homes.size)
end

puts average_places

homes.each_with_index do |hm, index|
  puts "Home Number #{index + 1}: #{hm.name}"
end

san_juan_homes = homes.select do |hm|
  # Keep hm only if its city is "San Juan"
  hm.city == "San Juan"
end
