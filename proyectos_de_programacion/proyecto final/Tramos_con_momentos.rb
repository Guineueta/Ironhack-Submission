require_relative 'Tramo.rb'
require_relative 'resolver_sistema.rb'

require 'pry'


class TramosConMomentos

  def initialize(tramos,momentos)
    @tramos = tramos
    @momentos = momentos
  end

  def añadirMomentos
    @tramos.map!.with_index do |viga,index|
      #binding.pry
      if index == 0
        m1 = 0
      else
        m1 = @momentos[index-1][-1]
      end
      if index + 1 > @momentos.length
        m2 = 0
      else
        m2 = @momentos[index][-1]
      end
        #binding.pry
      viga.mI += m1
      viga.mD += m2
      #binding.pry
      viga
    end
    #binding.pry
    @tramos
  end

end
