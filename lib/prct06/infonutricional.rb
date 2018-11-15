


class InfoNutricional

	attr_reader :nombre_, :grasas_, :grasas_saturadas_, :hidratos_, :azucares_, :proteinas_, :sal_, :grasas_m_, :grasas_p_, :polialcoholes_, :almidon_, :fibra_, :vitaminas_, :minerales_

	def initialize(nombre, grasas, grasas_saturadas, hidratos, azucares, proteinas, sal, grasas_m, grasas_p, polialcoholes, almidon, fibra, vitaminas, minerales)
		@nombre_ = nombre
		@grasas_ = grasas
		@grasas_saturadas_ = grasas_saturadas
		@hidratos_ = hidratos
		@azucares_ = azucares
		@proteinas_ = proteinas
		@sal_ = sal
		@grasas_m_ = grasas_m
		@grasas_p_ = grasas_p
		@polialcoholes_ = polialcoholes
		@almidon_ = almidon
		@fibra_ = fibra
		@vitaminas_ = vitaminas
		@minerales_ = minerales
	end

	def get_nombre
		@nombre_
	end	

	def get_val_energetico_kj
		@grasas_*37 + @grasas_m_*37 + @grasas_p_*37 + @hidratos_*17 + @polialcoholes_*10 + @almidon_*17 + @fibra_*8 + @proteinas_*17 + @sal_*25
	end

	def get_val_energetico_kcal
		@grasas_*9 + @grasas_m_*9 + @grasas_p_*9 + @hidratos_*4 + @polialcoholes_*2.4 + @almidon_*4 + @fibra_*2 + @proteinas_*4 + @sal_*6
	end

	def get_grasas
		@grasas_
	end

	def get_grasas_saturadas
		@grasas_saturadas_
	end

	def get_hidratos
		@hidratos_
	end

	def get_azucares
		@azucares_
	end

	def get_proteinas
		@proteinas_
	end

	def get_sal
		@sal_
	end
		
end

