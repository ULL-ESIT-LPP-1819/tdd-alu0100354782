Node = Struct.new(:value, :next, :prev)

class List
	attr_accessor :head, :tail

	def initialize(head, tail)
		@head = head
		@tail = tail
	end

	def empty
		@head.nil?
	end

	def insert(value)
		node = Node.new(value, nil, @tail)
		@head = node if @head.nil?
		@tail.next = node unless @tail.nil?
		@tail = node
	end
end
