#!/bin/bash
ruta=$PWD/admin_usuarios/pass.txt #directorio actual
clear
echo "============================================"
	echo "Directorio actual del archivo: $ruta "
	echo "¿Desea cambiarlo? (1)Sí "
	read ban
	if [ "$ban" == "1" ];then
	echo " Ingrese ruta: "
	read ruta
		if [ -f $ruta ]
		then
		  echo "Ruta actualizada."
		else
		  echo "No se encontró el archivo. "
		  exit
		fi
      fi
     
usuario=inicializador
num=1
	while [ "$usuario" != "FIN" ]
	do
		usuario=$(grep "user0$num" "$ruta" | cut -f2 -d' ')
		password=$(grep "user0$num" "$ruta" | cut -f3 -d' ')
	        num=$(($num+1))
		getent passwd "$usuario" > /dev/null
		
		if [ $? -eq 0 ]; then
			echo "$usuario existe."
			echo -e "$password\n$password" | passwd "$usuario"
		else
			echo "$usuario no existe."
		fi
		
	done
read -p "Presione cualquier tecla para continuar..."
clear
echo "Exito"
exit 0
