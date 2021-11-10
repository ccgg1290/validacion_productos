



echo -e "xxxxxxxxxxxxxxxxx iniciando envio de correos xxxxxxxxxxxxxxxxxxxxxxxxxx"

#verifica si hay paquetes claro o tigo en el tx.list,
solomahindra=0

while IFS=\# read -r operador product_code eancode valor vigencia subtype cedula descripcion  ;
do
#echo "$operador"
if [[ "$operador" == "TIGO" || "$operador" == "CLARO" ]]; then
#echo "HAY  PAQUETES  CLARO O TIGO EN EL TX.LIST"
solomahindra=1
break
fi
done < tx.list


echo -e "digite el asunto del correo "
read Asunto




#aqui enviamos el correo dependiente del operador se enviaran 3 o solo un archivo 

#si no existe ningun paquete que sea tigo o claro, salir del programa
if [[ "$solomahindra" -eq 0 ]]; then

   echo -e "paquetes solo insertados en mahindra "
   echo -e "se enviara solo un archivo"

   echo -e "\n Buen dia Erika: \n\n Me podrias colaborar ejecutando las siguientes sentencias. \n\n Quedo atento." |  mailx -a insert_moviired_movii.txt  -s "$Asunto" "cristian.gualtero@moviired.co" 
   echo -e "xxxxxxxxxxxxxxxxx correo enviado  xxxxxxxxxxxxxxxxxxxxxxxxxx"

else
   echo -e "Hay paquetes insertados en mahindra alianzas y getrax"
   echo -e "se enviaran 3 archivos"

   echo -e "\n Buen dia Erika: \n\n Me podrias colaborar ejecuatando las siguientes sentencias. \n\n Quedo atento." |  mailx -a insert_moviired_movii.txt -a insert_getrax.txt -a insert_alianzas.txt -s "$Asunto" "cristian.gualtero@moviired.co"
   echo -e "xxxxxxxxxxxxxxxxx correo enviado  xxxxxxxxxxxxxxxxxxxxxxxxxx"

fi




