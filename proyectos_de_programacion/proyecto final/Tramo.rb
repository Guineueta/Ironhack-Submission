require_relative "viga_biapoyada_carga_puntual.rb"
require_relative "viga_biapoyada_carga_repartida.rb"
require_relative 'viga_biapoyada_momento_extremo_derecho'
require_relative 'viga_biapoyada_momento_extremo_izquierdo'



class Tramo

attr_accessor :mD, :mI, :l, :cargas, :ei

  def initialize(array)
    @l = array[0]
    @ei = array[1]
    @cargas = array[2]
    @mI = 0
    @mD = 0
  end

  def giros_izquierda
    suma_de_giros_izquierda = 0
    @cargas.each do |carga|
      if carga.length == 2
        # puts "1 iz"
        # puts Biapoyada_puntual.new(@l,@ei,carga).giro_izquierda
        suma_de_giros_izquierda += VigaBiapoyadaCargapuntual.new(@l,@ei,carga).giro_izquierda
        # puts suma_de_giros_izquierda
      elsif carga.length == 3
        # puts "2 iz"
        # puts Biapoyada_repartida_rectangular.new(@l,@ei,carga).giro_izquierda
        suma_de_giros_izquierda += BiapoyadaRepartidaCargaRectangular.new(@l,@ei,carga).giro_izquierda
        # puts suma_de_giros_izquierda

      end
    end
    suma_de_giros_izquierda
  end

  def giros_derecha
    suma_de_giros_derecha = 0
    @cargas.each do |carga|
      if carga.length == 2
        # puts "1 der"
        # puts Biapoyada_puntual.new(@l,@ei,carga).giro_izquierda
        suma_de_giros_derecha += VigaBiapoyadaCargapuntual.new(@l,@ei,carga).giro_derecha
        # puts suma_de_giros_derecha
      elsif carga.length == 3
        # puts "2 der"
        # puts Biapoyada_repartida_rectangular.new(@l,@ei,carga).giro_izquierda
        suma_de_giros_derecha += BiapoyadaRepartidaCargaRectangular.new(@l,@ei,carga).giro_derecha
        # puts suma_de_giros_derecha
      end
    end
    suma_de_giros_derecha
  end

end


# cada viga estara definida por un array,
# array[0] => sera la longitud de la viga
# array[1] => sera EI
# array[2] => sera un array que contenga las cargas, cada carga sera un array diferente

# variables de calculo
#   l => longitud de la viga
#   d => posicion de la carga desde el extremo izquierdo
#   c => longitud de la carga repartida
#   q => valor de la carga en Kn
#   pu => valor de la carga puntual
#  puntual (l,ei,d,pu,)
#  repartida (l,ei,d,q,c)


# cargasViga1 = [[2.5,15.0],[0.0,5,5]]
# cargasViga2 = [[5.0,15.0]]
# cargasViga3 = [[2.0,7.0,3.0]]
# cargasViga4 = [[4.5,15.0]]
#
# viga1 = Tramo.new(5,1,cargasViga1)
# viga2 = Tramo.new(6,1,cargasViga2)
# viga3 = Tramo.new(7,1,cargasViga3)
# viga4 = Tramo.new(9,1,cargasViga4)

# puts viga1.giros_izquierda
# puts viga1.giros_derecha
# puts"-----------------------"
# puts viga2.giros_izquierda
# puts viga2.giros_derecha
# puts"-----------------------"
# puts viga3.giros_izquierda
# puts viga3.giros_derecha
# puts"-----------------------"
# puts viga4.giros_izquierda
# puts viga4.giros_derecha
# puts"-----------------------"
