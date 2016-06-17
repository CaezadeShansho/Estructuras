
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
