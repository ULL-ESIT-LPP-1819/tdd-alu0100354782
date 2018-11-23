class Persona
    attr_reader :nombre, :apellido

    def initialize(nombre, apellido)
        @nombre, @apellido = nombre, apellido
    end

    def to_s
        str = "Nombre: #{@nombre}\n"
		str += "Apellido: #{@apellido}\n"
    end
end
