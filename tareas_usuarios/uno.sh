clear
echo "\e[95m$(figlet Inicios de sesion)\e[0m"
echo "Ingresa el usuario"
read usr
echo "Ultimo inicio: "
last -F $usr > dato
head -1 dato > datos
cont=1
for line in $(cat datos);
do 
if [ $cont -ge 4 ] && [ $cont -le 8 ]; then
in="${in} ${line}"
fi
cont=$((cont+1))
done
echo $in
cont=1
for line in $(cat datos);
do
if [ $cont -ge 9 ]; then
sa="${sa} ${line}"
fi
cont=$((cont+1))
done
echo "Salida: "
echo $sa
echo " "
echo "Desea ver el historial completo? s/n"
read r
if [ s = $r ];
then cut -d " " -f 29-44 dato
fi

