# variables de calculo
#   l => longitud de la viga
#   d => posicion de la carga desde el extremo izquierdo
#   c => longitud de la carga repartida
#   q => valor de la carga en Kn
#   p => valor de la carga puntual
#   m => valor del momento en KNm (sentido antihorario)
#   va => reaccion en el apoyo izquierdo
#   vb => reaccion en el apoyo derecho


require 'pry'


class VigaBiapoyadaRepartidaTriangularIzquierdaDerecha

  def initialize(l,d,c,q,ei=1)
    @l  = l.to_f
    @d  = d.to_f
    @c  = c.to_f
    @q  = q.to_f
    @a = (@d)+(@c*((1.0/3).to_f))
    @b  = @l - @a
    @ei = ei.to_f
    @va = ((@q * 0.5 * @c)/@l) * @b
    @vb = ((@q * 0.5 * @c)/@l) * @a
  end

  def shear_in(x)
    t = @q - ((@q/@c)*(x-@d))
    f = @q - t
    if x <= @d
      # puts "1"
      shearA_C = ((@q * 0.5 * @c)/@l) * @b
    elsif @d < x  && x < @d + @c
      puts "2"
      shearC_D_triangular = 0.5 * f * (x-@d)
      shearC_D_rectangular = t * (x-@d)
      shearC_D = shearC_D_rectangular + shearC_D_triangular - @va
      # binding.pry

    elsif x >= @d + @c
      puts "3"
      -shearD_B = ((@q * 0.5 * @c)/@l) * @a
    end
  end

  def moment_in(x)

    f = ((@q/@c)*(x-@d))
    t = @q - f
    shearC_D_triangular = 0.5*f*(x-@d)
    shearC_D_rectangular = t* (x-@d)
    shearC_D = shearC_D_rectangular + shearC_D_triangular - @va
    if x <= @d
      mA_C = (@q * @b * @c * x )/(@l)
    elsif @d < x  && x <= @d + @c
      mC_D_triangular =  - ( 0.5 * f * (x-@d) * (@d + (1.0/3) * (x-@d)))
      mC_D_rectangular =  - ( t * (x-@d) * ( @d + 0.5 * (x-@d)))
      mC_D = shearC_D * x + mC_D_triangular + mC_D_rectangular
    elsif x > @d + @c
      mD_B = (@q * @a * @c * (@l - x))/ (@l)
    end
  end

  def giros
    giroA = - ( (@q * @a * @b * @c) / (6* @ei * @l) ) * (@l + @b - ( (@c**2) / (4*@a)))
    giroB = ( (@q * @a * @b * @c) / (6* @ei * @l) ) * (@l + @a - ( (@c**2) / (4*@b)))
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



viga1 = Biapoyada_repartida_triangular_izquierda_derecha.new(15,3,5,20,1)   #(l,d,c,q,ei=1)


puts " reac apoyo a"
puts viga1.shear_in(0)
puts "----------------"
puts " reac apoyo b"
puts viga1.shear_in(15)
puts "----------------"
puts " cort l/2"
puts viga1.shear_in(5)
puts "----------------"

puts ""
puts ""

puts " momento a"
puts viga1.moment_in(0)
puts "----------------"
puts " momento b"
puts viga1.moment_in(15)
puts "----------------"
puts " momento en medio"
puts viga1.moment_in(7.5)
puts "----------------"

puts ""
puts ""

puts " elastica a"
puts viga1.elastica_in(0)
puts "----------------"
puts " elastica b"
puts viga1.elastica_in(15)
puts "----------------"
puts " elastica en medio"
puts viga1.elastica_in(7.5)
