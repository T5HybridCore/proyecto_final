resp=1
while [ $resp == 1 ];do #ciclo hasta que la respuesta sea si
echo -e "Ingrese nombre de usuario: "
read nombre
echo -e "Ingrese el grupo del usuario: "
read grupo
groupadd $grupo
useradd -g $grupo -m $nombre #agrega un usuario con el nombre y grupo anteriormente leidos
passwd $nombre #configura la contraseña
echo " ¿Desea añadir otro usuario? (1) Sí (otro) No "
read resp #lee respuesta
done
exit 0
