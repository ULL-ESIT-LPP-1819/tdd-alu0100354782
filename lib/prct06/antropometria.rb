class Antropometria
    
    attr_reader :edad, :peso, :talla, :sexo,
                :cintura, :cadera, :bicipital, 
                :tricipital, :subescapular, :suprailiaco, 
                :muslo, :abdominal, :pecho, :axilar, :pierna    

    def initialize(edad, peso, talla, sexo, cintura, cadera, 
                   bicipital, tricipital, subescapular, suprailiaco, 
                   muslo, abdominal, pecho, axilar, pierna)                
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

    def imc
		return (peso / (talla*talla)).round(2)
	end

	def grasa
	    return (1.2 * imc() + 0.253 * edad - 10.8 * sexo - 5.4).round(2)
	end

	def rcc
		return (cintura / cadera).round(2)
	end

	def media_pliegue (medidas)
		suma_medidas = 0

		for medida in medidas do
			suma_medidas += medida
		end

		return (suma_medidas / medidas.length).round(2)
	end

end