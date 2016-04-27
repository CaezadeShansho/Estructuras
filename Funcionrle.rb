class Node
	attr_accessor :next_node, :value
	def initialize(value, next_node)
		@value = value
		@next_node = next_node
	end
end
class NodeRLE
	attr_accessor :next_node, :value, :counter
	def initialize(value, counter, next_node)
		@value = value
		@next_node = next_node
		@counter = counter
	end
end
def rlepush(head,val, cont)	
	aux=NodeRLE.new(val, cont, head)
	head=aux
end	
def rle(node)
	aux=node
	val=node.value
	cont=0
	while val==node.value
		cont+=1
		aux=aux.next_node	
		val=aux.value
	end		
	head=NodeRLE.new(val, cont, nil)	
	while node.next_node!=nil
		aux2=aux
		cont=0
		val2=val
		while val2==aux.value
			cont+=1
			aux2=aux2.next_node
			val2=aux2.value
		end	
		rlepush(head, val2, cont)
	end	
	return head
end	

a=Node.new(1,nil)
b=Node.new(1,a)
c=Node.new(3,b)
d=Node.new(4,c)
e=Node.new(1,d)

puts rle(e).value
puts rle(e).counter
puts rle(e).next_node
