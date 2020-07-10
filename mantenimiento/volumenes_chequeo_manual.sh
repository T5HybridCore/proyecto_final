#!/bin/bash

# Menu Volumenes (Chequeo Manual)
while :
do
    clear
    # Obtiene todos los dispositivos en el sistema
    dispositivos=( $(lsblk -dp | grep -o '^/dev/sd[^ ]*') )
	PS3=""$'\n'"=========================================================="$'\n\n'"Opción [1-$((${#dispositivos[@]} + 1))]: "
	echo "==================== Chequeo (Manual) ===================="
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
            echo "==================== Chequeo (Manual) ===================="
            echo ""
            echo "Elija una opción"
            echo ""
            select opchecar in "Checar ($opdispositivo)" "Checar un volumen en ($opdispositivo)" "Regresar"
            do
                case $REPLY in
                    1)
                        clear
                        echo "Se procederá a checar '$opdispositivo'"
                        echo ""
                        fsck $opdispositivo # Checa el dispositivo indicado y se guarda el resultado de ejecución en la siguiente variable
                        resultado=$?
                        echo ""
                        echo -n "Resultado: [$resultado] "
                        # Muestra el mensaje de error y algunas recomendaciones a seguir
                        case $resultado in
                            0)
                                echo "No hay errores en el sistema de archivos"
                                ;;
                            1)
                                echo "Los errores en el sistema de archivos se corrigieron"
                                ;;
                            2)
                                echo "El sistema debe reiniciarse"
                                ;;
                            4)
                                echo "Los errores no se corrigieron"
                                ;;
                            8)
                                echo "Error de operación"
                                echo ""
                                echo "NOTA: Probablemente este intentando checar el dispositivo raíz (/),"
                                echo "intente usando la opción 1) Chequeo (Arranque) en el menu de volumenes"
                                ;;
                            16)
                                echo "Error de uso o de sintaxis"
                                ;;
                            32)
                                echo "El usuario cancelo el chequeo"
                                ;;
                            128)
                                echo "Error en Shared-library"
                                ;;
                            *)
                                echo "Unknown Error"
                                ;;
                        esac
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
                            echo "==================== Chequeo (Manual) ===================="
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

                                # Cualquier otra opción no valida
                                if [ -z "$opvolumen" ]
                                then
                                    break 1
                                fi

                                # Opción valida
                                clear
                                echo "Se procederá a checar '$opvolumen'"
                                echo ""
                                fsck $opvolumen
                                resultado=$?
                                echo ""
                                echo -n "Resultado: [$resultado] "
                                case $resultado in
                                    0)
                                        echo "No hay errores en el sistema de archivos"
                                        ;;
                                    1)
                                        echo "Los errores en el sistema de archivos se corrigieron"
                                        ;;
                                    2)
                                        echo "El sistema debe reiniciarse"
                                        ;;
                                    4)
                                        echo "Los errores no se corrigieron"
                                        ;;
                                    8)
                                        echo "Error de operación"
                                        echo ""
                                        echo "NOTA: Probablemente este intentando checar el volumen raíz (/),"
                                        echo "intente usando la opción 1) Chequeo (Arranque) en el menu de volumenes"
                                        ;;
                                    16)
                                        echo "Error de uso o de sintaxis"
                                        ;;
                                    32)
                                        echo "El usuario cancelo el chequeo"
                                        ;;
                                    128)
                                        echo "Error en Shared-library"
                                        ;;
                                    *)
                                        echo "Unknown Error"
                                        ;;
                                esac
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