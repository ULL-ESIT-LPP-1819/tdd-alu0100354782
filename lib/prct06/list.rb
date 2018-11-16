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
end
