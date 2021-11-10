class Movimiento(object):



    #este objeto movimiento recibe en el parametro la linea que se esta iterando en el cursor y asigna cada campo a un atributo del propio objeto
	def __init__(self,lista):

		self.operator_name = lista[0]
		print(self.operator_name,"Tipo De Dato ",type(self.operator_name))
		if isinstance(self.operator_name, bytearray):
			self.operator_name = lista[0].decode()
			print("entro en el byteaaray ahora es: ", type(self.operator_name),"\n")
		else:
			print("\n")

		self.tipodeproducto = lista[1]
		print(self.tipodeproducto,"Tipo De Dato ", type(self.tipodeproducto))
		if isinstance(self.tipodeproducto, bytearray):
			self.tipodeproducto = lista[1].decode()
			print("entro en el byteaaray ahora es: ",type(self.tipodeproducto),"\n")
		else:
			print("\n")



		self.idmoviired = lista[2]
		print(self.idmoviired,"Tipo De Dato ", type(self.idmoviired))
		if isinstance(self.idmoviired, bytearray):
			self.idmoviired = lista[2].decode()
			print("entro en el byteaaray ahora es: ", type(self.idmoviired),"\n")
		else:
			print("\n")

		self.descripcion = lista[3]
		print(self.descripcion,"Tipo De Dato ", type(self.descripcion))
		if isinstance(self.descripcion, bytearray):
			self.descripcion = lista[3].decode()
			print("entro en el byteaaray ahora es: ", type(self.descripcion),"\n")
		else:
			print("\n")

		self.valor = lista[4]
		print(self.valor,"Tipo De Dato ", type(self.valor))
		if isinstance(self.valor, bytearray):
			self.valor = lista[4].decode()
			print("entro en el byteaaray ahora es: ", type(self.valor),"\n")
		else:
			print("\n")

		self.ean = lista[5]
		print(self.ean,"Tipo De Dato ", type(self.ean))
		if isinstance(self.ean, bytearray):
			self.ean = lista[5].decode()
			print("entro en el byteaaray ahora es: ", type(self.ean),"\n")
		else:
			print("\n")

		self.idoperador = lista[6]
		print(self.ean,"Tipo De Dato ", type(self.idoperador))
		if isinstance(self.idoperador, bytearray):
			self.idoperador = lista[6].decode()
			print("entro en el byteaaray ahora es: ",type(self.idoperador) , "\n")
		else:
			print("\n")





    #esta linea imprime cada atributo del objeto movimiento, es decir todos lso campos de la linea del cursor que se esta iterando
	def listar(self):

		print ("METODO LISTAR""; ",self.operator_name,self.tipodeproducto,self.idmoviired,self.descripcion,self.valor,self.ean,self.idoperador,"\n\n\n\n")