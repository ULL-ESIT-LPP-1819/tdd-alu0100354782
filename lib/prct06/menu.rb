#
# Representa menús, 
# @author Sergio Reyes de León
#
class Menu
    
    include Comparable
    
    attr_accessor :dia, :titulo, :ingesta, :desayuno, :almuerzo, :cena, :cantidad
    
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
    
    def titulo(t)
		@titulo = t
    end
    
    def ingesta(i, options = {})
		@ingesta = i
		@ingesta << "(#{options[:min]})" if options[:min]
		@ingesta << "(#{options[:max]})" if options[:max]

    end
    
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
    
    def kcal
        x = @desayuno.collect{|a| a.get_val_energetico_kcal}
        total = x.inject(0, :+)
        
        x = @almuerzo.collect{|a| a.get_val_energetico_kcal}
        total += x.inject(0, :+)
        
        x = @cena.collect{|a| a.get_val_energetico_kcal}
        total += x.inject(0, :+)
        
        total
    end
    
    
    
    
end
