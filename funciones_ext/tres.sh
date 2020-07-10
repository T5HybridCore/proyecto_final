ocupacion=$(df -H | grep /dev/vda1 | expand | tr -s " " | cut -d " " -f5 | cut -d "%" -f1)
if [ $ocupacion -ge 7 ];
then
	echo "\e[96m$(figlet Alerta!)\e[0m"
	echo "Cuidado /dev/vda1 al" $ocupacion"% de ocupacion" | sudo wall
fi

read -p "esd" -n1 -s