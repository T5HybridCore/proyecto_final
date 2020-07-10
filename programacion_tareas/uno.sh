clear
echo "\e[36m$(figlet Programacion de Tareas)\e[0m"
echo "Introduce el comando a ejecutar: "
read script
echo "Mes ( 1 - 12 ): "
read mes
echo "Dia del mes ( 1 - 31 ): "
read dmes
echo "Dia de la semana ( 0 - 6, 0 es Domingo): "
read dia
echo "Hora ( 00 - 23 ): "
read hora
echo "Minuto ( 00 - 59 ): "
read min
echo "$min $hora $dmes $mes $dia $script" >> cron
crontab cron
