import mysql.connector
import gspread
from os import remove
import os
import shutil

gc = gspread.service_account(filename='update-paquetes-95b36abf551d.json')

# Abrir por titulo
sh = gc.open("prueba paquetes")

# Seleccionar primera hoja
worksheet = sh.get_worksheet(0)
list_of_lists = worksheet.get_all_values()



# Conectarse a la base de datos
con = mysql.connector.Connect(
    host='192.168.31.18',
    port=3306,
    user='U1014224787',
    passwd='kGCR2Sp-J9u*5w',
    db='movii_nuevos_convenios',
    charset='utf8'
)




#borrar archivo si existe

if os.path.exists("Update_paquetes.txt"):
   os.remove("Update_paquetes.txt")
else:
    pass
   #print("El archivo no existe")

#abrir archivo
f = open ('Update_paquetes.txt','a')
f.write('-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx MOVIIRED xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx \n \n')
contador=0

###
cedula=0
valor=0
paquete_activo=0


txl="tx.list"
if os.path.exists(txl):
    print("si existe")
    os.remove(txl)

else:
    pass


#si tx.list existe en al ruta borrelo
ruta_activo="scripts_actualizacion_productos\\paquetes_bash\\paquetes_activos\\tx.list"
if os.path.exists(ruta_activo):
    print("existe")
    os.remove(ruta_activo)
else:
    pass
#si tx.list existe en al ruta borrelo
ruta_inactivo = "scripts_actualizacion_productos\\paquetes_bash\\paquetes_inactivos_bd\\tx.list"
if os.path.exists(ruta_inactivo):
    print("existe")
    os.remove(ruta_inactivo)
else:
    pass

#si activo_inactivo.txt existe en al ruta borrelo
activo_inactivo= "activo_inactivo.txt"
if os.path.exists(activo_inactivo):
    print("existe")
    os.remove(activo_inactivo)
else:
    pass




#valida si un paquete a cear tienen algun campo vacio

for i in range(len(list_of_lists)):

    activar = list_of_lists[i][9].lower()

    if (str(activar) == "crear"):
        print(" \nentramos",i)
        if i==0:
            i=i+1
        print("FILA")
        for j in range(len(list_of_lists)):
            j=j+3
            if j==9:
               break
            celda = list_of_lists[i][j].lower()
            tamano=len(str(celda))
            print(celda,"celda:",i,j,"    tamaño",tamano)



            if (len(str(celda)) < 1):
               print("NO SE LLENARON TODOs LOS CAMPOS REQUERIDOS PARA LA COFIGURACION DE UN PAQUETE A CREAR; RECUERDE QUE QUE PARA CREA UN PAQUETE SE DEBE LLENAR TODO LOS CAMPOS DE ÑA COLUMNA (D) A LA (J)")
               exit()



# verifica si hay un paquete para crear y si lo quiere crear activo o inactivo
for i in range(len(list_of_lists)):
    activar = list_of_lists[i][9].lower()
    if (str(activar) == "crear"):

       #print(type(valor))
       #valida si la opcion es agregar paquete para que el usuario agregue la cedula e indique si desea que el paquete se crea activo o inactivo
       cedula=int(input("\n \n \n Hola, tienes algunos paquetes para crear, antes de empezar digita los siguientes datos \n Digita tu Cedula: "))
       paquete_activo=int(input("Digite alguna  de las siguientes opciones: \n 1. paquetes activos \n 2. paquetes inactivos \n\n Elegiste la opcion: "))
       print("\nExelente!! ya esta todo listo para comenzar . \n\n")
       break









#C:\Users\cristian.gualtero\Downloads\Actualizacion productos\scripts_actualizacion_productos\paquetes_bash\paquetes_inactivos_bd

# for principal

