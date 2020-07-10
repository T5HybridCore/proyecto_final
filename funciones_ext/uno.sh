clear
echo "\e[91m$(figlet Borrado de usuarios inactivos)\e[0m"
echo "Campos tiempo: dias, semanas, meses"
echo "Dame los dias: "
read dias
echo "Dame las semanas: "
read sem
echo "dame los meses: "
read mes
tot=0
sem=$((sem*7))
sem=$((mes*30))
tot=$(($dias+$sem+$mes))
echo "Eliminar usuarios que no an iniciado en: "$tot" dias"
lastlog -b $tot > dat
cut -d " " -f 1 dat > dat2
rm dat
cont=0
for line in $(cat dat2);
do
if [ $cont -ge 30 ];
then
echo $line >> dat
fi
cont=$((cont+1))
done
cat dat
echo "Desea continuar s/n: "
read op
if [ $op = s ];
then 
	for i in $(cat dat);
	do
	sudo userdel -r $i	
	done
	echo "Usuarios borrados"
else
	echo "canselado"
fi
