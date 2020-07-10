clear
echo "\e[91m$(figlet Borrado de usuarios inactivos)\e[0m"         #Titulo borrar usuarios inactivos 
echo "Campos tiempo: dias, semanas, meses (omitir con 0 o enter)"
echo "Dame los dias: "				
read dias			#Leemos los dias para listar a los usuarios que no se han logeado en ese tiempo
echo "Dame las semanas: "
read sem
echo "dame los meses: "
read mes
tot=0
sem=$((sem*7))
sem=$((mes*30))
tot=$(($dias+$sem+$mes))  #hacemos la convercion de semanas y meses a dias
echo "Eliminar usuarios que no an iniciado en: "$tot" dias"
lastlog -b $tot > dat			#en el archivo dat guardamos la salida del comando lastlog, que con el modificador -b lista solo los que no se an logeado desde esos dias
cut -d " " -f 1 dat > dat2    #hacemos un cut al archivo dat, indicando el separador de campos, y que solo nos interesa la primera fila la salida se guarda en cut2
rm dat
cont=0
for line in $(cat dat2);
do
if [ $cont -ge 41 ];    #esto se hace para no borrar a los usuarios que ya estan en el sistema por defecto, root, ect.
then
echo $line >> dat   #con esto creamos una lista con los usuarios a ser borrados 
fi
cont=$((cont+1))
done
cat dat			#muestra la lista final de los usuarios a eliminar
echo "Desea continuar s/n: "   
read op
if [ $op = s ];      # un if en caso de no querer borrarlos usuarios mostrados
then 
	for l in $(cat dat);
	do
	sudo userdel -r $1    #con userdel -r borramos el usuario y su directorio en /home
	done
	echo "Usuarios borrados"
else
	echo "canselado"
fi