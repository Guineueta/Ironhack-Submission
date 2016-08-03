require_relative 'Tramo.rb'

require 'pry'

class GenerateMatrix

  attr_accessor :matrix

  def initialize(tramos)
    @tramos = tramos
    @matrix = []
    @fil = @tramos.length - 1 #numero de filas
    @col = @tramos.length     #numero de columnas
    self.generar_matriz
  end

  def generar_matriz
    @fil.times do |index|
      if index == 0
        fila = Array.new(@col,0)
        fila[0]      = (@tramos[0].l + @tramos[1].l)/3.0
        fila[1]      = @tramos[1].l/6.0
        fila[@col-1] = @tramos[0].giros_derecha.abs + @tramos[1].giros_izquierda.abs
        @matrix.push(fila)
      elsif index == @fil-1   #es igual a la ultima fila
        fila = Array.new(@col,0)
        fila[@col-3] = @tramos[@col-2].l/6.0
        fila[@col-2] = (@tramos[@col-2].l + @tramos[@col-3].l)/3.0
        fila[@col-1] = @tramos[@col-2].giros_derecha.abs + @tramos[@col-1].giros_izquierda.abs
        @matrix.push(fila)
      else
        fila = Array.new(@col,0)
        fila[index-1] = @tramos[index].l/6.0
        fila[index]   = (@tramos[index].l + @tramos[index+1].l)/3.0
        fila[index+1] = @tramos[index+1].l/6.0
        fila[@col-1]= @tramos[@col-2].giros_derecha.abs + @tramos[@col-1].giros_izquierda.abs
        @matrix.push(fila)

      end
    end
      @matrix
  end
end
