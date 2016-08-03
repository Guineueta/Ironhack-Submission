module Assets

  class ResolverSistema

    def initialize(matrix)
      @matrix = matrix
      @matrix.map!  do |fila|
        fila.map! do |elemento|
          elemento.to_f
        end
      end
    end

    def resolve_system

      @matrix.map!.with_index do |fila,indexF|
        if indexF == 0
          n = fila[0]
          fila.map! do |elemento|
            elemento/n
          end
        else
          indexF.times do |fila_a_restar|
            n = fila[fila_a_restar]
            if n != 0
              fila.map!.with_index do |elemento,indexC|
                #binding.pry
                (elemento/n) - @matrix[fila_a_restar][indexC]
              end
            end
          end
          y = fila[indexF]
          fila.map! do |elemento|
            elemento/y
          end
        end #acaba el if
        #binding.pry
        fila
      end #acaba el primer map ------ la bajada
      @matrix.map!.with_index do |fila,indexF|
        n = indexF + 1
        (@matrix.length - (n)).times do |i|
          multiplicador = fila[ n + i]
          fila.map!.with_index do |elemento,k|
          #binding.pry
            (elemento) - (@matrix[n+i][k])*multiplicador
          end
        end
        #binding.pry
        fila
      end #acaba el segundo map ------ la subida
      @matrix
    end

    def solutionForMx
      n = @matrix.length
      letter = 66
      moments = [["MA",0]] #[[]]
        n.times do |index|
        letter += index
        aux = []
        aux.push("M#{letter.chr}")
        aux.push(@matrix[index][-1])
        #binding.pry
        moments.push(aux)
      end
      moments.push(["M#{(letter+1).chr}","0"])
      moments
    end
  end
end
