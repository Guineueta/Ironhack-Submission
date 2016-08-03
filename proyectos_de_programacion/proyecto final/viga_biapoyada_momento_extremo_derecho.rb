# variables de calculo
#   l => longitud de la viga
#   d => posicion de la carga desde el extremo izquierdo
#   c => longitud de la carga repartida
#   q => valor de la carga en Kn
#   p => valor de la carga puntual
#   m => valor del momento en KNm (sentido antihorario)


class VigaBiapoyadaMomentoExtremoDerecho

  def initialize(l,ei=1,m)
    @l  = l.to_f
    @m = m.to_f
    @ei = ei.to_f
  end

  def reaccion_izquierda
    reaccion_izquierda = -(@m)/@l
  end

  def reaccion_derecha
    reaccion_derecha = (@m)/@l
  end

  def shear_in(x)
    shear = -(@m)/(@l)
  end

  def moment_in(x)
    mA_B = (@m/@l) * x
  end

  def giros
    giroA = (- @m*@l) / (6*@ei)
    giroB = (@m*@l) / (3*@ei)
  end

  def elastica_in(x)
    x = @l - x
    elastic_A_B = (-(@m*@l)/(6*@ei)) * (@l-x) * ( 1 - (((@l-x)/@l)**2))
  end

end
