Node = Struct.new(:value, :next, :prev)

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
		if @head  == nil
			@head = Node.new(value,nil,nil)
			@tail = @head
		else
			node = Node.new(value,nil,@tail)
			@tail.next = node
			@tail = node
		end
	end

	def extract
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
