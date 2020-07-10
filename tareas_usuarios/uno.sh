clear
echo "\e[95m$(figlet Inicios de sesion)\e[0m"      #titulo del script Monitorear los tiempos en sesion
echo "Ingresa el usuario"		         
read usr					   #Lee el usuario para monstrar su historial de incios de sesion
echo "Ultimo inicio: "		
last -F $usr > dato				  #Con el comando last mostramos las ultimas conexiones del usuario las guardamos en datos
head -1 dato > datos				 # sacamos la primera line del archivo dato con el comando head
cont=1
for line in $(cat datos);
do 
if [ $cont -ge 4 ] && [ $cont -le 8 ]; then      #esto es para obtener solo los campos que nos interezan que es el la fecha del ultimo inicio 
in="${in} ${line}"                           #concatenamos las cadenas
fi
cont=$((cont+1))
done
echo $in
cont=1
for line in $(cat datos);
do
if [ $cont -ge 9 ]; then                   #separamos los campos de la cadena para guardar solo la ultima salida
sa="${sa} ${line}"
fi
cont=$((cont+1))
done
echo "Salida: "
echo $sa
echo " "
echo "Desea ver el historial completo? s/n"    #opcion para ver todo el historial
read r
if [ s = $r ];
then cut -d " " -f 29-44 dato     #imprimios todo el arhcivo dato, que es la salida del comando last, pero iniciando el serparado de campos y los bits que queremos que imprima
fi
