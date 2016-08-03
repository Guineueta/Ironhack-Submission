# variables de calculo
#   l => longitud de la viga
#   d => posicion de la carga desde el extremo izquierdo
#   c => longitud de la carga repartida
#   q => valor de la carga en Kn
#   pu => valor de la carga puntual

module Assets

  class VigaBiapoyadaCargapuntual

    def initialize(l,ei,carga)  #carga es un array [d,pu]
      @l  = l.to_f
      @d  = carga[0].to_f
      @p  = carga[1].to_f
      @a  = @d
      @b  = @l - @d
      @ei = ei.to_f
    end

    def reaccion_izquierda
      reaccion_izquierda = (@p*@b)/@l
    end

    def reaccion_derecha
      reaccion_derecha = (@p*@a)/@l
    end

    def shear_in(x)
      if x <= @d
        shearA_C = (@p * @b )/(@l)
      elsif x > @d
        shearC_B = -(@p* @a)/(@l)
      end
    end

    def moment_in(x)
      if x <= @d
        mA_C = (@p * @b * x )/(@l)
      elsif x > @d
        mC_B = (@p * @a *(@l - x))/ (@l)
      end
    end

    def giro_izquierda
      giroA = - ( (@p * @a * @b) / (6* @ei * @l) ) * (@l + @b)
    end
    def giro_derecha
      giroB = ( (@p * @a * @b) / (6* @ei * @l) ) * (@l + @a)
    end

    def elastica_in(x)
      if x <= @d
        elastic_A_C = ( (@p*@l*@b*x)/(6 * @ei) ) * (1 - ((@b**2)/(@l**2))- ((x**2)/(@l**2)) )
      elsif x > @d
        elastic_C_B = ( (@p*@l*@b*(@l-x))/(6 * @ei) ) * (1 - ((@a**2)/(@l**2))- (((@l-x)**2)/(@l**2)) )
      end
    end
  end
end
