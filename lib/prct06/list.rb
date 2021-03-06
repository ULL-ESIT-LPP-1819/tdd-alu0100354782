#
# Nodo para la lista doblemente enlazada
#
Node = Struct.new(:value, :next, :prev)

#
# Representa listas doblemente enlazadas
# @author Sergio Reyes de León
#
class List

	include Enumerable

	attr_accessor :head, :tail, :size

	#
	# Constructor
	#
	# @param [<Type>] head cabeza de la lista
	# @param [<Type>] tail cola de la lista
	#
	def initialize(head, tail)
		@head = head
		@tail = tail
		@size = 0
	end

	#
	# Comprobar si la lista está vacía
	#
	# @return [boolean] true está vacía, false no está vacía
	#
	def empty?
		@head.nil?
	end

	#
	# Insertar elemento en la lista
	#
	# @param [<Type>] value elemento a insertar
	#
	# @return [<Type>] elemento insertado
	#
	def insert(value)
		@size += 1

		if @head  == nil
			@head = Node.new(value,nil,nil)
			@tail = @head
		else
			node = Node.new(value,nil,@tail)
			@tail.next = node
			@tail = node
		end		
	end

	#
	# Extraer último elemento insertado
	#
	# @return [<Type>] elemento extraído
	#
	def extract
		@size -= 1

		if @head == nil
			@head = nil
			@tail = nil
			return nil
		else
			pop = @head
			@head = @head.next
			return pop.value
		end
	end		

	#
	# Sobrecarga del método to_s 
	#
	# @return [String] Lista
	#
	def to_s
		s = ""		
		node = @head
		loop do			
			s += "#{node.value.to_s} \n\n"
			node = node.next
			break if node.nil?
		end
		s
	end

	#
	# Sobrecarga del método each
	#
	# @return [<Type>] <description>
	#
	def each
		node = Node.new(nil,nil,nil)
		node = @head

		while !(node.nil?)
			yield node.value
			node = node.next
		end

	end

	#
	# Sobrecarga del operador []
	#
	# @param [<Type>] index <description>
	#
	# @return [<Type>] <description>
	#
	def [](index)
		if (index == 0)
			return head.value
		elsif index == size
			return tail.value
		end
	
		aux = @head	
		for i in 0..index-1
			aux = aux.next		
		end
	
		aux.value		
	end

	def []=(index,val)

		if (index == 0)
			head.value = val
		elsif index == size
			tail.value = val
		end
	
		aux = @head	
		for i in 0..index-1
			aux = aux.next		
		end
	
		aux.value = val
	
	end

end
