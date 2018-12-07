require_relative 'persona'
require_relative 'antropometria'

class Paciente < Persona
    
    attr_accessor :consulta, :tratamiento, :antropometria

    def initialize(nombre, apellido)
        super(nombre,apellido)
    end

    def initialize(nombre, apellido, consulta, tratamiento, antropometria)
        super(nombre, apellido)
        @consulta = consulta
        @tratamiento = tratamiento
        @antropometria = antropometria
    end

    def to_s
        str = super.to_s
        str += "Consulta: #{@consulta}\n"
        str += "Tratamiento: #{@tratamiento}\n"
        str += antropometria.to_s
    end

    def <=> (paciente)
		comparacion = self.antropometria.imc <=> paciente.antropometria.imc
		if comparacion == 0
			comparacion self.apellido <=> paciente.apellido
		end	
		comparacion
	end
    
end
