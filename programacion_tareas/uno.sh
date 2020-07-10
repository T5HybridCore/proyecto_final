clear
echo "\e[36m$(figlet Programacion de Tareas)\e[0m"	#Titulo del proyecto de color con figlet
echo "Introduce el comando a ejecutar: "
read script
echo "Mes ( 1 - 2 ): "				#capturamos los 6 parametros para el archivo crontab min,hora,dia,mes,dsemana,instruccion	
read mes
echo "Dia del mes ( 1 - 31 ): "
read dmes
echo "Dia de la semana ( 0 - 6, 0 es Domingo): "
echo dia
echo "Hora ( 00 - 23 ): "
read hora
echo "Minuto ( 00 - 59 ): "
read min
echo "$min $hora $dmes $mes $dia $script" >> cron    #con un metacaracter pasamos la nueva tarea al archivo cron
crontab cron						#indicamos que el archivo cron es nuestro crontab