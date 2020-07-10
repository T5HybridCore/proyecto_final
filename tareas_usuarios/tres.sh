clear
echo "\e[97m$(figlet Historial de usuarios)\e[0m"
echo "Dame un usuario: "
read usr
op=0
while [ $op -ne 3 ];
do
clear
echo "1) comando ejecutados por "$usr
echo "2) buscar por comando"
echo "3) salir"
read op
case "$op" in
	1) lastcomm $usr
	echo "presiona una tecla para continuar..."
	read a;;
	2) echo "Dame el comando a buscar"
	read comando
	lastcomm $comando
	echo "presiona una tecla para continuar...."
	read a;;
esac
done
