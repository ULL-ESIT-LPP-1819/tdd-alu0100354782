


class InfoNutricional

	attr_reader :nombre_, :grasas_, :grasas_saturadas_, :hidratos_

	def initialize(nombre, grasas, grasas_saturadas, hidratos)
		@nombre_ = nombre
		@grasas_ = grasas
		@grasas_saturadas_ = grasas_saturadas
		@hidratos_ = hidratos
	end
end

