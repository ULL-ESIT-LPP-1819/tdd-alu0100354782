


class InfoNutricional

	attr_reader :nombre_, :grasas_, :grasas_saturadas_, :hidratos_, :azucares_, :proteinas_, :sal_

	def initialize(nombre, grasas, grasas_saturadas, hidratos, azucares, proteinas, sal)
		@nombre_ = nombre
		@grasas_ = grasas
		@grasas_saturadas_ = grasas_saturadas
		@hidratos_ = hidratos
		@azucares_ = azucares
		@proteinas_ = proteinas
		@sal_ = sal
	end
end

