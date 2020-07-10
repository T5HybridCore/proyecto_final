clear
echo "\e[92m$(figlet Inhabiltar usuarios)\e[0m"  #inhabilitar usuarios por cierto tiempo
echo "Ingresa el usuario a deshabilitar"
read usr					#introducimos el usuario a ihnabilitar	
echo "cuanto tiempo desde inhabilitarlo?"     #leemos el tiempo, minutos, horas,dias, semanas
echo "Minutos: "
read min
echo "Horas: "
read hora
echo "Dias: "
read dia
echo "Semanas: "
read sem
sudo usermod -L $usr	#con usermod -L bloqueamos el inicio de sesion del usuario para que ya no peuda logearse
tot=0
hora=$((hora*60))
dia=$((dia*1440))
sem=$((sem*10080))
tot=$(($min+$hora+$dia))    #hacemos la convercion a minutos 
echo "El usuario ah sido bloqueado por: " $tot " minutos"    
echo "sudo usermod -U $usr" | at now +$tot minutes	#Programamos nuestra tarea con el comando at, para que solo ocurra una vez
                                                       #le decimos que la ejecute apartir de ahora en $tot minutos introducidos por el usuario
						#con el comando echo y un pipe hacemos que la salida sea la entra del comando at
						#con el comando usermod y modificador -u habilitamos denuevo el usuario