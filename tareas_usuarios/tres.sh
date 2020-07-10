clear
echo "\e[97m$(figlet Historial de usuarios)\e[0m"   #Mostar historial de usuarios
echo "Dame un usuario: "
read usr				#Introduciomos el usuario
op=0
while [ $op -ne 3 ];	#while para hacer un menu
do
clear
echo "1) comando ejecutados por "$usr
echo "2) buscar por comando"
echo "3) salir"
read op
case "$op" in
	1) lastcomm $usr                             #opcion 1, mostrar historial de comandos ejecutados con lastcomm nombredeusuario
	echo "presiona una tecla para continuar..."
	read a;;
	2) echo "Dame el comando a buscar"
	read comando
	lastcomm $comando				#Opcion 2, mostrar historial de un comando, quienes lo han usado
	echo "presiona una tecla para continuar...."
	read a;;
esac
done