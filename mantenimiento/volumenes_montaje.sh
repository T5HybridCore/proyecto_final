#!/bin/bash

# Menu Volumenes (Montaje)
while :
do
    clear
    dispositivos=( $(lsblk -dp | grep -o '^/dev/sd[^ ]*') )
	PS3=""$'\n'"========================================================="$'\n\n'"Opción [1-$((${#dispositivos[@]} + 1))]: "
	echo "======================== Montaje ========================"
	echo ""
    echo "Seleccione un dispositivo de la lista"
    echo ""
    select opdispositivo in "${dispositivos[@]}" "Regresar"
    do
        # Regresar
        if [ $REPLY -eq $((${#dispositivos[@]} + 1)) ]
        then
            break 2
        fi

        # Cualquier otra opción no válida
        if [ -z "$opdispositivo" ]
        then
            break
        fi
        
        # Opción válida
        while :
        do
            clear
            volumenes=( $(fdisk -l $opdispositivo | grep '^/dev' | cut -d' ' -f1) )
            PS3=""$'\n'"========================================================="$'\n\n'"Opción [1-$((${#volumenes[@]} + 1))]: "
            echo "======================== Montaje ========================"
            echo ""
            echo "Seleccione un volumen de la lista"
            echo ""
            volumenes=( $(fdisk -l $opdispositivo | grep '^/dev' | cut -d' ' -f1) )
            select opvolumen in "${volumenes[@]}" "Regresar"
            do
                # Regresar
                if [ $REPLY -eq $((${#volumenes[@]} + 1)) ]
                then
                    break 3
                fi

                # Cualquier otra opción no válida
                if [ -z "$opvolumen" ]
                then
                    break 1
                fi

                # Opción válida
                clear
                PS3=""$'\n'"========================================================="$'\n\n'"Opción [1-3]: "
                echo "======================== Montaje ========================"
                echo ""
                echo "Información del volumen"
                echo ""
                parted $opvolumen unit MB print
                echo ""
                montaje=""
                echo -n "Seleccione el directorio de montaje (e.g. /mnt/hdd): "
                read montaje
                echo ""
                mkdir -p $montaje
                echo "Se creo el directorio '$montaje'"
                mount $opvolumen $montaje
                echo "Se monto el volumen en el directorio '$montaje'"
                echo ""
                read -p "Presione una tecla para continuar..." -n1 -s
                break 3
            done
        done
    done
done