



print("----------------------------------------------------------------\n \n ----------inicio script Update inactivos----------")
sh /scripts_actualizacion_productos/paquetes_bash/paquetes_inactivos_bd/updates_productos_inactivos_BBDD.sh
print("\n\n-----------finalizo script Update inactivos----------")
print("-----------------------------------------------------------------")
cp /scripts_actualizacion_productos/paquetes_bash/paquetes_inactivos_bd/inactivos/update_inactivos/paquetes_inactivos.txt /Paquetes_actualizados_$(date +%Y%m%d)/


