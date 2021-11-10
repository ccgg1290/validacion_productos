from datetime import datetime, timedelta
import mysql.connector
from mysql.connector import errorcode
from Movimiento import Movimiento
from MovimientosToExcel import MovimientosToExcel

"""
    config = {
        'user': 'U1014224787',
        'password': 'kGCR2Sp-J9u*5w',
        'host': '192.168.31.18',
        'port': '3306',
        'database': 'movii_nuevos_convenios.ws_operator',
        'raise_on_warnings': True,
    }

"""


cursor = 0
try:
    cnx = mysql.connector.Connect(
      host='192.168.31.18',
      port=3306,
      user='U1014224787',
      passwd='kGCR2Sp-J9u*5w',
      db='movii_nuevos_convenios',
      #charset='utf8'
    )
    cursor = cnx.cursor()

 #  query = "SELECT id, name, max_value, microservice_root, microservice_url, min_value FROM movii_nuevos_convenios.ws_operator where ID =317; "
    query = ''' 
SELECT  operator_name AS 'OPERADOR', microservice_url AS 'TIPO DE PRODUCTO', id AS 'ID MOVIIRED', name AS 'DESCRIPCION', max_value AS 'VALOR', ean_code AS 'EAN', product_code AS 'ID OPERADOR'
FROM movii_nuevos_convenios.ws_operator
WHERE operator_id not IN (11, 15, 19, 38, 40)
and status=1
and status_view=1
order by microservice_url;
 '''

    print(query)

    cursor.execute(query)

    # con el constructor se crea el archivo excel y en la primer linea se agerga el tiulo que se envie como ´parametro
    m2e = MovimientosToExcel("MAHINDRA")

    con=0
    #recorre el cursor
    for fila in cursor:
        print("REGISTRO: ",con," \nRECORRIENDO CURSOR",fila,"\n")


        #el objero movimiento tiene 5 atributos y cada uno es igualado con cada columna de la fila del cursor
        movimiento = Movimiento(fila)

        #en listar envio el propio objero como atributo y el metdo lista rimprime en pantalla l linea del cursor que fue recuperada en el objeto movimiento
        con += 1
        movimiento.listar()

        # con este metodo se le envia al objeto m2e el objeto movimiento como parametro (este objeto movimiento contiene la linea que esta recorriendo dl cursor)
        # y el metodo escribe cada atributo del objeto movimiento eb cada columna de la fila en el excel
        m2e.agregarItem(movimiento)


    #este metodo guarda el archivo excel, es decir el atributi wb del objeto MovimientosToExcel y lo guarda con el nombre que se indique en el parametro
    m2e.guardarPlanilla("listadoDeProductos.xls")

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(err)
else:
  cnx.close()








