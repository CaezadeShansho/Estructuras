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
def rle(node)
	aux=node
	cont=0
	while aux.value==node.value
		cont+=1
		aux=aux.next_node	
		val=aux.value
	end
	head=NodeRLE.new(aux.value, cont, nil)	
	while aux!=nil
		aux2=aux
		cont=0
		while aux2.value==aux.value			
			cont+=1
			if aux2.next_node==nil
				break
			else
				aux2=aux2.next_node		
			end	
		end	
		auxrle=	NodeRLE.new(aux2.value, cont, head)
		head=auxrle
		aux=aux.next_node
	end	
	return head
end	
a=Node.new(1,nil)
b=Node.new(1,a)
c=Node.new(3,b)
d=Node.new(4,c)
e=Node.new(1,d)
er=rle(e)
puts er.value
puts er.counter
puts er.next_node
