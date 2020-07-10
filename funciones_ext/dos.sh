clear
echo "\e[94m$(figlet Configurar permisos)\e[0m"
echo "dame el directorio "
read dir

op=0
while [ $op -ne 6 ]; do
clear
	echo "1) Permisos del propietario"
	echo "2) Permisos del grupo"
	echo "3) Permisos para otro"
	echo "4) Sbit"
	echo "5) Tbir"
	echo "6) salir"
	read op
	clear

	case "$op" in
	1) op2=0
	   
  	   while [ $op2 -ne 4 ]; do
	   clear
  	   ls -l $dir > a2
  	   if [ $(cut -b 2 a2) = "-" ];
	   then
  	 	echo "1)Lectura [Desactivado]"
           else 	
		echo "1)Lectura [Activado]"
  	   fi
  	   if [ $(cut -b 3 a2) = "-" ];
  	   then 
		echo "2)Escritura [Desactivado]"
  	   else
		echo "2)Escritura [Activado]"
           fi
  	   if [ $(cut -b 4 a2) = "-" ];
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
		sudo chmod u+r $dir
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
	 echo "Sbit ingrese a-activar/d-desactivar"
	 read tb
	 if [ $tb = a ];
	 then 
	 chmod u+s $dir
	 echo "Sbit activado"
	 else
	 chmod u-s $dir
	 echo "Sbit desactivado"
	 fi;;

	5)clear
	 echo "Tbit ingrese a-actibar/d-desactivar"
	read sb
	if [ $sb = a ];
	then
	chmod o+t $dir
	echo "Tbit activado"
	else 
	chmod o-t $dir
	echo "Tbit desactivado"
	fi;;

	
esac 
done	

