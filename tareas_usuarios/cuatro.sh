op=0
while [ $op -ne 3 ]; do
	clear
	echo "\e[93m$(figlet Tiempos de sesion)\e[0m"
	echo "1) Mostrar tiempo en sesion de todos los usuarios"
	echo "2) Mostrar el tiempo de sesion de un usuario"
	echo "3) Salir"
	read op
	case "$op" in
		1) ac -p
		echo "Presiona cualquier tecla para continuar.."
		read s;;
		2) echo "Dame el usuario"
		read usr
		ac -d $usr
		echo "Presiona cualquier tecla para continuar.."
		read s;;
esac
done
