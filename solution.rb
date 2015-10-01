#Lista ligada sencilla en Ruby
class Node
	def initialize(n)
		set_dato(n)	
		set_sig(nil)
	end
	def get_dato
		return @dato
	end
	def set_dato(n) 
		@dato=n
	end
	def get_sig 
		return @sig
	end
	def set_sig(s)
		@sig=s
	end
end

class LinkedList 

	def initialize() #De manera inicial...
		@head = nil #Como tal aún no se ha creado la lista, ya que apunta a nulo
	end

	def añadir(n) #Método que permite agregar
		miNodo = Node.new(nil)
		miNodo.set_dato(n)
		if @head.nil? #Si mi lista está vacía...
			@head=miNodo #Ahora ya no lo está 
		else
			tem=@head #Inicia el recorrido desde la cabeza de mi lista
			while (tem.get_sig!=nil)
				tem=tem.get_sig #Recorro hasta que mi lista apunte a nulo	
			end
			tem.set_sig(miNodo) #Ya está el elemento agregado
		end
	end

	def eliminar(n)
		temp=@head
		if(temp.get_dato == n)
			@head=@head.get_sig
		else
			while(temp!=nil && temp.get_sig!=nil && (temp.get_sig).get_dato!=n)
				temp=temp.get_sig
			end
			if(temp!=nil && temp.get_sig!=nil)
				temp.set_sig((temp.get_sig).get_sig)
			end
		end
	end

	def mostrarLista
		temp=Node.new(nil)
		temp=@head #Inicio desde el principio de mi lista
		cadena = "" #Donde voy a colocar mi lista
		while(not temp.nil?)
			if(temp.get_sig!=nil)
				cadena=cadena+temp.get_dato.to_s+","
			else
				cadena=cadena+temp.get_dato.to_s
			end
			temp=temp.get_sig
		end
		return cadena
	end

	def contarNum
		numeros = 0
		temp=@head
		while(not temp.nil?)
			numeros=numeros+1
			temp=temp.get_sig
		end
		return numeros #Elementos totales de mi lista
	end
end 

miLista=LinkedList.new()
num=gets.chomp()

if (not num == -1.to_s)
	miLista.añadir(num)
end

while (not num == -1.to_s)
	num= gets.chomp()
	if ((not num == -1.to_s) && (not num == ""))
		miLista.añadir(num)	
	end
end

if(miLista.contarNum > 0) #No tiene sentido imprimir una lista vacía
	puts (miLista.mostrarLista)
 end
#for i in (0..5)
#	miLista.eliminar(gets.chomp())
#	puts (miLista.mostrarLista)
#end 
