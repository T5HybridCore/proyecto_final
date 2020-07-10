clear
echo "\e[91m$(figlet Borrar temporales)\e[0m"
echo "Al ejecutarse este script eliminara los archivos temporales que no han sido modificados los ultimos ninutos que indiques (Introdusca los min): "
read time
echo "Mes del borrado ( 1 - 12 ): "
read mes
echo "Dia del mes borrado ( 01 - 31 ): "
read mdia
echo "Dia de la semana ( 0 - 6 donde 0 es Domingo ): "
read dia
echo "Hora del borrado ( 00 - 23 ) "
read hora
echo "Minuto del borrado ( 00 -59 ) "
read min
echo "$min $hora $mdia $mes $dia" find /tmp -mmin +$time -exec rm -rf {} + >> cron
crontab cron
echo "Borrado de temporales programado"
