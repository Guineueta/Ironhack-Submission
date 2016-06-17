#desktop/ironhack/week1/day5

class Tablero

  def initialize(fichero_tablero)
    @tablero_in = IO.read(fichero_tablero).split
    @columnas =8 #columnas de un tablero de ajedrez siempre son 8 ,
    @filas = (@tablero_in.size) / @columnas #las filas pueden variar en funcion de si juegas con un tablero de damas
    @tablero_final = []
  end

  def def_tablero

    aarray=[]
      @filas.times do |y|

        @columnas.times do |x|
          aarray.push(@tablero_in[(x+(y*8))])
        end

        @tablero_final.push(aarray)
        aarray = []
      end
    return @tablero_final
  end

end #cierro clase






class Peon
  def initialize (tablero,color)
    @tablero = tablero
    @color = color
  end

  def movement(pos_i,pos_f)
    movement_output = "ILEGAL"
    case @color
    when "b"
        if pos_i[0]+1 == pos_f[0] && pos_i[1] == pos_f[1] &&  @tablero[pos_f[0]][pos_f[1]] == "--"
             movement_output = "Legal"
        end
        if pos_i[0]+2 == pos_f[0] && pos_i[1] == pos_f[1] && @tablero[pos_f[0]][pos_f[1]] == "--" && pos_i[0]== 1
            movement_output = "Legal"
        end #end if
        if pos_i[0]+1 == pos_f[0] && ( pos_i[1]+1 == pos_f[1] || pos_i[1]-1 == pos_f[1]) && @tablero[pos_f[0]][pos_f[1]].split[0] == "w"
           movement_output = "Legal"
        end
      when "w"
          if pos_i[0]-1 == pos_f[0] && pos_i[1] == pos_f[1] &&  @tablero[pos_f[0]][pos_f[1]] == "--"
               movement_output = "Legal"
          end
          if pos_i[0]-2 == pos_f[0] && pos_i[1] == pos_f[1] && @tablero[pos_f[0]][pos_f[1]] == "--" && pos_i[0]== 1
              movement_output = "Legal"
          end #end if
          if pos_i[0]-1 == pos_f[0] && ( pos_i[1]+1 == pos_f[1] || pos_i[1]-1 == pos_f[1]) && @tablero[pos_f[0]][pos_f[1]].split[0] != "b"
             movement_output = "Legal"
          end
      end#end case
    return movement_output
  end #end def
end#en clase


class Torre
  def initialize (tablero,color)
    @tablero = tablero
    @color = color
  end

  def movement(pos_i,pos_f)
    movement_output = "ILEGAL"


    case @color
    when "b"
        if  pos_i[1] == pos_f[1] #movimiento vertical
          if pos_i[0] < pos_f[0]
            torre_i = pos_i[0] ; torre_f = pos_f[0]
          else
            torre_i = pos_f[0] ; torre_f = pos_i[0]
          end
            movement_output = "Legal"
            puts 1
            if @tablero[pos_f[0]][pos_f[1]].split[0] == "b"
              movement_output = "ILegal"
              puts 2
            end
          (torre_i+1...torre_f).each do |x|
            @tablero[x][pos_f[1]]
            if @tablero[x][pos_f[1]] != "--"
              movement_output = "ILegal"
                puts 3
            end#acaba el if
          end#acaba el do
        end#acaba el movimeinto lateral de la torre

        if  pos_i[0] == pos_f[0] #movimiento lateral
          if pos_i[1] < pos_f[1]
            torre_i = pos_i[1] ; torre_f = pos_f[1]
          else
            torre_i = pos_f[1] ; torre_f = pos_i[1]
          end
            movement_output = "Legal"
            puts 7
            if @tablero[pos_f[1]][pos_f[0]].split[0] == "b"
              movement_output = "ILegal"
              puts 8
            end
          (torre_i+1...torre_f).each do |x|
            @tablero[x][pos_f[0]]
            if @tablero[pos_f[0]][x] != "--"
              movement_output = "ILegal"
              puts 9
            end#acaba el if
          end#acaba el ultimo do
        end#acaba el movimiento lateral
      when "w"
          if  pos_i[1] == pos_f[1] #movimiento vertical
            if pos_i[0] < pos_f[0]
              torre_i = pos_i[0] ; torre_f = pos_f[0]
            else
              torre_i = pos_f[0] ; torre_f = pos_i[0]
            end
              movement_output = "Legal"
              puts 1
              if @tablero[pos_f[0]][pos_f[1]].split[0] == "w"
                movement_output = "ILegal"
                puts 2
              end
            (torre_i+1...torre_f).each do |x|
              @tablero[x][pos_f[1]]
              if @tablero[x][pos_f[1]] != "--"
                movement_output = "ILegal"
                  puts 3
              end#acaba el if
            end#acaba el do
          end#acaba el movimeinto lateral de la torre

          if  pos_i[0] == pos_f[0] #movimiento lateral
            if pos_i[1] < pos_f[1]
              torre_i = pos_i[1] ; torre_f = pos_f[1]
            else
              torre_i = pos_f[1] ; torre_f = pos_i[1]
            end
              movement_output = "Legal"
              puts 7
              if @tablero[pos_f[1]][pos_f[0]].split[0] == "w"
                movement_output = "ILegal"
                puts 8
              end
            (torre_i+1...torre_f).each do |x|
              @tablero[x][pos_f[0]]
              if @tablero[pos_f[0]][x] != "--"
                movement_output = "ILegal"
                puts 9
              end#acaba el if
            end#acaba el ultimo do
          end#acaba el movimiento lateral
    end #acaba el when b
    return movement_output
  end #acaba el def_movement
end#acaba clase









tablero1 = Tablero.new("tablero.txt").def_tablero
tablero2 = Tablero.new("tablero2.txt").def_tablero


p1 = Peon.new(tablero1,"b")
t1 = Torre.new(tablero2,"w")

puts t1.movement([2,2],[3,2])
