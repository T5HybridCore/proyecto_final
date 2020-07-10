#!/bin/bash
ruta=$PWD/admin_usuarios/users.txt #directorio actual
clear
	echo "Directorio actual del archivo: $ruta "
	echo "¿Desea cambiarlo? (1)Sí"
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
	while [ "$usuario" != FIN ]
	do
		usuario=$(grep "user0$num" "$ruta" | cut -f2 -d:)
		num=$(($num+1))
		password=$(grep "pass" "$ruta" | cut -f2 -d:)
		group=$(grep "grupo" "$ruta" |cut -f2 -d:)
		
		groupadd $group
                useradd -g $group -m $usuario
                echo -e "$password\n$password" | passwd "$usuario"
		
	done 
sleep 2
clear 
userdel FIN 
echo "Exito" 
exit 0
