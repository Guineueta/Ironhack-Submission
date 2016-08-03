class SiteController < ApplicationController
  before_action :variables

  def home
    if params[:numero_vanos]
      render 'modelo'
    else
      render 'home'
    end
  end



  def solucion
    viga_continua = []
    @nV.times do |i|
      tramo = []
      cargas = []
      if params[("L0").to_sym] == ""
        params[("L0").to_sym] = 1.0
      end
      if params[("L#{i}").to_sym] == ""
        params[("L#{i}").to_sym] = params[("L0").to_sym]
      end
      tramo.push(params[("L#{i}").to_sym].to_f)
      if params[("ei#{i}").to_sym] == ""
        params[("ei#{i}").to_sym] = 1
      end
      tramo.push(params[("ei#{i}").to_sym].to_f)
      @n.times do |j|
        carga = []
        if params[("c#{i}#{j}").to_sym] == "" &&  params[("p#{i}#{j}").to_sym] == "" &&  params[("l#{i}#{j}").to_sym] == ""

        elsif params[("c#{i}#{j}")] == "" && params[("l#{i}#{j}")]== ""
          carga.push(0)
          carga.push(params[("p#{i}#{j}").to_sym].to_f)
          carga.push(params[("L#{i}").to_sym].to_f)
        elsif params[("l#{i}#{j}").to_sym] == ""
          carga.push(params[("c#{i}#{j}").to_sym].to_f)
          carga.push(params[("p#{i}#{j}").to_sym].to_f)
        else
          carga.push(params[("c#{i}#{j}").to_sym].to_f)
          carga.push(params[("p#{i}#{j}").to_sym].to_f)
          carga.push(params[("l#{i}#{j}").to_sym].to_f)
        end

        if carga == []
        elsif
        cargas.push(carga)
        end
      end
      tramo.push(cargas)
      viga_continua.push(tramo)
    end

    @viga_continua = viga_continua
    @viga_continua.map! do |tramo|
      Assets::Tramo.new(tramo)
    end
    matrix = Assets::GenerateMatrix.new(@viga_continua).matrix
    matrix_diagonal =  Assets::ResolverSistema.new(matrix).resolve_system
    tramos_con_momentos = Assets::TramosConMomentos.new(viga_continua,matrix).añadirMomentos

    @array_momentos =  Assets::ResolverSistema.new(matrix).solutionForMx
    @resultados = Assets::SolucionFinal.new(tramos_con_momentos)
    @reacciones = @resultados.reacciones
    @momentos = @resultados.momento
    @cortantes = @resultados.cortante
    @deformaciones = @resultados.deformacion
    @prepGraf = Assets::PreparacionGrafica.new(@momentos,@cortantes,@deformaciones)



    gon.array_momentos = @prepGraf.array_momentos
    gon.array_cortantes =  @prepGraf.array_cortantes
    gon.array_deformaciones = @prepGraf.array_deformaciones
    gon.array_categorias = @prepGraf.array_categorias
    #byebug
  end


protected

  def variables
    @nV = params[:numero_vanos].to_i
    @n = 3
  end


end
