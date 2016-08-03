
# variables de calculo
#   l => longitud de la viga
#   d => posicion de la carga desde el extremo izquierdo
#   c => longitud de la carga repartida
#   q => valor de la carga en Kn
#   p => valor de la carga puntual


require 'pry'

class BiapoyadaRepartidaCargaRectangular

  def initialize(l,ei=1,carga)  #carga es un array [d,q,c]
    @l  = l.to_f
    @d  = carga[0].to_f
    @q  = carga[1].to_f
    @c  = carga[2].to_f
    @a  = (@d+@c*0.5)
    @b  = (@l - @a).to_f
    @ei = ei.to_f
  end

  def reaccion_izquierda
    reaccion_izquierda = (@q*@b*@c)/@l
  end

  def reaccion_derecha
    reaccion_derecha = (@q*@a*@c)/@l
  end

  def shear_in(x)
    if x <= @d
      shearA_C = (@q*@c*@b)/(@l)
    elsif @d < x  && x <= @d + @c
      shearC_D = (@q*@c*@b)/(@l) - @q*(@c*0.5- @a + x)
    elsif x > @d + @c
      shearD_B = -(@q*@c*@a)/(@l)
    end
  end

  def moment_in(x)
    if x <= @d
      mA_C = (@q * @b * @c * x )/(@l)
    elsif @d < x  && x <= @d + @c
      mC_D = (@q * @b * @c * x )/(@l) - ((@q * 0.5) * (( x- @a +(@c*0.5))**2))
    elsif x > @d + @c
      mD_B = (@q * @a * @c * (@l - x))/ (@l)
    end
  end

  def giro_izquierda
    giroA = - ( (@q * @a * @b * @c) / (6* @ei * @l) ) * (@l + @b - ( (@c**2) / (4*@a)))
    # binding pry
  end
  def giro_derecha
    giroB = ( (@q * @a * @b * @c) / (6* @ei * @l) ) * (@l + @a - ( (@c**2) / (4*@b)))
    # binding pry

  end

  def elastica_in(x)
    if x <= @d
      # elastic_A_C = ( -1 * (@q * @b * @c * x) / ( 6 * @ei * @l ) ) * ( -1 * (x**2) + @a * ( @l + @b - ( (@c**2) / (4*@a) ) ) )
      elastic_A_C = ( (@q*@b*@c*x)/(6*@ei*@l)) * (- (x**2) + @a * (@l+@b-((@c**2)/(4*@a) )))
    elsif @d < x  && x <= @d + @c
      elastic_C_D = ( @q / ( 24 * @ei * @l ) ) *  ( @l * ( ( x - @a +  (@c*0.5) ) **4)  - 4*@b*@c*(x**3) + 4*@a*@b*@c * ( @l + @b - ( (@c**2) / (4*@a) ) ) * x)
    elsif x > @d + @c
      elastic_D_B = ( (@q * @a * @c * (@l - x)) / (6 * @ei * @l) ) * ( ( - ((@l-x)**2 )) + @b * ( @l + @b - ( (@c**2) / ( 4* @b)  )))
    end
  end

end






# longitud_viga = 7.0
# carga_repartida = 6.0
# longitud_carga = 3.0
# posicion_carga = 2.0
#
#
# carga = [posicion_carga,carga_repartida,longitud_carga]
#
# viga1 = Biapoyada_repartida_rectangular.new(longitud_viga,1,carga) #(l,ei,d,q,c)

#
# puts " reac apoyo a"
# puts viga1.shear_in(0)
# puts "----------------"
# puts " reac apoyo b"
# puts viga1.shear_in(longitud_viga)
# puts "----------------"
# puts " cort l/2"
# puts viga1.shear_in(longitud_viga/2)
# puts "----------------"
#
# puts ""
# puts ""
#
# puts " momento a"
# puts viga1.moment_in(0)
# puts "----------------"
# puts " momento b"
# puts viga1.moment_in(longitud_viga)
# puts "----------------"
# puts " momento en medio"
# puts viga1.moment_in(longitud_viga/2)
# puts "----------------"
#
# puts ""
# puts ""
#
# puts " elastica a"
# puts viga1.elastica_in(0)
# puts "----------------"
# puts " elastica b"
# puts viga1.elastica_in(longitud_viga)
# puts "----------------"
# puts " elastica en medio"
# puts viga1.elastica_in(longitud_viga/2)
#
# puts ""
# puts ""
#
# puts viga1.giro_izquierda
#
# puts viga1.giro_derecha
