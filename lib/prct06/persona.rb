#
# Representa individuos, 
# contiene nombre y apellido del individuo
# @author Sergio Reyes de León
#
class Persona

    include Comparable

    attr_reader :nombre, :apellido

    #
    # Constructor
    #
    # @param [String] nombre nombre del individuo
    # @param [String] apellido apellido del individuo
    #
    def initialize(nombre, apellido)
        @nombre, @apellido = nombre, apellido
    end

    #
    # Método to_s para mostrar personas
    #
    # @return [String] Salida formateada de Persona
    #
    def to_s
        str = "Nombre: #{@nombre}\n"
		str += "Apellido: #{@apellido}\n"
    end
end
