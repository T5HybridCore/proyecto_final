clear
echo "\e[92m$(figlet Inhabiltar usuarios)\e[0m"
echo "Ingresa el usuario a deshabilitar"
read usr
echo "cuanto tiempo desde inhabilitarlo?"
echo "Minutos: "
read min
echo "Horas: "
read hora
echo "Dias: "
read dia
echo "Semanas: "
read sem
sudo usermod -L $usr
tot=0
hora=$((hora*60))
dia=$((dia*1440))
sem=$((sem*10080))
tot=$(($min+$hora+$dia))
echo "El usuario ah sido bloqueado por: " $tot " minutos"
echo "sudo usermod -U $usr" | at now +$tot minutes
