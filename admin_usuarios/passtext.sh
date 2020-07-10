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
		if [ -f $ruta ] #valida que la ruta exista
		then 
		  echo "Ruta actualizada."
		else
		  echo "No se encontró el archivo. "
		  exit 
		fi
      fi 
     
usuario=inicializador
num=1
	while  [ "$usuario" != "FIN" ] #el ciclo parará cuando encuentre en el .txt el usuario llamado FIN
	do
		usuario=$(grep "user0$num" "$ruta" | cut -f2 -d' ') #el separador es espacio, grep se ubica en el numero de usuario, busca en el .txt el segundo campo y así extrae el nombre
		password=$(grep "user0$num" "$ruta" | cut -f3 -d' ')  #el separador es espacio, grep se ubica en el numero de usuario, busca en el .txt el tercer campo y así extrae la contraseña    
	        num=$(($num+1)) #se aumenta el numero para avanzar al siguiente usuario de la lista del archivo de texto
		getent passwd "$usuario" > /dev/null  #busca que el usuario se encuentre en los datos del sistema gracias a getent
		
		if [ $? -eq 0 ]; then #validacion de que el usuario existe segun lo que devuelva getent
			echo "$usuario existe."
			echo -e "$password\n$password" | passwd "$usuario"	#se cambia la contraseña del usuario, la \n es para ingresar la contra dos veces, como se pide
		else
			echo "$usuario no existe."
		fi
		
	done  #fin del ciclo
read -p "Presione cualquier tecla para continuar..." 
clear 
echo "Exito"
exit 0
