require_relative 'Tramo.rb'
require_relative 'generate_matrix.rb'
require_relative 'Tramos_con_momentos'
require_relative 'resolver_sistema'


class SolucionFinal

  def initialize(tramos,intervalo=0.1)
    @tramos = tramos
    @intervalo = intervalo
  end
  # letter = 65 + index
  # aux = []
  # aux.push("M-#{letter.chr}")
  # aux.push(@matrix[index][-1])

  def reacciones()
    reacciones = []
    reaccion_izquierda = 0
    reaccion_derecha = 0
    tramo = @tramos[0]
    tramo.cargas.each do |carga|
      if carga.length == 2
        reaccion_izquierda += VigaBiapoyadaCargapuntual.new(tramo.l,tramo.ei,carga).reaccion_derecha
      elsif carga.length == 3
        reaccion_izquierda += BiapoyadaRepartidaCargaRectangular.new(tramo.l,tramo.ei,carga).reaccion_derecha
      end
      reaccion_izquierda
    end #acaba el do de cargas
    reaccion_izquierda += VigaBiapoyadaMomentoExtremoIzquierdo.new(tramo.l,tramo.ei,tramo.mI).reaccion_izquierda
    reaccion_izquierda += VigaBiapoyadaMomentoExtremoDerecho.new(tramo.l,tramo.ei,tramo.mD).reaccion_izquierda
    reaccion = ["RA",reaccion_izquierda]
    reacciones.push(reaccion)

    @tramos.each.with_index do |tramo,index|
      letter = (66 + index).chr
      tramo.cargas.each do |carga|
        if carga.length == 2
          reaccion_derecha += VigaBiapoyadaCargapuntual.new(tramo.l,tramo.ei,carga).reaccion_derecha
        elsif carga.length == 3
          reaccion_derecha += BiapoyadaRepartidaCargaRectangular.new(tramo.l,tramo.ei,carga).reaccion_derecha
        end
        reaccion_derecha
      end #acaba el do de cargas
      reaccion_derecha += VigaBiapoyadaMomentoExtremoIzquierdo.new(tramo.l,tramo.ei,tramo.mI).reaccion_derecha
      reaccion_derecha += VigaBiapoyadaMomentoExtremoDerecho.new(tramo.l,tramo.ei,tramo.mD).reaccion_derecha
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
            cortante += VigaBiapoyadaCargapuntual.new(tramo.l,tramo.ei,carga).shear_in(x)
          elsif carga.length == 3
            cortante += BiapoyadaRepartidaCargaRectangular.new(tramo.l,tramo.ei,carga).shear_in(x)
          end
        end #acaba el do de cargas
        cortante += VigaBiapoyadaMomentoExtremoIzquierdo.new(tramo.l,tramo.ei,tramo.mI).shear_in(x)
        cortante += VigaBiapoyadaMomentoExtremoDerecho.new(tramo.l,tramo.ei,tramo.mD).shear_in(x)
        grafica_tramo.push([l+x,cortante])
        x += @intervalo.round(1)
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
            momento += VigaBiapoyadaCargapuntual.new(tramo.l,tramo.ei,carga).moment_in(x)
          elsif carga.length == 3
            momento += BiapoyadaRepartidaCargaRectangular.new(tramo.l,tramo.ei,carga).moment_in(x)
          end
        end #acaba el do de cargas
        momento -= VigaBiapoyadaMomentoExtremoIzquierdo.new(tramo.l,tramo.ei,tramo.mI).moment_in(x)
        momento -= VigaBiapoyadaMomentoExtremoDerecho.new(tramo.l,tramo.ei,tramo.mD).moment_in(x)
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
            deformacion += VigaBiapoyadaCargapuntual.new(tramo.l,tramo.ei,carga).elastica_in(x)
          elsif carga.length == 3
            deformacion += BiapoyadaRepartidaCargaRectangular.new(tramo.l,tramo.ei,carga).elastica_in(x)
          end
        end #acaba el do de cargas
        deformacion -= VigaBiapoyadaMomentoExtremoIzquierdo.new(tramo.l,tramo.ei,tramo.mI).elastica_in(x)
        deformacion -= VigaBiapoyadaMomentoExtremoDerecho.new(tramo.l,tramo.ei,tramo.mD).elastica_in(x)
        grafica_tramo.push([l+x,deformacion])
        x += @intervalo
      end #acaba el while
      grafica_deformacion.push(grafica_tramo)
    end #acaba el do de tramos
    grafica_deformacion
  end

end



cargasViga_ej1 = [[0,10.0,3]]
cargasViga_ej2 = [[0,10.0,6]]

viga_ej1 = Tramo.new([3,1,cargasViga_ej1])
viga_ej2 = Tramo.new([3,1,cargasViga_ej1])
viga_ej3 = Tramo.new([3,1,[]])

viga_ej4 = Tramo.new([3,1,cargasViga_ej1])

viga_continua = [viga_ej1,viga_ej2,viga_ej3]

matrix = GenerateMatrix.new(viga_continua).matrix

matrix_diagonal =  ResolverSistema.new(matrix).resolve_system

tramos_con_momentos = TramosConMomentos.new(viga_continua,matrix).añadirMomentos

cortante = SolucionFinal.new(tramos_con_momentos).cortante
momento = SolucionFinal.new(tramos_con_momentos).momento
deformacion = SolucionFinal.new(tramos_con_momentos).deformacion
reacciones = SolucionFinal.new(tramos_con_momentos).reacciones

binding.pry
