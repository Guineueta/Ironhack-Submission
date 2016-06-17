#cd desktop/ironhack/week1/day3

class Player
attr_reader :name
attr_accessor :lifes, :position, :inventory, :map

  def initialize(name,lifes=5)
    @name=name
    @lifes=lifes
    @inventory = []
    @position = [0,0]
    @map = []
  end

  def action(position_player,rooms)
    puts "select an action"
    puts "<"
    action = gets.chomp
  end

  def kill_myself
    @lifes = 0
  end

  def pick_up(object)
    @inventory.push(object)
  end

  def throw_down(object)
    @inventory.delete(object)
  end

  def look_around(map_position) #space habitacion en la que estas una room
    print "there is/are the following things:"
    map[map_position].things.each {|things| print " ,#{things}"}
    puts""
    print "there is/are the following doors:"
    print map[map_position].doors.size
    puts ""
  end

end #cierro clase

class Room
  attr_accessor :doors , :things, :position
  def initialize (doors,position,things=[])
    @doors = doors
    @position = position
    @things = things
  end
end #cierro clase

class Door
  attr_reader :position
  attr_accessor :how, :resist
  def initialize (position,how,resist=100)
    @position = position
    @how = how
    @resist = resist
  end

  def resistance(damage)
    @resist -= damage
  end

  def how(b)
    if b == "open" || b== "close"
    @how = b
    end
  end
end #cierro clase

class Key
attr_reader :doors_that_open
  def initialize(doors_that_open)
    @doors_that_open = doors_that_open
  end

  def open_door (player)
    doors_that_open.each do |door|
      if door.position == player.position
        door.how = "open"
      end#cieero if
    end#cierro each do
  end #cierro def
end #cierro clase

door1 = Door.new([0,0.5],"open")
door2 = Door.new([0,1.5],"open")
door3 = Door.new([0.5,0],"open")
door4 = Door.new([0.5,1],"open")
door5 = Door.new([0.5,2],"close")
door6 = Door.new([1,0.5],"open")
door7 = Door.new([1.5,0],"open")
door8 = Door.new([1.5,2],"open",100)
door9 = Door.new([2,0.5],"close")


mapa = [
            room0I0 = Room.new([door1,door3],[0,0]),
            room0I1 =  Room.new([door1,door2,door4,],[0,1]),
            room0I2 =  Room.new([door2,door5],[0,2]),

            room1I0 =  Room.new([door3,door6,door7],[1,0]),
            room1I1 =  Room.new([door4,door6],[1,1]),
            room1I2 =  Room.new([door5,door8],[1,2]),

            room2I0 =  Room.new([door7,door9],[2,0]),
            room2I1 =  Room.new([door9],[2,1])
]

keyd5 = Key.new([door5])

mike = Player.new("Mike")



class Game_Door

  def initialize(player,map)
    @player = player
    @map = map
  end

  def current_room
    map_position = 0
    while @map[map_position].position != @player.position
      map_position += 1
    end
    return  map_position
  end

  def start_playing

    @player.map = @map #actualizas el mapa del jugador

    puts "The game start know"
    puts "command ===>  type L:look around *** N:north *** S:south *** E:east *** W:west *** K:kill myself "
    action = nil
    # def comandos
    #   comandos = {:L => @player.look_around(current_room)}#,:N => move_n,:S => move_s,:E => move_e,:W => move_w,:K => kill_myself}
    # end

    puts @player.lifes

    while @player.lifes > 0
      puts "<"
      action = gets.chomp.upcase
     case action
     when "L"
       @player.look_around(current_room)
     when "k"
      @player.lifes = 0
     end

    end #cierro until
  end
end #cierro clase

game1 = Game_Door.new(mike,mapa)
game1.start_playing
