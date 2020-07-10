#!/bin/bash

# Menu Volumenes (Chequeo Arranque)
while :
do
    clear
    dispositivos=( $(lsblk -dp | grep -o '^/dev/sd[^ ]*') )
	PS3=""$'\n'"=========================================================="$'\n\n'"Opción [1-$((${#dispositivos[@]} + 1))]: "
	echo "=================== Chequeo (Arranque) ==================="
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
        while :
        do
            clear
            PS3=""$'\n'"=========================================================="$'\n\n'"Opción [1-3]: "
            echo "=================== Chequeo (Arranque) ==================="
            echo ""
            echo "Elija una opción"
            echo ""
            select opchecar in "Habilitar chequeo de arranque para ($opdispositivo)" "Habilitar chequeo de arranque para un volumen en ($opdispositivo)" "Regresar"
            do
                case $REPLY in
                    1)
                        clear
                        if [ $opdispositivo == "/dev/sda" ]; then
                            touch /forcefsck
                        else
                            tune2fs -c 1 $opdispositivo
                        fi
                        echo "El dispositivo '$opdispositivo' se checará en el siguiente arranque del sistema"
                        echo ""
                        read -p "Presione una tecla para continuar..." -n1 -s
                        break 3
                        ;;
                    2)
                        while :
                        do
                            clear
                            volumenes=( $(fdisk -l $opdispositivo | grep '^/dev' | cut -d' ' -f1) )
                            PS3=""$'\n'"=========================================================="$'\n\n'"Opción [1-$((${#volumenes[@]} + 1))]: "
                            echo "=================== Chequeo (Arranque) ==================="
                            echo ""
                            echo "Seleccione un volumen de la lista"
                            echo ""
                            select opvolumen in "${volumenes[@]}" "Regresar"
                            do
                                # Regresar
                                if [ $REPLY -eq $((${#volumenes[@]} + 1)) ]
                                then
                                    break 3
                                fi

                                # Cualquier otra opción no valida
                                if [ -z "$opvolumen" ]
                                then
                                    break 1
                                fi

                                # Opción valida
                                clear
                                if [ $opvolumen == "/dev/sda1" ]; then
                                    touch /forcefsck
                                else
                                    tune2fs -c 1 $opvolumen
                                fi
                                echo "El volumen '$opvolumen' se checará en el siguiente arranque del sistema"
                                echo ""
                                read -p "Presione una tecla para continuar..." -n1 -s
                                break 5
                            done
                        done
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
            done
        done
    done
done