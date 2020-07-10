clear
echo "Se respaldara el directorio de home "
echo "Presione cualquier tecla para continuar......"
read a
usuario=$(whoami)
carpeta="/home/${usuario}"
archivo="Respaldo_de_$(whoami)_$(date +'%d%m%y-%H%M')"
echo $archivo
tar -czvf "/home/respaldos/${archivo}.tar.gz" $carpeta
echo "termino el respaldo"
