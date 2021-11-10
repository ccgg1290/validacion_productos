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
    host='192.168.29.166',
    port=3305,
    user='U1014224787',
    passwd='kGCR2Sp-J9u*5w',
    db='ZEUS',
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
f.write('-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ZEUS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx \n \n')


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
       print("No existe una accion valida para algunos paquetea , por favor valide en la columna (J) del archivo ")
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
        f.write("Este paquete es nuevo [" + str(contador) + "]" + "\n \n")
        continue
    ###


    #impime ne pantalla para verifica la info recuperada
    print(operadorc,"-",product_codec,"-",eancodec)
    
    #cursor gurada conexion con bd
    cursor=con.cursor()

    # se ejecuta consulta
    sql = "SELECT PROD_ID FROM ZEUS.PRODUCTO where SUBPRODUCTO= \'" + product_codec + "\' and EANCODE = \'" + eancodec + "\';"
    #sql = "SELECT PROD_ID FROM ZEUS.PRODUCTO where SUBPRODUCTO= \'" + product_codec + "\' and EANCODE like \'" + eancodec + "%\';"
    print(sql)
    cursor.execute(sql)

    #se ejecuta consulta
    #cursor.execute("SELECT PROD_ID FROM ZEUS.PRODUCTO where SUBPRODUCTO= (%s) and EANCODE= (%s);", (product_codec,eancodec))
    #cursor.execute(sql)
    #se recorre todos los registros que devuelve la consulta
    r=cursor.fetchall()
    # se imprime la variable que guarda los registros que devolvio la consulta
    print(r)
        



# hasta aqui funciona bn


    #recupera 3 primeras columnas de la fila
    operadorc=list_of_lists[i][0]
    if  operadorc != "CLARO" and operadorc != "TIGO" :
       print("\npaquete ",operadorc,"solo tranza por mahindra")
       f.write("-- paquete " + operadorc + " solo tranza por mahindra" + "; -- [" + str(contador) + "]\n\n")
       continue

    if (len(str(r)) < 3):
        print("paquete no existe")
        f.write("-- paquete no existe [" + str(contador) + "]" + "\n \n")
        continue

    product_codec=list_of_lists[i][1]
    eancodec=list_of_lists[i][2]
    valor=list_of_lists[i][3]
    vigencia=list_of_lists[i][4]
    subtype=list_of_lists[i][5]
    descripcion=list_of_lists[i][6]
    eancode=list_of_lists[i][7]
    product_code = list_of_lists[i][8]
    activar = list_of_lists[i][9].lower()



    conupdate="update ZEUS.PRODUCTO set "
    #print(conupdate)
    print("tamaño conupdate", len(conupdate))
    if (len(str(valor)) > 0):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate=conupdate+" VALORMINIMO = '" + valor + "',"
        conupdate = conupdate + " VALORMAXIMO = '" + valor + "',"
        conupdate = conupdate + " MULTIPLO= '" + valor + "',"
        print("funciono:", conupdate)
    if (len(str(descripcion)) > 0):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate=conupdate+" PROD_DESCRIPCION = '" + descripcion + "',"
        print("funciono:", conupdate)
    if(len(str(eancode))>0):
        #conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate=conupdate+" EANCODE = '"+eancode+"',"
        print("funciono:",conupdate)
    if (len(str(product_code)) > 0):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate = conupdate + " product code = '" + product_code + "',"
        print("funciono:", conupdate)
    if (str(activar) == "eliminar"):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate = conupdate + " EANCODE = '" + eancodec + "-INACT', ESTADO = 0 "
        print("funciono:", conupdate)
    if (str(activar) == "activar"):
        # conupdate=print(%i+ set %1 '%(conupdate,conupdate))
        conupdate = conupdate + " EANCODE = '" + eancodec + "', ESTADO = 1 "
        print("funciono:", conupdate)


    #VALIDAIA SI LOS CAMPOS A MODIFICAR  ESTAN VACIOS
    print("tamaño conupdate final: ", len(conupdate))
    if (len(str(conupdate)) < 26):
        #VALIDA QUE EL CAMPO TIPO SENTENCIA ESTE VACIO
        #if (len(str(activar))<3):
        print("Los campos a modificar estan vacios : es obligatorio en ZEUS que alguno de los siguientes campos no este vacio;  valor, descripcion, eancode, product code [" + str(contador) + "]" + "\n \n")
        f.write("Los campos a modificar estan vacios : es obligatorio en ZEUS que alguno de los siguientes campos no este vacio;  valor, descripcion, eancode, product code [" + str(contador) + "]" + "\n \n")
        continue


    conupdate=conupdate+" where PROD_ID = "+str(r[0][0])+"; -- ["+str(contador)+"]"
    #print("final:", conupdate)
    conupdate = conupdate.replace(', where', ' where')
    print("final:", conupdate)



    # escribir linea update en archivo
    f.write(conupdate + '\n \n')

# hasta aqui funciona bn








#cerrar archivo
f.close()


      














   
    

















