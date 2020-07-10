clear
echo "\e[94m$(figlet Configurar permisos)\e[0m"   #Tiutulo de nuestro configurador de permisos
echo "dame el directorio "
read dir				#Leemos el archovo al cual modificar los permisos

op=0
while [ $op -ne 6 ]; do      #while del menu principal
clear
	echo "1) Permisos del propietario"
	echo "2) Permisos del grupo"
	echo "3) Permisos para otro"
	echo "4) Sbit"
	echo "5) Tbir"
	echo "6) salir"
	read op
	clear

	case "$op" in         #case del permisos propietario
	1) op2=0			
	   
  	   while [ $op2 -ne 4 ]; do   #while de submenu para los permisos del propietario
	   clear
  	   ls -l $dir > a2		#mostramos los permisos del directorio introducido y los guardamos en un archivo a2
  	   if [ $(cut -b 2 a2) = - ];	#con el cut indicamos que solo queremos ver el bit 2 de la primer linea de a2
	   then
  	 	echo "1)Lectura [Desactivado]"		#esto se hace para mostrar si esta activo o inactivo el permiso de lectura, escritura, ejecucion
           else 	
		echo "1)Lectura [Activado]"
  	   fi
  	   if [ $(cut -b 3 a2) = - ];    #mostrando el bit 3 de la salida del comando ls obtemenos el escritura para propietario
  	   then 
		echo "2)Escritura [Desactivado]"    #y asi para mostrar todos los permisos que tiene actualmente el archivo
  	   else
		echo "2)Escritura [Activado]"
           fi
  	   if [ $(cut -b 4 a2) = - ];
  	   then 
		echo "3)Ejecucion [Desactivado]"
  	   else
		echo "3)Ejecucion [Activado]"
  	   fi
	   echo "4)Volver"
  	   read op2

	   case "$op2" in
           1)if [ $(cut -b 2 a2) = - ];
	     then
		sudo chmod u+r $dir        #Una vez seleccionada la opcion cambia el permiso
	     else
		sudo chmod u-r $dir
             fi;;
           2)if [ $(cut -b 3 a2) = - ];
	     then 
		sudo chmod u+w $dir
	     else
		sudo chmod u-w $dir
	     fi;;
           3)if [ $(cut -b 4 a2) = - ];
	     then
		sudo chmod u+x $dir
	     else
		sudo chmod u-x $dir
	     fi;;
         esac
  	 done;;



    2) op2=0
  	   while [ $op2 -ne 4 ]; do
	   clear
  	   ls -l $dir > a2
  	   if [ $(cut -b 5 a2) = - ];
	   then
  	 	echo "1)Lectura [Desactivado]"
           else 	
		echo "1)Lectura [Activado]"
  	   fi
  	   if [ $(cut -b 6 a2) = - ];
  	   then 
		echo "2)Escritura [Desactivado]"
  	   else
		echo "2)Escritura [Activado]"
           fi
  	   if [ $(cut -b 7 a2) = - ];
  	   then 
		echo "3)Ejecucion [Desactivado]"
  	   else
		echo "3)Ejecucion [Activado]"
  	   fi
	   echo "4)Volver"
  	   read op2

	   case "$op2" in
           1)if [ $(cut -b 5 a2) = - ];
	     then
		sudo chmod g+r $dir
	     else
		sudo chmod g-r $dir
             fi;;
           2)if [ $(cut -b 6 a2) = - ];
	     then 
		sudo chmod g+w $dir
	     else
		sudo chmod g-w $dir
	     fi;;
           3)if [ $(cut -b 7 a2) = - ];
	     then
		sudo chmod g+x $dir
	     else
		sudo chmod g-x $dir
	     fi;;
         esac
  	 done;;
    
        

    3) op2=0
  	   while [ $op2 -ne 4 ]; do
	   clear
  	   ls -l $dir > a2
  	   if [ $(cut -b 8 a2) = - ];
	   then
  	 	echo "1)Lectura [Desactivado]"
           else 	
		echo "1)Lectura [Activado]"
  	   fi
  	   if [ $(cut -b 9 a2) = - ];
  	   then 
		echo "2)Escritura [Desactivado]"
  	   else
		echo "2)Escritura [Activado]"
           fi
  	   if [ $(cut -b 10 a2) = - ];
  	   then 
		echo "3)Ejecucion [Desactivado]"
  	   else
		echo "3)Ejecucion [Activado]"
  	   fi
	   echo "4)Volver"
  	   read op2

	   case "$op2" in
           1)if [ $(cut -b 8 a2) = - ];
	     then
		sudo chmod o+r $dir
	     else
		sudo chmod o-r $dir
             fi;;
           2)if [ $(cut -b 9 a2) = - ];
	     then 
		sudo chmod o+w $dir
	     else
		sudo chmod o-w $dir
	     fi;;
           3)if [ $(cut -b 10 a2) = - ];
	     then
		sudo chmod o+x $dir
	     else
		sudo chmod o-x $dir
	     fi;;
         esac
  	 done;;


	4)clear
	 echo "Sbit ingrese a-activar/d-desactivar"   #opciones para el sbit
	 read tb
	 if [ $tb = a ];          #Lee la respuesta y lo activa 
	 then 
	 chmod u+s $dir         #chmod u+s para activar el sbit o g+s para el grupo
	 echo "Sbit activado"
	 else
	 chmod u-s $dir           #con u-s para seactivarlo
	 echo "Sbit desactivado"
	 fi;;

	5)clear
	 echo "Tbit ingrese a-actibar/d-desactivar"  #opciones para el tbit
	read sb
	if [ $sb = a ];
	then
	chmod o+t $dir         #o+t para activarlo
	echo "Tbit activado"
	else 
	chmod o-t $dir			#o-t para desactivarlos
	echo "Tbit desactivado"
	fi;;

	
esac #fin del case principal
done	#fin del menu
