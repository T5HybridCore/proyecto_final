#!/bin/bash

# Menu Volumenes (Formateo)
while :
do
    clear
    dispositivos=( $(lsblk -dp | grep -o '^/dev/sd[^ ]*') )
	PS3=""$'\n'"=========================================================="$'\n\n'"Opción [1-$((${#dispositivos[@]} + 1))]: "
	echo "======================== Formateo ========================"
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
            PS3=""$'\n'"=========================================================="$'\n\n'"Opción [1-$((${#volumenes[@]} + 1))]: "
            echo "======================== Formateo ========================"
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
                while :
                do
                    clear
                    PS3=""$'\n'"=========================================================="$'\n\n'"Opción [1-3]: "
                    echo "======================== Formateo ========================"
                    echo ""
                    echo "Información del volumen"
                    echo ""
                    parted $opvolumen unit MB print
                    echo ""
                    echo "Seleccione un formato para el volumen"
                    echo ""
                    formato=""
                    select opformato in "EXT4" "NTFS" "Regresar"
                    do
                        case $REPLY in
							1)
                                formato="ext4"
                                ;;
                            2)
                                formato="ntfs"
                                ;;
                            3)
                                clear
                                break 3
                                ;;
                            *)
                                clear
                                break 1
                                ;;
                        esac

                        clear
                        echo "El volumen '$opvolumen' se formateará ($formato)"
                        echo ""
                        read -p "Presione una tecla para continuar..." -n1 -s
                        clear
                        wipefs -a $opvolumen
                        mkfs -t $formato $opvolumen
                        echo ""
                        echo "El volumen '$opvolumen' se formateo correctamente"
                        echo ""
                        read -p "Presione una tecla para continuar..." -n1 -s
                        break 5
                    done
                done
            done
        done
    done
done