for i in range(len(list_of_lists)):
  
    print("\n")
    
    if i == 0:
       continue
    contador=contador+1

    #recupera 3 primeras columnas de la fila
    operadorc=list_of_lists[i][0]
    product_codec=list_of_lists[i][1]
    eancodec=list_of_lists[i][2]


    #recupera del excel el campo para insertar
    activar = list_of_lists[i][9].lower()






    #validar si la varible activar contiene la palabra crear para indicarle al programa que debe crear un ´paquete
    if (str(activar) == "crear"):

       operadorc = list_of_lists[i][0]
       product_codec = list_of_lists[i][1]
       eancodec = list_of_lists[i][2]
       valor = list_of_lists[i][3]
       vigencia = list_of_lists[i][4]
       subtype = list_of_lists[i][5]
       descripcion = list_of_lists[i][6]
       eancode = list_of_lists[i][7]
       product_code= list_of_lists[i][8]
       activar = list_of_lists[i][9].lower()
       conupdate = str(operadorc)+ "#" + str(product_code)  + "#" + str(eancode) + "#" +str(valor)+ "#" +str(vigencia)+ "#" +str(subtype)+ "#" + str(cedula)+ "#" +str(descripcion)+ "#"
       #print("funciono: este paquete se agrego", conupdate)


       # VALIDAIA SI LOS CAMPOS A MODIFICAR  ESTAN VACIOS
       print("tamaño conupdate final: ", len(conupdate))

       #validar la opcion que brindo el USUuario sobre activar o inactivar paquete, de acuerdo a esto ubica el tx list donde este el script correspondioente
       if paquete_activo == 1:
           #archivo que va guardar si hay apquetes activos
          ff3 = open(activo_inactivo, 'a')
          ff3.write('activo\n')
          #rellena el tx.list 
          ff1 = open(txl, 'a')
          ff1.write(conupdate + '\n')
          #llene el tx.list en la ruta del script activo
          ff = open(ruta_activo, 'a')
          ff.write(conupdate + '\n')
          #shutil.copy("tx.list", "C:\\Users\\cristian.gualtero\\Downloads\\Actualizacion productos\\scripts_actualizacion_productos\\paquetes_bash\\paquetes_activos\\tx.list")
          print("el tx.list se va dejar en la carpeta  paquetes activos")

       elif paquete_activo == 2:
           #archivo que va guardar si hay apquetes inactivos
          ff3 = open(activo_inactivo, 'a')
          ff3.write('inactivo\n')
          #rellena el tx.list 
          ff1 = open(txl, 'a')
          ff1.write(conupdate + '\n')
        #llene el tx.list en la ruta del script inactivo
          ff = open(ruta_inactivo, 'a')
          ff.write(conupdate + '\n')
          #shutil.copy("tx.list", "C:\\Users\\cristian.gualtero\\Downloads\\Actualizacion productos\\scripts_actualizacion_productos\\paquetes_bash\\paquetes_inactivos_bd\\tx.list")
          print("el tx.list se va dejar en la carpeta  paquetes inactivos")

       #se colacola en el archivo updates.txt que el paquete es enuevo
       print("Este paquete es nuevo [" + str(contador) + "]" + "\n \n")
       f.write("-- Este paquete es nuevo [" + str(contador) + "]" + "\n \n")
       continue


    ###






    #impime ne pantalla para verifica la info recuperada
    print(operadorc,"-",product_codec,"-",eancodec)
    
    #cursor guarda conexion con bd
    cursor=con.cursor()
    #se ejecuta consulta
    cursor.execute("SELECT id FROM movii_nuevos_convenios.ws_operator where operator_name= (%s) and product_code= (%s) and ean_code= (%s);", (operadorc,product_codec,eancodec))
    #se recorre todos los registros que devuelve la consulta
    r=cursor.fetchall()
    # se imprime la variable que guarda los registros que devolvio la consulta
    print(r)

    if (len(str(r)) < 3):
        print("paquete no existe")
        f.write("-- paquete no existe [" + str(contador) + "]" + "\n \n")
        continue



    product_codec = list_of_lists[i][1]
    eancodec = list_of_lists[i][2]
    valor = list_of_lists[i][3]
    vigencia = list_of_lists[i][4]
    subtype = list_of_lists[i][5]
    descripcion = list_of_lists[i][6]
    eancode = list_of_lists[i][7]
    product_code = list_of_lists[i][8]
    activar = list_of_lists[i][9].lower()





    conupdate = "update movii_nuevos_convenios.ws_operator set"
    #print(conupdate)


    print("tamaño conupdate",len(conupdate))
    if (len(str(valor)) > 0):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate = conupdate + " max_value= '" + valor + "',"
        conupdate = conupdate + " min_value= '" + valor + "',"
        conupdate = conupdate + " multiple= '" + valor + "',"
        print("funciono:", conupdate)
    if (len(str(vigencia)) > 0):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate = conupdate + " details_expiration = '" + vigencia +"' "
        print("funciono:", conupdate)
    if (len(str(subtype)) > 0):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate = conupdate + " sub_type = '" + subtype + "',"
        print("funciono:", conupdate)
    if (len(str(descripcion)) > 0):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate = conupdate + " name = '" + descripcion + "',"
        print("funciono:", conupdate)
    if (len(str(eancode)) > 0):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate = conupdate + " eancode = '" + eancode + "',"
        print("funciono:", conupdate)
    if (len(str(product_code)) > 0):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate = conupdate + " product code = '" + product_code + "',"
        print("funciono:", conupdate)
    # ELIMINA RPAQUETE
    if (str(activar) == "eliminar"):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate = conupdate + " status=0 , status_view=0"
        print("funciono:", conupdate)
    if (str(activar) == "activar"):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate = conupdate + " status=1 , status_view=1"
        print("funciono:", conupdate)



        # VALIDAIA SI LOS CAMPOS A MODIFICAR  ESTAN VACIOS
    print("tamaño conupdate final: ", len(conupdate))
    if (len(str(conupdate)) < 46):
        # VALIDA QUE EL CAMPO TIPO SENTENCIA ESTE VACIO
        # if (len(str(activar))<3):
        print("-- Los campos a modificar estan vacios  [" + str(contador) + "]" + "\n \n")
        f.write("-- Los campos a modificar estan vacios  [" + str(contador) + "]" + "\n \n")
        continue

    #AGRAGA EL FINAL DEL UPDATE
    conupdate = conupdate + " where id =" + str(r[0][0]) + "; -- ["+str(contador)+"]"
    #print("final:", conupdate)
    conupdate = conupdate.replace(', where', ' where')
    print("final:", conupdate)


    # escribir linea update en archivo
    f.write(conupdate + '\n \n')

# hasta aqui funciona bn








#cerrar archivo
f.close()



      














   
    

















