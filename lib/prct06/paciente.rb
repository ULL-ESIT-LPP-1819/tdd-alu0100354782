require 'Persona'

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
    
end
