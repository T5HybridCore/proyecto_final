clear
echo "Se respaldara el directorio de home "          #respaldo de directorio home de usuarios al inicio de sesion
echo "Presione cualquier tecla para continuar......"
read a							#esto solo es para esperar confimacion
usuario=$(whoami)            
carpeta="/home/${usuario}"              #asigamos la ruta a respaldar, el directorio en home del usuario logeado
archivo="Respaldo_de_$(whoami)_$(date +'%d%m%y-%H%M')"     #le damos el nombre al archivo del respaldo
echo $archivo						
tar -czvf "/home/respaldos/${archivo}.tar.gz" $carpeta	#comprime el directorio con el comando tar y lo crea en /home/respaldos
echo "termino el respaldo"

			#Este script esta siendo ejecutado desde archivo profile en /etc