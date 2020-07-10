clear
echo "\e[36m$(figlet Respaldar archivos)\e[0m"   #respaldo programados manualemnte
echo "ingresa la ruta a respaldar: "
read arch			#ingresamos la ruta a respaldar
echo "Ingresa el directorio donde guardar el respaldo: "    #Capura de datos para crontab hora,min,dia,mes,diasemana, instruccion
read dir
echo "Mes del respaldo ( 1 - 12 ): "
read mes
echo "Dia del mes respaldo ( 01 - 31 ): "
read mdia
echo "Dia de la semana ( 0 - 6 donde 0 es Domingo ): "
read dia
echo "Hora del respaldo ( 00 - 23 ) "
read hora
echo "Minuto del respaldo ( 00 -59 ) "
read min
archivo="respaldo-dia-$dia-mes-$mes-hora-$hora-min-$min"      #creamos el noombre del archivo con la fecha que indico el usuario
echo "$min $hora $mdia $mes $dia" tar -cvzf $dir/"${archivo}.tar.gz" $arch >> cron     #con tar comprimimos la ruta inidicada y con el metacaracter >> se lo pasamos al archivo cron
crontab cron		#el achivo cron es nuestro crontab