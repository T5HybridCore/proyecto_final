
op=0
while [ $op -ne 3 ]; do      #while para hacer un menu, ciclo mientras op!=3
	clear
	echo "\e[93m$(figlet Tiempos de sesion)\e[0m"			#titulo de color con figlet 
	echo "1) Mostrar tiempo en sesion de todos los usuarios"	#op1 tiempo de sesion de todos
	echo "2) Mostrar el tiempo de sesion de un usuario"		#tiempos de sesion de un usuario
	echo "3) Salir"
	read op
	case "$op" in
		1) ac -p						#comando para mostrar el tiempo de sesion de todos los usuarios, en formato de horas
		echo "Presiona cualquier tecla para continuar.."
		read s;;
		2) echo "Dame el usuario"
		read usr
		ac -d $usr                                           #Mostrar el historial de un usuario en particular con -d nombreusuario
		echo "Presiona cualquier tecla para continuar.."
		read s;;
esac
done