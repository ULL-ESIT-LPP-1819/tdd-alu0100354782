require_relative 'persona'
require_relative 'antropometria'

#
# Representa individuos de tipo Persona que además
# tienen datos como si pertenece a una consulta, 
# si está en tratamiento y su atropometría
# @author Sergio Reyes de León
#
class Paciente < Persona
    
    attr_accessor :consulta, :tratamiento, :antropometria, :actividad_fisica
    
    #
    # Constructor
    #
    # @param [String] nombre nombre paciente
    # @param [String] apellido apellido paciente
    # @param [boolean] consulta si tiene consulta o no
    # @param [boolean] tratamiento si está en tratamiento o no
    # @param [Antropometria] antropometria datos antropométricos
    #
    def initialize(nombre, apellido, consulta, tratamiento, antropometria)
        super(nombre, apellido)
        @consulta = consulta
        @tratamiento = tratamiento
        @antropometria = antropometria
    end

    #
    # Método to_s para mostrar pacientes
    #
    # @return [String] Salida formateada de Paciente
    #
    def to_s
        str = super.to_s
        str += "Consulta: #{@consulta}\n"
        str += "Tratamiento: #{@tratamiento}\n"
        str += antropometria.to_s
    end

    #
    # Sobrecarga de operadores de comparación
    #
    # @param [Paciente] paciente objeto Paciente a comparar
    #
    # @return [int] -1 para self < paciente, 0 para self = paciente, 1 para self > paciente
    #
    def <=> (paciente)
		antropometria.imc <=> paciente.antropometria.imc
	end
    
    def enumerar
        antropometria.imc
    end

    def gasto_energetico_basal
        if(antropometria.sexo == 0)
            return (10 * antropometria.peso) + (6.25 * antropometria.talla) - (5* antropometria.edad) - 161
        else 
            return (10 * antropometria.peso) + (6.25 * antropometria.talla) - (5* antropometria.edad) + 5
        end
    end

end
