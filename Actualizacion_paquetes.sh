

# ejecuta script python 

print("----------------------------------------------------------------\n \n ----------inicio script Python----------")
python /scripts_actualizacion_productos/update_productos-final
print("\n\n-----------finalizo script PYthon ----------")
print("-----------------------------------------------------------------")

cp /scripts_actualizacion_productos/update_productos-final/Update_paquetes.txt  ./Paquetes_actualizados_$(date +%Y%m%d)/







#valida si existe el archivo activo_inactivo.txt existe: si existe hay paquetes para crear, si No, no hay paquetes paquetes para crear,

DIRECTORIO=./scripts_actualizacion_productos/update_productos-final/activo_inactivo.txt

if [ -d "$DIRECTORIO" ]
then
   echo "El directorio ${DIRECTORIO} existe: Hay paquetes para crear \n \n "
else
   echo "El directorio ${DIRECTORIO} No existe: No hay paquetes para crear \n\n ------- FIN -------- exit "
fi






#valida el archivo activo_inactivo.txt para saber que script ejecutar, si el insert activos o el insert inactivos

activar=$('grep inactivo /scripts_actualizacion_productos/update_productos-final/activo_inactivo.txt | wc -l ')

If [[ "$activar" -eq 0 ]]; then
   echo -e "\n PAQUETES ACTIVOS \n\n"

   # insert activos
   print("----------------------------------------------------------------\n \n ----------inicio script Insert Activos----------")
   sh /scripts_actualizacion_productos/paquetes_bash/paquetes_activos/insert_productos_final.sh'
   print("\n\n----------- Finalizo  Script Insert Activos ----------")
   print("-----------------------------------------------------------------")
   cp /scripts_actualizacion_productos/paquetes_bash/paquetes_activos/paquetes_activos_final/insert* ./Paquetes_actualizados_$(date +%Y%m%d)/

else
  echo -e "\n PAQUETES INACTIVOS"

  # insert inactivos
  print("----------------------------------------------------------------\n \n ----------inicio script Insert Inactivos----------")
  sh /scripts_actualizacion_productos/paquetes_bash/paquetes_inactivos_bd/insert_productos_inactivos_BBDD.sh'
  print("\n\n----------- Finalizo  Script Insert Inactivos  ---------")
  print("-----------------------------------------------------------------")
  cp /scripts_actualizacion_productos/paquetes_bash/paquetes_inactivos_bd/inactivos/insert_inactivos/insert* ./Paquetes_actualizados_$(date +%Y%m%d)/

  cp  /scripts_actualizacion_productos/paquetes_bash/paquetes_inactivos_bd/updates_productos_inactivos.sh ./

fi








