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

	attr_accessor :head, :tail

	#
	# Constructor
	#
	# @param [<Type>] head cabeza de la lista
	# @param [<Type>] tail cola de la lista
	#
	def initialize(head, tail)
		@head = head
		@tail = tail
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
		node = Node.new(value, nil, @tail)
		@head = node if @head.nil?
		@tail.next = node unless @tail.nil?
		@tail = node
	end

	#
	# Extraer último elemento insertado
	#
	# @return [<Type>] elemento extraído
	#
	def extract
		return nil if self.empty?
		aux = @head
		@head = @head.next
		@head.prev = nil unless @head.nil?
		@tail = nil if @head.nil?
		aux.next = nil
		aux
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

end
