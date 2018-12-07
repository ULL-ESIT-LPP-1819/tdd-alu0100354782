Node = Struct.new(:value, :next, :prev)

#
# Representa listas doblemente enlazadas
#
class List

	include Enumerable

	attr_accessor :head, :tail

	def initialize(head, tail)
		@head = head
		@tail = tail
	end

	def empty?
		@head.nil?
	end

	def insert(value)
		node = Node.new(value, nil, @tail)
		@head = node if @head.nil?
		@tail.next = node unless @tail.nil?
		@tail = node
	end

	def extract
		return nil if self.empty?
		aux = @head
		@head = @head.next
		@head.prev = nil unless @head.nil?
		@tail = nil if @head.nil?
		aux.next = nil
		aux
	end

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

	def each
		node = Node.new(nil,nil,nil)
		node = @head

		while !(node.nil?)
			yield node.value.enumerar
		  node = node.next
		end

	end

end
