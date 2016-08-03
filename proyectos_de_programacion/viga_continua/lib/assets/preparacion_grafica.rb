  module Assets

    class PreparacionGrafica

      def initialize(momento,cortante,deformacion)
        @momento = momento
        @cortante = cortante
        @deformacion = deformacion
        @array_categorias = []
        @array_momentos = []
        @array_cortantes = []
        @array_deformaciones = []
      end

      def array_momentos
        @momento.each do |momento_tramo|
          momento_tramo.each do |x|
            @array_momentos.push(x[1])
          end
        end
        @array_momentos
      end

      def array_cortantes
        @cortante.each do |cortante_tramo|
          cortante_tramo.each do |x|
          @array_cortantes.push(x[1])
          end
        end
        @array_cortantes
      end

      def array_deformaciones
        @deformacion.each do |deformacion_tramo|
          deformacion_tramo.each do |x|

          @array_deformaciones.push((x[1]/(-100)))
          end
        end
        @array_deformaciones
      end

      def array_categorias
        @momento.each do |categoria_tramo|
          categoria_tramo.each do |x|
          @array_categorias.push((x[0].round(2)))
          end
        end
        @array_categorias
      end

    end
  end
