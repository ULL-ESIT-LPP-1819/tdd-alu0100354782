


class InfoNutricional

	attr_reader :nombre_, :grasas_, :grasas_saturadas_, :hidratos_, :azucares_, :proteinas_, :sal_, :val_energetico_

	def initialize(nombre, grasas, grasas_saturadas, hidratos, azucares, proteinas, sal, val_energetico)
		@nombre_ = nombre
		@grasas_ = grasas
		@grasas_saturadas_ = grasas_saturadas
		@hidratos_ = hidratos
		@azucares_ = azucares
		@proteinas_ = proteinas
		@sal_ = sal
		@val_energetico_ = val_energetico
	end

	def get_nombre
		@nombre_
	end	

	def get_val_energetico
		@val_energetico_
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
		
end

