#!/bin/bash

# Menu Volumenes (Chequeo Arranque)
while :
do
    clear
    # Obtiene todos los dispositivos en el sistema
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
                        # Si el dispositivo a checar al arranque es sda, crear el archivo
                        # forcefsck en raiz para forzar el chequeo
                        if [ $opdispositivo == "/dev/sda" ]; then
                            touch /forcefsck
                        else
                            # Caso contrario para cualquier otro dispositivo
                            # Habilita el chequeo en el(los) siguiente(s) reinicio(s)
                            # -c 1      es para las veces que se checara el sistema al inicio
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
                            # Obtiene todos los volumenes en el dispositivo
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
                                # Si el volumen a checar al arranque es sda1, crear el archivo
                                # forcefsck en raiz para forzar el chequeo
                                if [ $opvolumen == "/dev/sda1" ]; then
                                    touch /forcefsck
                                else
                                    # Caso contrario para cualquier otro volumen
                                    # Habilita el chequeo en el(los) siguiente(s) reinicio(s)
                                    # -c 1      es para las veces que se checara el sistema al inicio
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