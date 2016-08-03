
def cortante(intervalo)
  grafica = []
  @tramos.each.with_index do |tramos,index|
    grafica_tramo = []
    x = 0
    if index == 0
      l = 0
    else
      l += @tramos[index-1]
    end

    while x <= tramos.l
      cortante = 0

      tramos.cargas.each do |carga|
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
      x += intervalo
    end #acaba el while
    grafica.push(grafica_tramo)
  end #acaba el do de tramos
  grafica
end
