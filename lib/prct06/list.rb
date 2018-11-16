Node = Struct.new(:value, :next, :prev)

class List
	attr_accessor :head, :tail

	def initialize
		@head = nil
		@tail = nil
	end
end
