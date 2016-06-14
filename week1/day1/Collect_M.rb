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
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Mike's place", "Barcelona", 3, 70),
  Home.new("Jorge's place", "Valencia", 2, 60),
  Home.new("David's place", "Menorca", 3, 55),
  Home.new("Pere's place", "Mallorca", 1, 50),
  Home.new("Alberto's place", "Pamplona", 2, 60)
]

def Sort_homes (hmO)


  hm = hmO
  action = nil

  until action == "exit" do


    puts "Type 1 to display houses by price\nType 2 to display houses by capacity\nType 3 to display houses from a city\nType exit to leave\nType restart to start again "
    action = gets.chomp

    if action != "1" && action != "2" && action != "3" && action !=  "exit" && action != "restart"
      puts "wrong input"
    end

    if action == "restart"
      hm = hmO
    end

    if action == "1"
      puts "Type A for sort from lowest to highest\nType B for sort from highest to lowest\nFor an interval type C "
      ps = gets.chomp
      if ps.upcase == "A"
      hm = hm.sort { |pr1,pr2| pr1.price <=> pr2.price }
      hm.each { |x| puts " #{x.name} in #{x.city} \n Price:$#{x.price} a night cap#{x.capacity} \n "}
      end
      if ps.upcase == "B"
        hm = hm.sort { |pr1,pr2| pr2.price <=> pr1.price }
        hm.each { |x| puts " #{x.name} in #{x.city} \n Price:$#{x.price} a night cap#{x.capacity} \n "}
      end
      if ps.upcase == "C"
        puts "define de lowest price"
        lp = gets.chomp
        puts "define de highest price"
        hp = gets.chomp
        hm = hm.select{ |x|  x.price>=lp.to_i && x.price <= hp.to_i }
        hm.each { |x| puts " #{x.name} in #{x.city} \n Price:$#{x.price} a night cap#{x.capacity} \n "}
      end

    end

    if action == "2"
      hm = hm.sort { |cp1,cp2| cp1.capacity <=> cp2.capacity }
      hm.each { |x| puts " #{x.name} in #{x.city} \n Price:$#{x.price} a night cap#{x.capacity} \n "}
    end

    if action == "3"
      n=1
      puts "select a city from the list,"
        hm.each do |x|
          puts "#{n}-#{x.city}"
          n+=1
        end
      place = gets.chomp
      hm = hm.select { |ct| ct.city == place }
      hm.each { |x| puts " #{x.name} in #{x.city} \n Price:$#{x.price} a night cap#{x.capacity} \n "}
    end
  end
end


Sort_homes(homes)
