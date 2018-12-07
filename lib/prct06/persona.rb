#
# Representa individuos, 
# contiene nombre y apellido del individuo
#
class Persona

    include Comparable

    attr_reader :nombre, :apellido

    def initialize(nombre, apellido)
        @nombre, @apellido = nombre, apellido
    end

    def to_s
        str = "Nombre: #{@nombre}\n"
		str += "Apellido: #{@apellido}\n"
    end
end
