#
# Representa los datos antropométricos de un individuo
# @author Sergio Reyes de León
#
class Antropometria
    
    attr_reader :edad, :peso, :talla, :sexo,
                :cintura, :cadera, :bicipital, 
                :tricipital, :subescapular, :suprailiaco, 
                :muslo, :abdominal, :pecho, :axilar, :pierna    

    #
    # Constructor
    #
    # @param [int] edad <description>
    # @param [float] peso <description>
    # @param [float] talla <description>
    # @param [int] sexo <description>
    # @param [float] cintura <description>
    # @param [float] cadera <description>
    # @param [float] bicipital <description>
    # @param [float] tricipital <description>
    # @param [float] subescapular <description>
    # @param [float] suprailiaco <description>
    # @param [float] muslo <description>
    # @param [float] abdominal <description>
    # @param [float] pecho <description>
    # @param [float] axilar <description>
    # @param [float] pierna <description>
    #
    def initialize(edad, peso, talla, sexo, cintura, cadera, bicipital, tricipital, subescapular, suprailiaco, muslo, abdominal, pecho, axilar, pierna)
        @edad = edad
        @peso = peso
        @talla = talla
        @sexo = sexo # 1 hombre, 0 mujer
        @cintura = cintura
        @cadera = cadera
        @bicipital = bicipital
        @tricipital = tricipital
        @subescapular = subescapular
        @suprailiaco = suprailiaco
        @muslo = muslo
        @abdominal = abdominal
        @pecho = pecho
        @axilar = axilar
        @pierna = pierna        
    end

    #
    # Índice de Masa Corporal
    #
    # @return [float] imc
    #
    def imc
		return (peso / (talla*talla)).round(2)
	end

	#
    # Porcentaje de grasa
    #
    # @return [float] % de grasa
    #
    def grasa
	    return (1.2 * imc() + 0.253 * edad - 10.8 * sexo - 5.4).round(2)
	end

	def rcc
		return (cintura / cadera).round(2)
	end

	#
    # Calcular media de las medidas de un pliegue
    #
    # @param [array] medidas medidas de un pliegue
    #
    # @return [<Type>] media del pliegue
    #
    def media_pliegue (medidas)
		suma_medidas = 0

		for medida in medidas do
			suma_medidas += medida
		end

		return (suma_medidas / medidas.length).round(2)
    end
    
    #
    # Sobrecarga del método to_s
    #
    # @return [String] salida formateada de Antropometría
    #
    def to_s
        str = "Peso: #{@peso}\n"
		str += "Altura: #{@talla}\n"
		str += "Edad: #{@edad}\n"
		str += "Sexo: #{@sexo}\n"
		str += "Cincurferencia de la cintura: #{@cintura}\n"
		str += "Cincurferencia de la cadera: #{@cadera}\n"
		str += "IMC: #{self.imc}\n"
		str += "% de grasa: #{self.grasa}\n"
        str += "RCC: #{self.rcc}\n"
    end

end