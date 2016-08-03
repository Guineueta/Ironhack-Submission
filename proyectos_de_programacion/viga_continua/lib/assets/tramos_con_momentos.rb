module Assets
  class TramosConMomentos
    def initialize(tramos,momentos)
      @tramos = tramos
      @momentos = momentos
    end

    def añadirMomentos
      @tramos.map!.with_index do |viga,index|
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
        viga.mI += m1
        viga.mD += m2
        viga
      end
      @tramos
    end
  end
end
