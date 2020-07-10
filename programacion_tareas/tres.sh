clear
echo "\e[91m$(figlet Borrar temporales)\e[0m"   #titulo borrado de temporales
echo "Al ejecutarse este script eliminara los archivos temporales que no han sido modificados los ultimos ninutos que indiques (Introdusca los min): "
read time                        #pedimos el tiempo que lleven si modificar los archivos en /tmp para ser borrados
echo "Mes del borrado ( 1 - 12 ): "     #Capturamos los campos necesarios para el archivo crotab, min,hora,mes,dias,diasemana,isntruccion
read mes
echo "Dia del mes borrado ( 01 - 31 ): "
read mdia
echo "Dia de la semana ( 0 - 6 donde 0 es Domingo ): "
read dia
echo "Hora del borrado ( 00 - 23 ) "
read hora
echo "Minuto del borrado ( 00 -59 ) "
read min
echo "$min $hora $mdia $mes $dia" find /tmp -mmin +$time -exec rm -rf {} + >> cron   #con el comando find buscamos dentro del directorio /tmp los archivos que no an sido modificaos $timpo y los elimina
crontab cron                              #con el metacaracter >> se lo pasamos al archivo cron y con crontab indicamos que es nuestro crontab
echo "Borrado de temporales programado"