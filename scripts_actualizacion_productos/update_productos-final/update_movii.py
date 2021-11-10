import mysql.connector
import gspread
import os

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
    db='movii_nuevos_convenios_movii',
    charset='utf8'
)



#borrar archivo si existe

'''if os.path.exists("Update_paquetes.txt"):
   os.remove("Update_paquetes.txt")
else:
   print("El archivo no existe")'''


#remove("Update_paquetes.txt")


#abrir archivo
f = open ('Update_paquetes.txt','a')
f.write('-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx MOVII xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx \n \n')

contador=0



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






#valida si un paquete no tiene ninguna opcion valida
for i in range(len(list_of_lists)):
    if i == 0:
       continue
    activar = list_of_lists[i][9].lower()
    #print(activar, "\n")
    if (str(activar) != "activar" and str(activar) != "eliminar" and str(activar) != "crear" and str(activar) != "cambiar"):
       print("No existe una accion valida  para algunos paquetea, por favor valide en la columna (J) del archivo ")
       exit()








for i in range(len(list_of_lists)):
    print("\n")
    if i == 0:
       continue

    contador = contador + 1
    print(contador)
    #recupera 3 primeras columnas de la fila
    operadorc=list_of_lists[i][0]
    product_codec=list_of_lists[i][1]
    eancodec=list_of_lists[i][2]

    ###
    # recupera del excel el campo par insertar
    activar = list_of_lists[i][9].lower()
    # validar si la varible activar contiene la palabra insertar par aindicarle que al programa que debe crear un ´paquete
    if (str(activar) == "crear"):
        print("Este paquete es nuevo [" + str(contador) + "]" + "\n \n")
        f.write("-- Este paquete es nuevo [" + str(contador) + "]" + "\n \n")
        continue
    ###




    #impime ne pantalla para verifica la info recuperada
    print(operadorc,"-",product_codec,"-",eancodec)
    
    #cursor gurada conexion con bd
    cursor=con.cursor()
    #se ejecuta consulta
    cursor.execute("SELECT id FROM  movii_nuevos_convenios_movii.ws_operator where operator_name= (%s) and product_code= (%s) and ean_code= (%s);", (operadorc,product_codec,eancodec))
    #se recorre todos los registros que devuelve la consulta
    r=cursor.fetchall()
    # se imprime la variable que guarda los registros que devolvio la consulta
    print(r)

    if (len(str(r)) < 3):
        print("paquete no existe")
        f.write("-- paquete no existe [" + str(contador) + "]" + "\n \n")
        continue


# hasta aqui funciona bn

    #recupera 3 primeras columnas de la fila
    operadorc=list_of_lists[i][0]
    product_codec=list_of_lists[i][1]
    eancodec=list_of_lists[i][2]
    valor=list_of_lists[i][3]
    vigencia=list_of_lists[i][4]
    subtype=list_of_lists[i][5]
    descripcion=list_of_lists[i][6]
    eancode=list_of_lists[i][7]
    product_code = list_of_lists[i][8]
    activar= list_of_lists[i][9].lower()




    conupdate="update movii_nuevos_convenios_movii.ws_operator set "
    print(conupdate)
    print("tamaño conupdate", len(conupdate))
    if (len(str(valor)) > 0):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate=conupdate+" max_value= '" + valor + "',"
        conupdate = conupdate + " min_value= '" + valor + "',"
        conupdate = conupdate + " multiple= '" + valor + "',"
        print("funciono:", conupdate)
    if (len(str(vigencia)) > 0):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate=conupdate+" details_expiration = '" + vigencia + " Dias',"
        print("funciono:", conupdate)
    if (len(str(subtype)) > 0):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate=conupdate+" sub_type = '" + subtype + "',"
        print("funciono:", conupdate)
    if (len(str(descripcion)) > 0):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate=conupdate+" name = '" + descripcion + " ',"
        print("funciono:", conupdate)
    if(len(str(eancode))>0):
        #conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate=conupdate+" eancode = '"+eancode+"',"
        print("funciono:",conupdate)
    if (len(str(product_code)) > 0):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate = conupdate + " product code = '" + product_code + "',"
        print("funciono:", conupdate)
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
    if (len(str(conupdate)) < 53):
        # if (len(str(activar)) < 3):
        print("-- Los campos a modificar estan vacios  [" + str(contador) + "]" + "\n \n")
        f.write("-- Los campos a modificar estan vacios  [" + str(contador) + "]" + "\n \n")
        continue

    conupdate=conupdate+" where id ="+str(r[0][0])+"; -- ["+str(contador)+"]"
    #print("final:", conupdate)
    conupdate = conupdate.replace(', where', ' where')
    print("final:", conupdate)


 # escribir linea update en archivo
    f.write(conupdate + '\n \n')

# hasta aqui funciona bn








#cerrar archivo
f.close()
      














   
    

















