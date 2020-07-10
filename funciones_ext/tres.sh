#!/bin/bash
dev[0]=/dev/sda1   #Alertar si los discos estan llenandose
dev[1]=/dev/sdb1  #en un vector podemos alamacenar todos los discos a checar
dev[2]=/sdc

for device in ${dev[@]};    #hacemos un for para revisar cada disco introducido en el vector
do
	ocupacion=$(df -H | grep $device | expand | tr -s " " | cut -d " " -f5 | cut -d "%" -f1)  
	# la variable ocupacion almacena la salida del comando df, con grep idicamos que solo obtega la del campo correspondiente al contenido del vector
       # cut -d para indicar el serparador, f5 para decir el campo, asi solo nos queda el porcentaje de uso del disco sin el $
	if [ $ocupacion -ge 22 ];  #preguta si la ocupacion es >= a 22
	then
	figlet alerta    #en caso de ser asi, muestra una alerta con un wall
	echo "Cuidado" $device al $ocupacion"% de ocupacion" | wall
fi
done
      #Este escript se ejecuta desde el archivo profile en /etc para chechar el uso de los discos al inicio de sesion