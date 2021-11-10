rm -rf inactivos


#inicia funcion
insert_productos(){

local PRODUCTO

case $1 in

  CLARO)
  PRODUCTO=$(echo "
INSERT INTO movii_nuevos_convenios.ws_operator
(max_value, microservice_root, microservice_url, min_value, operator_name, name, details_expiration, operator_id, product_code, reg_exp, type, ean_code, multiple, status, status_view, product_image, tax, category_id, sub_type, calculate_iva)
VALUES(VALOR, 'http://192.168.31.20:3011/ws_CLARO/', 'buyPackage', VALOR, 'CLARO', 'DESCRIPCION', 'VIGENCIA', 1, 'PRODUCT_CODE ', '^3[0-9]{9}$', 1, 'EANCODE -INACT', VALOR, 0, 0, 'https://tendero.moviired.co:64945/app/media/op06.png', NULL, NULL, SUBTYPE, 0);" )
  ;;
  TIGO)
   PRODUCTO=($echo "
INSERT INTO movii_nuevos_convenios.ws_operator
(max_value, microservice_root, microservice_url, min_value, operator_name, name, details_expiration, operator_id, product_code, reg_exp, type, ean_code, multiple, status, status_view, product_image, tax, category_id, sub_type, calculate_iva)
VALUES(VALOR, 'http://192.168.31.20:303/ws_TIGO/', 'buyPackage', VALOR, 'TIGO', 'DESCRIPCION', 'VIGENCIA', 3, 'PRODUCT_CODE', '^3[0-9]{9}$', 1, 'EANCODE INACT-', VALOR, 0, 0, 'https://tendero.moviired.co:64945/app/media/op05.png', NULL, NULL, SUBTYPE, 0);" )
  ;;
  AVANTEL)
   PRODUCTO=($echo "
INSERT INTO movii_nuevos_convenios.ws_operator
(max_value, microservice_root, microservice_url, min_value, operator_name, name, details_expiration, operator_id, product_code, reg_exp, type, ean_code, multiple, status, status_view, product_image, tax, category_id, sub_type, calculate_iva)
VALUES(VALOR, 'http://192.168.31.20:3061/ws_AVANTEL/', 'buyPackage', VALOR, 'AVANTEL', 'DESCRIPCION', 'VIGENCIA', 4, 'PRODUCT_CODE', '^3[0-9]{9}$', 1, 'EANCODE -INACT', VALOR, 0, 0, 'https://tendero.moviired.co:64945/app/media/avantel.png', NULL, NULL, SUBTYPE, 0);")
  ;;
  MOVISTAR)
   PRODUCTO=($echo "
INSERT INTO movii_nuevos_convenios.ws_operator
(max_value, microservice_root, microservice_url, min_value, operator_name, name, details_expiration, operator_id, product_code, reg_exp, type, ean_code, multiple, status, status_view, product_image, tax, category_id, sub_type, calculate_iva)
VALUES(VALOR, 'http://192.168.31.20:3021/ws_MOVISTAR/', 'buyPackage', VALOR, 'MOVISTAR', 'DESCRIPCION', 'VIGENCIA', 2, 'PRODUCT_CODE', '^3[0-9]{9}$', 1, 'EANCODE-INACT', VALOR, 0, 0, 'https://tendero.moviired.co:64945/app/media/op02.png', NULL, NULL, SUBTYPE, 0);" )
  ;;
  ETB)
   PRODUCTO=($echo "
INSERT INTO movii_nuevos_convenios.ws_operator
(max_value, microservice_root, microservice_url, min_value, operator_name, name, details_expiration, operator_id, product_code, reg_exp, type, ean_code, multiple, status, status_view, product_image, tax, category_id, sub_type, calculate_iva)
VALUES(VALOR, 'http://192.168.31.20:305/ws_ETB/', 'buyPackage', VALOR, 'ETB', 'DESCRIPCION', 'VIGENCIA', 14, 'PRODUCT_CODE', '^3[0-9]{9}$', 1, 'EANCODE -INACT', VALOR, 0, 0, 'https://tendero.moviired.co:64945/app/media/op01.png', '', NULL, SUBTYPE, 0);")
  ;;
  KALLEY)
   PRODUCTO=($echo "INSERT INTO movii_nuevos_convenios.ws_operator
(max_value, microservice_root, microservice_url, min_value, operator_name, name, details_expiration, operator_id, product_code, reg_exp, type, ean_code, multiple, status, status_view, product_image, tax, category_id, sub_type, calculate_iva)
VALUES(VALOR, 'http://192.168.31.20:3178/ws_SUMA/', 'buyPackage', VALOR, 'KALLEYMOVIL', 'DESCRIPCION', 'VIGENCIA', 41, 'PRODUCT_CODE', '^3[0-9]{9}$', 1, 'EANCODE -INACT', VALOR, 0, 0, 'https://tendero.moviired.co:64945/app/media/kalley.png', '', NULL, SUBTYPE, 0);")
  ;;
  WINGS)
   PRODUCTO=($echo "INSERT INTO movii_nuevos_convenios.ws_operator
(max_value, microservice_root, microservice_url, min_value, operator_name, name, details_expiration, operator_id, product_code, reg_exp, type, ean_code, multiple, status, status_view, product_image, tax, category_id, sub_type, calculate_iva)
VALUES(VALOR, 'http://192.168.31.20:3178/ws_SUMA/', 'buyPackage', VALOR, 'WINGSMOBILE', 'DESCRIPCION', 'VIGENCIA', 50, 'PRODUCT_CODE', '^3[0-9]{9}$', 1, 'EANCODE -INACT', VALOR, 0, 0, 'https://tendero.moviired.co:64945/app/media/wings.png', '', NULL, SUBTYPE, 0);")
  ;;
  UNICOR)
   PRODUCTO=($echo "INSERT INTO movii_nuevos_convenios.ws_operator
(max_value, microservice_root, microservice_url, min_value, operator_name, name, details_expiration, operator_id, product_code, reg_exp, type, ean_code, multiple, status, status_view, product_image, tax, category_id, sub_type, calculate_iva)
VALUES(VALOR, 'http://192.168.31.20:3178/ws_SUMA/', 'buyPackage', VALOR, 'UNICORNMOBILE', 'DESCRIPCION', 'VIGENCIA', 60, 'PRODUCT_CODE', '^3[0-9]{9}$', 1, 'EANCODE -INACT', VALOR, 0, 0, 'https://tendero.moviired.co:64945/app/media/unicorn.png', '', NULL, SUBTYPE, 0);")
  ;;
  EXITO)
   PRODUCTO=($echo "INSERT INTO movii_nuevos_convenios.ws_operator
(max_value, microservice_root, microservice_url, min_value, operator_name, name, details_expiration, operator_id, product_code, reg_exp, type, ean_code, multiple, status, status_view, product_image, tax, category_id, sub_type, calculate_iva)
VALUES(VALOR, 'http://192.168.31.20:310/ws_EXITO/', 'buyPackage', VALOR, 'EXITO', 'DESCRIPCION', 21, 'PRODUCT_CODE', '^3[0-9]{9}$', 1, 'EANCODE -INACT', VALOR, 0, 0, 'https://tendero.moviired.co:64945/app/media/exito.png', '', NULL, SUBTYPE, 0);")
  ;;
  WOM)
   PRODUCTO=($echo "INSERT INTO movii_nuevos_convenios.ws_operator
(max_value, microservice_root, microservice_url, min_value, operator_name, name, details_expiration, operator_id, product_code, reg_exp, type, ean_code, multiple, status, status_view, product_image, tax, category_id, sub_type, calculate_iva)
VALUES(VALOR, 'http://192.168.31.20:335/ws_WOM/', 'buyPackage', VALOR, 'WOM', 'DESCRIPCION', 'VIGENCIA', 73, 'PRODUCT_CODE', '^3[0-9]{9}$', 1, 'EANCODE -INACT', VALOR, 0, 0, 'https://tendero.moviired.co:64945/app/media/wom.png', '', NULL, SUBTYPE, 0);")
  ;;
  YOIN)
   PRODUCTO=($echo "INSERT INTO movii_nuevos_convenios.ws_operator
(max_value, microservice_root, microservice_url, min_value, operator_name, name, details_expiration, operator_id, product_code, reg_exp, type, ean_code, multiple, status, status_view, product_image, tax, category_id, sub_type, calculate_iva)
VALUES(VALOR, 'http://192.168.31.20:3178/ws_SUMA/', 'buyPackage', VALOR, 'YOIN MOVIL', 'DESCRIPCION', 'VIGENCIA', 76, 'PRODUCT_CODE', '^3[0-9]{9}$', 1, 'EANCODE -INACT', VALOR, 0, 0, 'https://tendero.moviired.co:64945/app/media/unicorn.png', '', NULL, SUBTYPE, 0);")
  ;;
esac
echo $PRODUCTO

}
#finaliza funcion
#inicia funcion

