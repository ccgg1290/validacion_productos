

rm -rf inactivos/update_inactivos
mkdir inactivos/update_inactivos/





conectaBBDD(){

SQL_HOST=192.168.31.18
SQL_PORT=3306
SQL_USER="U1014224787"
SQL_PASSWORD="kGCR2Sp-J9u*5w"
SQL_DATABASE="movii_nuevos_convenios"
SQL_ARGS="-h $SQL_HOST -P $SQL_PORT -u $SQL_USER -p$SQL_PASSWORD -D $SQL_DATABASE -s -e"

RESULTADOCONSULTA=$(mysql $SQL_ARGS "select id  from movii_nuevos_convenios.ws_operator where product_code =$1
order by id desc limit 1;")
echo $RESULTADOCONSULTA

}


conectaBBDDMOVII(){

SQL_HOST=192.168.31.18
SQL_PORT=3306
SQL_USER="U1014224787"
SQL_PASSWORD="kGCR2Sp-J9u*5w"
SQL_DATABASE="movii_nuevos_convenios"
SQL_ARGS="-h $SQL_HOST -P $SQL_PORT -u $SQL_USER -p$SQL_PASSWORD -D $SQL_DATABASE -s -e"

RESULTADOCONSULTA=$(mysql $SQL_ARGS "select id  from movii_nuevos_convenios_movii.ws_operator where product_code =$1
order by id desc limit 1;")
echo $RESULTADOCONSULTA

}



update_insert_productos_inactivos(){

update_moviired=$( echo "update movii_nuevos_convenios.ws_operator set ean_code = 'EANCODE', status=1, status_view=1 where id=DIGITAR_ID; -- $product_code" )
update_movii=$( echo "update movii_nuevos_convenios_movii.ws_operator set ean_code = 'EANCODE', status=1, status_view=1 where id=DIGITAR_ID; -- $product_code" )

update_moviired=${update_moviired/EANCODE/$eancode}
update_moviired=${update_moviired/DIGITAR_ID/$1}

update_movii=${update_movii/EANCODE/$eancode}
update_movii=${update_movii/DIGITAR_ID/$2}

echo -e  "-- ---MOVIIRED \n $update_moviired \n \n-- ---MOVII \n $update_movii"
}



echo -e "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  UPDATE MAHINDRA  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx "
echo -e "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  UPDATE MAHINDRA  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx " >> inactivos/update_inactivos/paquetes_inactivos.txt

con=1


while IFS=\#  read -r operador product_code eancode valor vigencia subtype cedula descripcion otro;
 do


#variable que recoje el resultado de la funcion update_insert_productos_inactivos
id_bd=$(conectaBBDD $product_code)
id_bdMOVII=$(conectaBBDDMOVII $product_code)
update_inactivos=$(update_insert_productos_inactivos $id_bd $id_bdMOVII )



#imprime por pantalla
echo -e  "\n\n--  xxxxxxxxxxxxxxxxxxxxxxxxxx update $product_code $operador [$con] xxxxxxxxxxxxxxxxxxxxxxxxxx  \n "
echo -e "$update_inactivos"


#imprime archivo
echo -e  "\n\n--  xxxxxxxxxxxxxxxxxxxxxxxxxx update $product_code $operador [$con] xxxxxxxxxxxxxxxxxxxxxxxxxx  \n " >> inactivos/update_inactivos/paquetes_inactivos.txt
echo -e "$update_inactivos">> inactivos/update_inactivos/paquetes_inactivos.txt




# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

con=$((con+1))

#SE CIERRA EL WHILE
done < tx.list





# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ALIANZAS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx






conectaBBDD_A(){

SQL_HOST=192.168.29.187
SQL_PORT=3306
SQL_USER="U1014224787"
SQL_PASSWORD="kGCR2Sp-J9u*5w"
SQL_DATABASE="ALIANZAS"
SQL_ARGS="-h $SQL_HOST -P $SQL_PORT -u $SQL_USER -p$SQL_PASSWORD -D $SQL_DATABASE -s -e"

RESULTADOCONSULTA=$(mysql $SQL_ARGS "select PROD_ID from ALIANZAS.PRODUCTO where SUBPRODUCTO =$1
order by PROD_ID desc limit 1;")

echo $RESULTADOCONSULTA

}



update_insert_productos_inactivosA(){

update_Alianzas=$( echo "update  ALIANZAS.PRODUCTO  set  EANCODE ='$eancode', ESTADO=1 where PROD_ ID=INGRESE_EL_ID ; -- $product_code")

update_Alianzas=${update_Alianzas/EAN_CODE/$eancode}
update_Alianzas=${update_Alianzas/INGRESE_EL_ID/$1}

echo -e  "-- ---ALIANZAS \n  $update_Alianzas"

}



echo -e "\n\n\n\n\n--  ####################################  UPDATE ALIANZAS #################################### "
echo -e "\n\n\n\n\n--  ####################################  UPDATE ALIANZAS #################################### " >> inactivos/update_inactivos/paquetes_inactivos.txt

con=1


while IFS=\# read  operador product_code eancode valor vigencia subtype cedula descripcion ;
 do

#varIable que ecoje el resultado de la funcion update_insert_productos_inactivos
id_bd=$(conectaBBDD_A $product_code)
update_inactivos=$(update_insert_productos_inactivosA $id_bd )


#imprime pantalla
echo -e  "\n\n--  xxxxxxxxxxxxxxxxxxxxxxxxxx update $product_code $operador [$con] xxxxxxxxxxxxxxxxxxxxxxxxxx  \n "
echo -e "$update_inactivos"

#imprime archivo
echo -e  "\n\n--  xxxxxxxxxxxxxxxxxxxxxxxxxx update $product_code $operador [$con] xxxxxxxxxxxxxxxxxxxxxxxxxx  \n " >> inactivos/update_inactivos/paquetes_inactivos.txt
echo -e "$update_inactivos">> inactivos/update_inactivos/paquetes_inactivos.txt

## xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#

con=$((con+1))

#SE CIERRA EL WHILE
 done < tx.list













# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx getrax xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx



conectaBBDD_G(){

SQL_HOST=192.168.29.166
SQL_PORT=3305
SQL_USER="U1014224787"
SQL_PASSWORD="kGCR2Sp-J9u*5w"
SQL_DATABASE="ZEUS"
SQL_ARGS="-h $SQL_HOST -P $SQL_PORT -u $SQL_USER -p$SQL_PASSWORD -D $SQL_DATABASE -s -e"

RESULTADOCONSULTA=$(mysql $SQL_ARGS "select PROD_ID from ZEUS.PRODUCTO where SUBPRODUCTO =$1
order by PROD_ID desc limit 1;")
echo $RESULTADOCONSULTA
}



update_insert_productos_inactivosG(){


update_getrax=$( echo "update ZEUS.PRODUCTO  set  EANCODE ='$eancode', ESTADO=1 where PROD_ ID=INGRESE_EL_ID; -- $product_code")


update_getrax=${update_getrax/EAN_CODE/$eancode}

update_getrax=${update_getrax/INGRESE_EL_ID/$1}


echo -e  "-- ---GETRAX \n $update_getrax"

}

echo -e "\n\n\n\n\n--  #################################### UPDATE GETRAX #################################### " 
echo -e "\n\n\n\n\n--  #################################### UPDATE GETRAX #################################### " >> inactivos/update_inactivos/paquetes_inactivos.txt

con=1


while IFS=\# read -r operador product_code eancode valor vigencia subtype cedula descripcion  ;
 do

#varIable que ecoje el resultado de la funcion update_insert_productos_inactivos

id_bd=$(conectaBBDD_G $product_code)

update_inactivos=$(update_insert_productos_inactivosG $id_bd )

#imprime pantalla
echo -e  "\n\n--  xxxxxxxxxxxxxxxxxxxxxxxxxx update $product_code $operador [$con] xxxxxxxxxxxxxxxxxxxxxxxxxx  \n "
echo -e "$update_inactivos"

#imprime archivo
echo -e  "\n\n--  xxxxxxxxxxxxxxxxxxxxxxxxxx update $product_code $operador [$con] xxxxxxxxxxxxxxxxxxxxxxxxxx  \n " >> inactivos/update_inactivos/paquetes_inactivos.txt
echo -e "$update_inactivos">> inactivos/update_inactivos/paquetes_inactivos.txt

### xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

con=$((con+1))

##SE CIERRA EL WHILE
 done < tx.list


echo -e "\n FINALIZADO"

