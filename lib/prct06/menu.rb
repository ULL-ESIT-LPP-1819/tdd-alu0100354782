#
# Representa menús, 
# @author Sergio Reyes de León
#
class Menu
    
    include Comparable
    
    attr_accessor :dia, :titulo, :ingesta, :desayuno, :almuerzo, :cena, :cantidad
    
    #
	# Constructor
	#
	# @param [<String>] dia <día de la semana>
	# @param [<Type>] block <bloque DSL>
	#
    def initialize(dia, &block)
        @dia = dia
        @desayuno = []
        @almuerzo = []
        @cena = []
        @cantidad = [   
                        ["1 rodaja", 28],
                        ["1 porcion", 100],
                        ["1 taza", 200],
                        ["1/2 cucharon",20],
                        ["1 pieza", 150],
                        ["1 vaso", 100]
                    ]
        
        if block_given?  
            if block.arity == 1
                yield self
            else
                instance_eval(&block) 
            end
        end
    end
    
    #
	# Definir título del menú
	#
	# @param [<String>] t <título del menú>
	#
    def titulo(t)
		@titulo = t
    end
    
    #
	# Definir ingesta
	#
	# @param [<integer>] options <ingesta máxima y mínima>
	#
    def ingesta(i, options = {})
		@ingesta = i
		@ingesta << "(#{options[:min]})" if options[:min]
		@ingesta << "(#{options[:max]})" if options[:max]

    end
    
    #
	# Definir alimentos del desayuno
	#
	# @param [<Type>] options <propiedades de los alimentos>
	#
    def desayuno(options = {})
        porcion = 0
        @cantidad.each do
            |x|
            porcion = x[1] if x[0] == options[:porcion]
        end
        multiplier = porcion / options[:gramos]
        
        @desayuno.push(InfoNutricional.new(
                        options[:nombre],
                        options[:grasas] * multiplier,
                        0,
                        options[:carbohidratos] * multiplier,
                        0,
                        options[:proteinas] * multiplier,
                        options[:sal] * multiplier,
                        0,
                        0,
                        0,
                        0,
                        options[:fibra] * multiplier,
                        0,
                        0))
    end
    
    #
	# Definir alimentos del almuerzo
	#
	# @param [<Type>] options <propiedades de los alimentos>
	#
    def almuerzo(options = {})
        porcion = 0
        @cantidad.each do
            |x|
            porcion = x[1] if x[0] == options[:porcion]
        end
        multiplier = porcion / options[:gramos]
        
        @almuerzo.push(InfoNutricional.new(
                        options[:nombre],
                        options[:grasas] * multiplier,
                        0,
                        options[:carbohidratos] * multiplier,
                        0,
                        options[:proteinas] * multiplier,
                        options[:sal] * multiplier,
                        0,
                        0,
                        0,
                        0,
                        options[:fibra] * multiplier,
                        0,
                        0))
    end
    
    #
	# Definir alimentos de la cena
	#
	# @param [<Type>] options <propiedades de los alimentos>
	#
    def cena(options = {})
        porcion = 0
        @cantidad.each do
            |x|
            porcion = x[1] if x[0] == options[:porcion]
        end
        multiplier = porcion / options[:gramos]
        
        @cena.push(InfoNutricional.new(
                        options[:nombre],
                        options[:grasas] * multiplier,
                        0,
                        options[:carbohidratos] * multiplier,
                        0,
                        options[:proteinas] * multiplier,
                        options[:sal] * multiplier,
                        0,
                        0,
                        0,
                        0,
                        options[:fibra] * multiplier,
                        0,
                        0))
    end
    
    #
	# Calcular valor energético
	#
	# @return [float] valor energético en kcal
	#
    def kcal
        x = @desayuno.collect{|a| a.get_val_energetico_kcal}
        total = x.inject(0, :+)
        
        x = @almuerzo.collect{|a| a.get_val_energetico_kcal}
        total += x.inject(0, :+)
        
        x = @cena.collect{|a| a.get_val_energetico_kcal}
        total += x.inject(0, :+)
        
        total
    end
    
    #
	# Sobrecarga del método to_s
	#
	# @return [String] Menú de día completo
	#
    def to_s
        s = "Titulo: #{@titulo}\n"
        s << @dia + "\t\t\t\tComposicion nutricional\n"
        s << "=========================================================================================================\n"
        s << "\t\t\t\tgrasas\tcarbohidratos\tproteinas\tfibra\tsal\tvalor energetico\n"
        s << "Desayuno\n"
        
        @desayuno.each do |d|
            s << "\"#{d.nombre_}\"".ljust(32)
            s << "#{d.grasas_}\t#{d.hidratos_}\t\t#{d.proteinas_}\t\t#{d.fibra_}\t#{d.sal_}\t#{d.get_val_energetico_kcal}\n"
        end
        
        s << "Almuerzo\n"
        
        @almuerzo.each do |a|
            s << "\"#{a.nombre_}\"".ljust(32)
            s << "#{a.grasas_}\t#{a.hidratos_}\t\t#{a.proteinas_}\t\t#{a.fibra_}\t#{a.sal_}\t#{a.get_val_energetico_kcal}\n"
        end
        
        s << "Cena\n"
        
        @cena.each do |c|
            s << "\"#{c.nombre_}\"".ljust(32)
            s << "#{c.grasas_}\t#{c.hidratos_}\t\t#{c.proteinas_}\t\t#{c.fibra_}\t#{c.sal_}\t#{c.get_val_energetico_kcal}\n"
        end
        
        s << "\nValor energetico total".ljust(33) << "#{self.kcal}"
        
        s
    end
    
    
end