remplazaproducto(){

remplaza=$(echo $agrega_producto)
remplaza=${remplaza//VALOR/$valor}
remplaza=${remplaza/PRODUCT_CODE/$product_code}
remplaza=${remplaza/EANCODE/$eancode}
remplaza=${remplaza/DESCRIPCION/$descripcion}
remplaza=${remplaza/VIGENCIA/$vigencia}
remplaza=${remplaza/SUBTYPE/$subtype}
remplazamovii=${remplaza/movii_nuevos_convenios/movii_nuevos_convenios_movii}

echo -e  "-- ---MOVIIRED \n $remplaza \n \n-- ---MOVII \n $remplazamovii \n"

}


#variables pricipales
#agrega_producto
#producto_actualizado
#update_inactivos
#ARCHIVOS FINALES
rm -rf inactivos
mkdir inactivos
mkdir inactivos/insert_inactivos/




# XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX CABECERAS MAHINDRA XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


echo -e "-- --------------- INSERT MAHINDRA ----------------\n \n "
echo -e "-- --------------- INSERT MAHINDRA --------------- \n \n"> inactivos/insert_inactivos/insert_moviired_movii_inactivos.txt

echo -e  "BIENVENIDO \nRECUERDA QUE LOS CAMPOS A INGRESAR VIENEN EN EL SIGUIENTE ORDEN SEPADOS POR UN GUION:
          \nOPERADOR-PRODUCT_CODE-EANCODE-VALOR-VOGENCIA-SUBTYPE-DESCRIPCION \n \n INICIO \n"


# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  PRINCIPAL MAHINDRA xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
con=1;

while IFS=\#  read -r operador product_code eancode valor vigencia subtype cedula descripcion otro;
 do

#VARIABLE GLOBAL QUE RECOGE EL INSERT DE LA FUNCION INSERT PRODUCTO 
agrega_producto=$(insert_productos $operador)
#echo -e  "$agrega_producto \n \n" 

#VARIABLE GLOBAL QUE GUARDA EL INSERT ACTUALIZADO DE LA FUNCION REMPLAZAPRODUCTO   esta funcion devuelve el resultado de dos variables remplaza remplazamovii
producto_actualizado=$(remplazaproducto)


#imprime pantalla
echo -e  "\n\n--  xxxxxxxxxxxxxxxxxxxxxxxxxx insert $product_code $operador [$con] xxxxxxxxxxxxxxxxxxxxxxxxxx  \n "
echo "$producto_actualizado"

#imprime archivo
echo -e  "\n\n--  xxxxxxxxxxxxxxxxxxxxxxxxxx insert $product_code $operador [$con] xxxxxxxxxxxxxxxxxxxxxxxxxx  \n " >> inactivos/insert_inactivos/insert_moviired_movii_inactivos.txt
echo -e "$producto_actualizado">> inactivos/insert_inactivos/insert_moviired_movii_inactivos.txt


con=$((con+1))


#SE CIERRA EL WHILE
done < tx.list
#done





#verifica si hay paquetes claro o tigo en el tx.list,
solomahindra=0

while IFS=\# read -r operador product_code eancode valor vigencia subtype cedula descripcion  ;
do
#echo "$operador"
if [[ "$operador" == "TIGO" || "$operador" == "CLARO" ]]; then
echo "HAY  PAQUETES  CLARO O TIGO EN EL TX.LIST"
solomahindra=1
break
fi
done < tx.list

#si no existe ningun paquete que sea tigo o claro, salir del programa
if [[ "$solomahindra" -eq 0 ]]; then
echo -e "\n PAQUETES SOLO INSERTADOS EN  MAHINDRA \n\n ------------ fin ----------------"
exit
fi








############################  insert alianzas  ########################################################




insert_productos_alianzas(){


case $1 in

  CLARO)
PRODUCTOA=$( echo "INSERT INTO ALIANZAS.PRODUCTO
(PROD_DESCRIPCION, OPER_ID, TIPR_ID, PROD_REGISTRADOPOR, PROD_FECHAREGISTRO, EANCODE, ACCOUNTLEN, VALORMINIMO, VALORMAXIMO, MULTIPLO, ESTADO, SUBPRODUCTO, TERC_ID, PROD_SMS, BANC_ID, PROD_REF_EXTERNA_PROCESO, PROGRAM_ID, PROD_TITRDEFAULT, GESTOR_ID, VALORFIJO)
VALUES('NAME', 25, 7, CEDULA, NOW(), 'EAN_CODE -INACT', '10', PRECIO, PRECIO, PRECIO, '0', 'PRODUCT_CODE', NULL, 0, NULL, NULL, NULL, NULL, 20, NULL);" )
  ;;
  TIGO)
PRODUCTOA=$( echo "INSERT INTO ALIANZAS.PRODUCTO
(PROD_DESCRIPCION, OPER_ID, TIPR_ID, PROD_REGISTRADOPOR, PROD_FECHAREGISTRO, EANCODE, ACCOUNTLEN, VALORMINIMO, VALORMAXIMO, MULTIPLO, ESTADO, SUBPRODUCTO, TERC_ID, PROD_SMS, BANC_ID, PROD_REF_EXTERNA_PROCESO, PROGRAM_ID, PROD_TITRDEFAULT, GESTOR_ID, VALORFIJO)
VALUES('NAME', 13, 7, CEDULA, NOW(), 'EAN_CODE -INACT', '10', PRECIO, PRECIO, PRECIO, '0', 'PRODUCT_CODE', NULL, 0, NULL, NULL, NULL, NULL, 22, NULL);" )
  ;;
esac

echo $PRODUCTOA

}
#termina funcion

remplazaproductoA(){

remplazaA=$(echo $agrega_productoA)
remplazaA=${remplazaA//PRECIO/$valor}
remplazaA=${remplazaA/PRODUCT_CODE/$product_code}
remplazaA=${remplazaA/EAN_CODE/$eancode}
remplazaA=${remplazaA/NAME/$descripcion}
remplazaA=${remplazaA/CEDULA/$cedula}

echo -e  "-- ---ALIANZAS\n  \n $remplazaA \n"

}

update_insert_productos_inactivosA(){

update_Alianzas=$( echo "update  ALIANZAS.PRODUCTO  set  EANCODE ='$eancode', ESTADO=1 where PROD_ ID=INGRESE EL ID; -- $product_code")

update_Alianzas=${update_Alianzas=/EAN_CODE/$eancode}

echo -e  "-- ---ALIANZAS \n  $update_Alianzas"

}





# XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX CABECERAS ALIANZAS XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo -e "\n\n ----------------- INSERT ALIANZAS --------------- \n "
echo -e "\n\n ----------------- INSERT ALIANZAS --------------- \n "> inactivos/insert_inactivos/insert_alianzas_inactivos.txt

con=1

echo -e  "BIENVENIDO \nRECUERDA QUE LOS CAMPOS A INGRESAR VIENEN EN EL SIGUIENTE ORDEN SEPADOS POR UN GUION:
          \nOPERADOR-PRODUCT_CODE-EANCODE-VALOR-VOGENCIA-SUBTYPE-CEDULA-DESCRIPCION \n \n INICIO \n\n"


# XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX PRINCIPAL  XXXXXXXXXXXXXXXXXXXXXXXXXXX

while IFS=\# read  operador product_code eancode valor vigencia subtype cedula descripcion ;
 do




#verifica si existe un operdor direferente a tigo o claro en el tx.list y lo ignora
if [[ "$operador" != "TIGO" && "$operador" != "CLARO"  ]]; then
continue
fi




#VARIABLE GLOBAL QUE RECOGE EL INSERT 
agrega_productoA=$(insert_productos_alianzas $operador)
#echo -e  "$agrega_productoA \n \n"

#VARIABLE GLOBAL QUE GUARDA EL INSERT ACTUALIZADO DE LA FUNCION REMPLAZAPRODUCTO
producto_actualizadoA=$(remplazaproductoA)

#imprime pantalla
echo -e  "\n\n--  xxxxxxxxxxxxxxxxxxxxxxxxxx insert $product_code $operador  [$con] xxxxxxxxxxxxxxxxxxxxxxxxxx  \n "
echo "$producto_actualizadoA"

#imprime archivo
echo -e  "\n\n--  xxxxxxxxxxxxxxxxxxxxxxxxxx insert $product_code $operador [$con] xxxxxxxxxxxxxxxxxxxxxxxxxx  \n ">> inactivos/insert_inactivos/insert_alianzas_inactivos.txt
echo "$producto_actualizadoA" >> inactivos/insert_inactivos/insert_alianzas_inactivos.txt


con=$((con+1))

#SE CIERRA EL WHILE
 done < tx.list





# ---------------------------------------------------------------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------------------------------------------------------------------



############################  insert GETRAX  ########################################################



insert_productos_getrax(){

local PRODUCTOG

case $1 in

 CLARO)
PRODUCTOG=$( echo "INSERT INTO ZEUS.PRODUCTO
(PROD_DESCRIPCION, OPER_ID, TIPR_ID, PROD_REGISTRADOPOR, PROD_FECHAREGISTRO, EANCODE, ACCOUNTLEN, VALORMINIMO, VALORMAXIMO, MULTIPLO, ESTADO, SUBPRODUCTO, TERC_ID, PROD_SMS, GESTOR_ID, BANC_ID, PROD_REF_EXTERNA_PROCESO, PROGRAM_ID, PROD_TITRDEFAULT, VALORFIJO, PROD_ISOTP, PROD_PORCENTAJEIVA)
VALUES('NAME', 31, 7, CEDULA, NOW(), 'EAN_CODE -INACT', 10, PRECIO, PRECIO, PRECIO, '0', 'PRODUCT_CODE', NULL, 0, 20, NULL, NULL, NULL, NULL, NULL, 0, NULL);")
 ;;
 TIGO)
PRODUCTOG=$( echo "INSERT INTO ZEUS.PRODUCTO
(PROD_DESCRIPCION, OPER_ID, TIPR_ID, PROD_REGISTRADOPOR, PROD_FECHAREGISTRO, EANCODE, ACCOUNTLEN, VALORMINIMO, VALORMAXIMO, MULTIPLO, ESTADO, SUBPRODUCTO, TERC_ID, PROD_SMS, GESTOR_ID, BANC_ID, PROD_REF_EXTERNA_PROCESO, PROGRAM_ID, PROD_TITRDEFAULT, VALORFIJO, PROD_ISOTP, PROD_PORCENTAJEIVA)
VALUES('NAME', 13, 7, CEDULA, NOW(), 'EAN_CODE -INACT', 10, PRECIO , PRECIO , PRECIO , '0', 'PRODUCT_CODE', NULL, 0, 22, NULL, NULL, NULL, NULL, NULL, 0, NULL);")
 ;;
esac
echo $PRODUCTOG

}

remplazaproductoG(){

remplazaG=$(echo $agrega_productoG)
remplazaG=${remplazaG//PRECIO/$valor}
remplazaG=${remplazaG/PRODUCT_CODE/$product_code}
remplazaG=${remplazaG/EAN_CODE/$eancode}
remplazaG=${remplazaG/NAME/$descripcion}
remplazaG=${remplazaG/CEDULA/$cedula}

echo -e  "-- ---GETRAX \n $remplazaG \n"

}



echo -e "\n\n ----------------- INSERT GETRAX --------------- \n \n"
echo -e "\n\n ----------------- INSERT GETRAX --------------- \n \n"> inactivos/insert_inactivos/insert_getrax_inactivos.txt



echo -e  "BIENVENIDO \nRECUERDA QUE LOS CAMPOS A INGRESAR VIENEN EN EL SIGUIENTE ORDEN SEPADOS POR UN GUION:
          \nOPERADOR-PRODUCT_CODE-EANCODE-VALOR-VOGENCIA-SUBTYPE-CEDULA-DESCRIPCION \n \n INICIO \n"



con=1;



## XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX PRINCIPAL GETRAX XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

while IFS=\# read -r operador product_code eancode valor vigencia subtype cedula descripcion  ;
 do

#verifica si existe un operdor direferente a tigo o claro en el tx.list y lo ignora
if [[ "$operador" != "TIGO" && "$operador" != "CLARO"  ]]; then
continue
fi



#VARIABLE GLOBAL QUE RECOGE EL INSERT DE LA 
agrega_productoG=$(insert_productos_getrax $operador)
#cho -e  "$agrega_productoG \n \n"

#VARIABLE GLOBAL QUE GUARDA EL INSERT ACTUALIZADO DE LA FUNCION REMPLAZAPRODUCTO
producto_actualizadoG=$(remplazaproductoG)

#IMPRIME PANTALLA
echo -e  "\n\n--  xxxxxxxxxxxxxxxxxxxxxxxxxx insert $product_code $operador  [$con] xxxxxxxxxxxxxxxxxxxxxxxxxx  \n "
echo "$producto_actualizadoG"

#IMPRIME ARCHUIVO
echo -e  "\n\n  xxxxxxxxxxxxxxxxxxxxxxxxxx insertinsert  $product_code $operador [$con] xxxxxxxxxxxxxxxxxxxxxxxxxx  \n ">> inactivos/insert_inactivos/insert_getrax_inactivos.txt
echo -e "$producto_actualizadoG">> inactivos/insert_inactivos/insert_getrax_inactivos.txt



con=$((con+1))

 done < tx.list

echo -e "----------------------------- FINALIZADO -----------------------------"
















