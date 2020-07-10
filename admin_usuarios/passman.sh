#!/bin/bash
resp=1
         while [  $resp == 1 ]; do  #el ciclo seguirá hasta que el usuario digite otra tecla que no sea 1
echo -e "Ingrese nombre de usuario: "
read nombre 
getent passwd $nombre > /dev/null #busca que el usuario se encuentre en los datos del sistema gracias a getent
  
if [ $? -eq 0 ]; then #validacion de que existe
        echo "Usuario encontrado!"
	passwd "$nombre" #inicia el proceso de cambio de contraseña

else
        echo "El usuario $nombre no existe."
	
fi
echo "¿Desea cambiar otra contraseña?"
echo "Presione 1" 
read resp #lee respuesta
 done #fin ciclo
exit 0
