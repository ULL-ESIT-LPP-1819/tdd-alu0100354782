#
# Representa etiquetas de alimentos con datos nutricionales
# @author Sergio Reyes de León
#
class InfoNutricional

	include Comparable

	attr_reader :nombre_, :grasas_, :grasas_saturadas_, :hidratos_, :azucares_, :proteinas_, :sal_, :grasas_m_, :grasas_p_, :polialcoholes_, :almidon_, :fibra_, :vitaminas_, :minerales_

	#
	# Constructor
	#
	# @param [<Type>] nombre <description>
	# @param [<Type>] grasas <description>
	# @param [<Type>] grasas_saturadas <description>
	# @param [<Type>] hidratos <description>
	# @param [<Type>] azucares <description>
	# @param [<Type>] proteinas <description>
	# @param [<Type>] sal <description>
	# @param [<Type>] grasas_m <description>
	# @param [<Type>] grasas_p <description>
	# @param [<Type>] polialcoholes <description>
	# @param [<Type>] almidon <description>
	# @param [<Type>] fibra <description>
	# @param [<Type>] vitaminas <description>
	# @param [<Type>] minerales <description>
	#
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

	#
	# Getter de nombre
	#
	# @return [String] <description>
	#
	def get_nombre
		@nombre_
	end	

	#
	# Getter de val_energetico_kj
	#
	# @return [float] valor energético en kj
	#
	def get_val_energetico_kj
		@grasas_*37 + @grasas_m_*37 + @grasas_p_*37 + @hidratos_*17 + @polialcoholes_*10 + @almidon_*17 + @fibra_*8 + @proteinas_*17 + @sal_*25
	end

	#
	# Getter de val_energetico_kcal
	#
	# @return [float] valor energético en kcal
	#
	def get_val_energetico_kcal
		@grasas_*9 + @grasas_m_*9 + @grasas_p_*9 + @hidratos_*4 + @polialcoholes_*2.4 + @almidon_*4 + @fibra_*2 + @proteinas_*4 + @sal_*6
	end

	#
	# Getter de grasas
	#
	# @return [float] cantidad de grasas
	#
	def get_grasas
		@grasas_
	end

	#
	# Getter de grasas saturadas
	#
	# @return [float] cantidad de grasas saturadas
	#
	def get_grasas_saturadas
		@grasas_saturadas_
	end

	#
	# Getter de hidratos
	#
	# @return [float] cantidad de hidratos de carbono
	#
	def get_hidratos
		@hidratos_
	end

	#
	# Getter de azúcares
	#
	# @return [float] cantidad de azúcares
	#
	def get_azucares
		@azucares_
	end

	#
	# Getter de proteinas
	#
	# @return [float] cantidad de grasas
	#
	def get_proteinas
		@proteinas_
	end

	#
	# Getter de sal
	#
	# @return [float] cantidad de sal
	#
	def get_sal
		@sal_
	end

	#
	# Calcular ingesta de referencia sobre la base de 100g o 100ml
	#
	# @param [float] x cantidad en gramos
	#
	# @return [float] Ingesta de referencia
	#
	def ingesta_referencia(x)
		suma = @grasas_ + @grasas_saturadas_ + @hidratos_ + 
				@azucares_ + @proteinas_ + @sal_ + 
				@grasas_m_ + @grasas_p_ + @polialcoholes_ + 
				@almidon_ + @fibra_ + @vitaminas_ + @minerales_
		(x*100)/suma
	end

	#
	# Sobrecarga del método to_s
	#
	# @return [String] información nutricional
	#
	def to_s
		s =  " \t\t\tPorcion \t IR \n"
		s +=  " Valor energético\t #{self.get_val_energetico_kj} kJ\t 8.400kJ\n"
		s +=  "     kJ / kcal \t\t #{self.get_val_energetico_kcal} kcal\t 2000kcal\n"
		s +=  " Grasas\t\t\t #{@grasas_} g.\t\t #{self.ingesta_referencia(@grasas_)}%\n"
		s +=  " Grasas saturadas\t #{@grasas_saturadas_} g.\t\t #{self.ingesta_referencia(@grasas_saturadas_)}%\n"
		s +=  " Hidratos de carbono\t #{@hidratos_} g.\t\t #{self.ingesta_referencia(@hidratos_)}%\n"
		s +=  " Azúcares\t\t #{@azucares_} g.\t\t #{self.ingesta_referencia(@azucares_)}%\n"
		s +=  " Proteínas\t\t #{@proteinas_} g.\t\t #{self.ingesta_referencia(@proteinas_)}%\n"
		s +=  " Sal\t\t\t #{@sal_} g.\t\t #{self.ingesta_referencia(@sal_)}%\n"

		if @grasas_m_
			s +=  " Grasas monoinsaturadas\t #{@grasas_m_} g.\t\t #{self.ingesta_referencia(@grasas_m_)}%\n"
        end

        if @grasas_p_
			s +=  " Grasas polinsaturadas\t #{@grasas_p_} g.\t\t #{self.ingesta_referencia(@grasas_p_)}%\n"
        end

        if @polialcoholes_
        	s +=  " Polialcoholes\t\t #{@polialcoholes_} g.\t\t #{self.ingesta_referencia(@polialcoholes_)}%\n"
        end

        if @almidon_
        	s +=  " Almidon\t\t #{@almidon_} g.\t\t #{self.ingesta_referencia(@almidon_)}%\n"
        end

        if @fibra_
        	s +=  " Fibra alimentaria\t #{@fibra_} g.\t\t #{self.ingesta_referencia(@fibra_)}%\n"
        end

        if @vitaminas_
        	s +=  " Vitaminas\t\t #{@vitaminas_} g.\t\t #{self.ingesta_referencia(@vitaminas_)}%\n"
        end

        if @minerales_
        	s +=  " Minerales\t\t #{@minerales_} g.\t\t #{self.ingesta_referencia(@minerales_)}%\n"
        end	
	end	
	
	#
	# Sobrecarga de los operadores < = >
	#
	# @param [InfoNutricional] etiqueta objeto con el que se compara
	#
	# @return [int] -1 para self < paciente, 0 para self = paciente, 1 para self > paciente
	#
	def <=> (etiqueta)
		get_val_energetico_kcal <=> etiqueta.get_val_energetico_kcal		
	end

	def enumerar
		get_val_energetico_kcal
	end
end

