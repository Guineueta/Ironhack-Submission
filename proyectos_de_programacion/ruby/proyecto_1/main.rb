


class Matrices

  def initialize (matriz)
    @matriz = matriz
    @filas = @matriz.length
    @columnas = @matriz[0].length
    puts @columnas
  end

  def comprobar_matriz
    n = 0
    @matriz.each do |fila|
      if fila.length != @columnas
        n += 1
      end
    end

    if n == 0
      puts "Es una matriz #{@filas} x #{@columnas}"
      puts "f #{n}"
      return true
    else
      puts "La matriz es incorrecta"
      puts "f #{n}"
      return false
    end
  end

  def resolver_sistema
    

end


















matriz = [
          [1,2,3],
          [2,3,2],
          [3,1,2],
          ]


matriz1 = Matrices.new(matriz).comprobar_matriz
