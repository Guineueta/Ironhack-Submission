module Assets

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
          suma_de_giros_izquierda += Assets::VigaBiapoyadaCargapuntual.new(@l,@ei,carga).giro_izquierda
          # puts suma_de_giros_izquierda
        elsif carga.length == 3
          # puts "2 iz"
          # puts Biapoyada_repartida_rectangular.new(@l,@ei,carga).giro_izquierda
          suma_de_giros_izquierda += Assets::BiapoyadaRepartidaCargaRectangular.new(@l,@ei,carga).giro_izquierda
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
          suma_de_giros_derecha += Assets::VigaBiapoyadaCargapuntual.new(@l,@ei,carga).giro_derecha
          # puts suma_de_giros_derecha
        elsif carga.length == 3
          # puts "2 der"
          # puts Biapoyada_repartida_rectangular.new(@l,@ei,carga).giro_izquierda
          suma_de_giros_derecha += Assets::BiapoyadaRepartidaCargaRectangular.new(@l,@ei,carga).giro_derecha
          # puts suma_de_giros_derecha
        end
      end
      suma_de_giros_derecha
    end

  end
end
