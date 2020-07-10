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
	while  [ "$usuario" != FIN ]
	do
		usuario=$(grep "user0$num" "$ruta" | cut -f2 -d:) #el separador es ":", grep se ubica en el numero de usuario, busca en el .txt el segundo campo y así extrae el nombre
		num=$(($num+1)) #se aumenta el numero para avanzar al siguiente usuario de la lista del archivo de texto
		password=$(grep "pass" "$ruta" | cut -f2 -d:) #el separador es ":", grep se ubica en "pass" , busca en el .txt el segundo campo y así extrae la contraseña     
		group=$(grep "grupo" "$ruta" |cut -f2 -d:)  #el separador es ":", grep se ubica en "grupo", busca en el .txt el segundo campo y así extrae el grupo           
		
		groupadd $group	 #crea el grupo 	           
                useradd -g $group -m $usuario  #añade nuevo usuario con el nombre y grupo dados
                echo -e "$password\n$password" | passwd "$usuario" #se cambia la contraseña del usuario, la \n es para ingresar la contra dos veces, como se pide
		
	done
sleep 2 #retraso
clear
userdel FIN #elimina al usuario FIN 
echo "Exito"
exit 0
