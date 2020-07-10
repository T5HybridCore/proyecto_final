#!/bin/bash

# Menu Volumenes (Creación)
while :
do
    clear
    dispositivos=( $(lsblk -dp | grep -o '^/dev/sd[^ ]*') )
	PS3=""$'\n'"=========================================================="$'\n\n'"Opción [1-$((${#dispositivos[@]} + 1))]: "
	echo "======================== Creación ========================"
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

        # Cualquier otra opción no valida
        if [ -z "$opdispositivo" ]
        then
            break
        fi
        
        # Opción valida
        espacio=$(parted $opdispositivo unit KB print free | grep 'Free Space' | tail -n1 | awk '{print $3}')
        espacio=${espacio//"kB"/}

        clear
        echo "Información del dispositivo"
        echo ""
        parted $opdispositivo unit KB print free
        echo ""
        if [[ $espacio -lt 100000 ]]; then
            echo "Espacio en disco insuficiente. Se requieren 100 MB mínimo."
            echo ""
            read -p "Presione una tecla para continuar..." -n1 -s
            break 1
        else
            tam=0
            echo -n "Tamaño del nuevo volumen en KB (-1 para cancelar): "
            read tam

            if [ $tam -eq -1 ]; then
                clear
                break 1
            fi
            clear
            echo "Se creará un nuevo volumen de $tam kb"
            echo ""
            read -p "Presione una tecla para continuar..." -n1 -s

            parted -s $opdispositivo mklabel gpt
            parted $opdispositivo unit KB mkpart primary 0 $tam

            clear
            echo "Volumen creado con exito"
            echo ""
            read -p "Presione una tecla para continuar..." -n1 -s
            break 1
        fi
    done
done