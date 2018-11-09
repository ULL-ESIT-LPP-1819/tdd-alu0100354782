


class InfoNutricional

	attr_reader :nombre_, :grasas_, :grasas_saturadas_, :hidratos_, :azucares_

	def initialize(nombre, grasas, grasas_saturadas, hidratos, azucares)
		@nombre_ = nombre
		@grasas_ = grasas
		@grasas_saturadas_ = grasas_saturadas
		@hidratos_ = hidratos
		@azucares_ = azucares
	end
end

