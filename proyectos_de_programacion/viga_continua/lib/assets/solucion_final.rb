module Assets
  class SolucionFinal

    def initialize(tramos,intervalo=0.05)
      @tramos = tramos
      @intervalo = intervalo
    end
    def reacciones()
      reacciones = []
      reaccion_izquierda = 0
      reaccion_derecha = 0
      tramo = @tramos[0]
      tramo.cargas.each do |carga|
        if carga.length == 2
          reaccion_izquierda += Assets::VigaBiapoyadaCargapuntual.new(tramo.l,tramo.ei,carga).reaccion_derecha
        elsif carga.length == 3
          reaccion_izquierda += Assets::BiapoyadaRepartidaCargaRectangular.new(tramo.l,tramo.ei,carga).reaccion_derecha
        end
        reaccion_izquierda
      end #acaba el do de cargas
      reaccion_izquierda += Assets::VigaBiapoyadaMomentoExtremoIzquierdo.new(tramo.l,tramo.ei,tramo.mI).reaccion_izquierda
      reaccion_izquierda += Assets::VigaBiapoyadaMomentoExtremoDerecho.new(tramo.l,tramo.ei,tramo.mD).reaccion_izquierda
      reaccion = ["RA",reaccion_izquierda]
      reacciones.push(reaccion)

      @tramos.each.with_index do |tramo,index|
        letter = (66 + index).chr
        tramo.cargas.each do |carga|
          if carga.length == 2
            reaccion_derecha += Assets::VigaBiapoyadaCargapuntual.new(tramo.l,tramo.ei,carga).reaccion_derecha
          elsif carga.length == 3
            reaccion_derecha += Assets::BiapoyadaRepartidaCargaRectangular.new(tramo.l,tramo.ei,carga).reaccion_derecha
          end
          reaccion_derecha
        end #acaba el do de cargas
        reaccion_derecha += Assets::VigaBiapoyadaMomentoExtremoIzquierdo.new(tramo.l,tramo.ei,tramo.mI).reaccion_derecha
        reaccion_derecha += Assets::VigaBiapoyadaMomentoExtremoDerecho.new(tramo.l,tramo.ei,tramo.mD).reaccion_derecha
        reaccion = ["R#{letter}",reaccion_derecha]
        reacciones.push(reaccion)
      end
      reacciones
    end

    def cortante()
      grafica_cortante = []
      l = 0
      @tramos.each.with_index do |tramo,index|
        grafica_tramo = []
        x = 0
        if index != 0
          l += @tramos[index-1].l
        end

        while x <= tramo.l
          cortante = 0
          tramo.cargas.each do |carga|
            cortante_en_x = [l+x,cortante]
            if carga.length == 2
              cortante += Assets::VigaBiapoyadaCargapuntual.new(tramo.l,tramo.ei,carga).shear_in(x)
            elsif carga.length == 3
              cortante += Assets::BiapoyadaRepartidaCargaRectangular.new(tramo.l,tramo.ei,carga).shear_in(x)
            end
          end #acaba el do de cargas
          cortante += Assets::VigaBiapoyadaMomentoExtremoIzquierdo.new(tramo.l,tramo.ei,tramo.mI).shear_in(x)
          cortante += Assets::VigaBiapoyadaMomentoExtremoDerecho.new(tramo.l,tramo.ei,tramo.mD).shear_in(x)
          grafica_tramo.push([l+x,cortante])
          x += @intervalo
          x.round(2)
        end #acaba el while
        grafica_cortante.push(grafica_tramo)
      end #acaba el do de tramos

      grafica_cortante
    end

    def momento
      grafica_momentos = []
      l = 0
      @tramos.each.with_index do |tramo,index|
        grafica_tramo = []
        x = 0
        if index != 0
          l += @tramos[index-1].l
        end

        while x <= tramo.l
          momento = 0
          tramo.cargas.each do |carga|
            momento_en_x = [l+x,momento]
            if carga.length == 2
              momento += Assets::VigaBiapoyadaCargapuntual.new(tramo.l,tramo.ei,carga).moment_in(x)
            elsif carga.length == 3
              momento += Assets::BiapoyadaRepartidaCargaRectangular.new(tramo.l,tramo.ei,carga).moment_in(x)
            end
          end #acaba el do de cargas
          momento -= Assets::VigaBiapoyadaMomentoExtremoIzquierdo.new(tramo.l,tramo.ei,tramo.mI).moment_in(x)
          momento -= Assets::VigaBiapoyadaMomentoExtremoDerecho.new(tramo.l,tramo.ei,tramo.mD).moment_in(x)
          grafica_tramo.push([l+x,momento])
          x += @intervalo
        end #acaba el while
        grafica_momentos.push(grafica_tramo)
      end #acaba el do de tramos
      grafica_momentos
    end


    def deformacion
      grafica_deformacion = []
      l = 0
      @tramos.each.with_index do |tramo,index|
        grafica_tramo = []
        x = 0
        if index != 0
          l += @tramos[index-1].l
        end

        while x <= tramo.l
          deformacion = 0
          tramo.cargas.each do |carga|
            deformacion_en_x = [l+x,deformacion]
            if carga.length == 2
              deformacion += Assets::VigaBiapoyadaCargapuntual.new(tramo.l,tramo.ei,carga).elastica_in(x)
            elsif carga.length == 3
              deformacion += Assets::BiapoyadaRepartidaCargaRectangular.new(tramo.l,tramo.ei,carga).elastica_in(x)
            end
          end #acaba el do de cargas
          deformacion -= Assets::VigaBiapoyadaMomentoExtremoIzquierdo.new(tramo.l,tramo.ei,tramo.mI).elastica_in(x)
          deformacion -= Assets::VigaBiapoyadaMomentoExtremoDerecho.new(tramo.l,tramo.ei,tramo.mD).elastica_in(x)
          grafica_tramo.push([l+x,deformacion])
          x += @intervalo
        end #acaba el while
        grafica_deformacion.push(grafica_tramo)
      end #acaba el do de tramos
      grafica_deformacion
    end
  end
end
