clear
echo "\e[36m$(figlet Respaldar archivos)\e[0m"
echo "ingresa la ruta a respaldar: "
read arch
echo "Ingresa el directorio donde guardar el respaldo: "
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
archivo="respaldo-dia-$dia-mes-$mes-hora-$hora-min-$min"
echo "$min $hora $mdia $mes $dia" tar -cvzf $dir/"${archivo}.tar.gz" $arch >> cron
crontab cron
