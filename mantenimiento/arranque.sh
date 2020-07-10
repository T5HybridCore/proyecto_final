#!/bin/bash

# Menu Mantenimiento (Arranque)
while :
do
	clear
	PS3=""$'\n'"==============================================================="$'\n\n'"Opción [1-3]: "
	echo "================= Modo de Arranque de Sistema ================="
	echo ""
	select opcion in "Habilitar/Inhabilitar Modo Mantenimiento" "Modo Manual" "Regresar"
	do
		case $REPLY in
			1)
				# Menu Habilitar/Inhabilitar Modo Mantenimiento
				while :
				do
					# Obtener el estado de arranque del sistema
					estado=$(systemctl get-default)
					mant=false
					mantTexto="Habilitar"

					if [[ "$estado" = "rescue.target" ]]; then
						mant=true
						mantTexto="Inhabilitar"
					fi

					clear
					PS3=""$'\n'"================================================================"$'\n\n'"Opción [1-2]: "
					echo "=========== Habilitar/Inhabilitar Modo Mantenimiento ==========="
					echo ""
					echo -n " Estado Actual: "
					if [ "$mant" = true ]; then
						echo "Habilitado"
					else
						echo "Inhabilitado"
					fi
					echo ""
					select opcion in "$mantTexto" "Regresar"
					do
						case $REPLY in
							1)
								clear
								echo -n "Se "
								# Deshabilitar el modo de mantenimiento
								if [ "$mant" = true ]; then
									systemctl set-default graphical.target > /dev/null 2>&1
									echo -n "inhabilito"
								else
									# Habilitar el modo de mantenimiento
									systemctl set-default rescue.target > /dev/null 2>&1
									echo -n "habilito"
								fi
								echo " el modo de mantenimiento"
								echo ""

								if [ "$mant" = false ]; then
									echo "Se enviara un mensaje a los usuarios activos y se apagara el sistema en 60 segundos."
									read -p "Presione una tecla para continuar..." -n1 -s
									# Apaga el sistema en 1 min y envia un mensaje a los usuarios activos
									shutdown -r +1 "El administrador de sistema activo un mantenimiento. El sistema se reiniciará en 60 segundos."
								else
									read -p "Presione una tecla para continuar..." -n1 -s
								fi
								break
								;;
							2)
								break 2
								;;
							*)
								break
								;;
						esac
					done
				done
				break
				;;
			2)
				# Menu Modo Manual
				while :
				do
					clear
					modo=""
					PS3=""$'\n'"======================================================================"$'\n\n'"NOTA: Las siguientes opciones se aplican al instante. Sea cuidadoso."$'\n\n'"Opción [1-6]: "
					echo "============================ Modo Manual ============================="
					echo ""
					select opcion in "Apagar el Sistema" "Modo de Mantenimiento" "Multi-Usuario" "Multi-Usuario (Entorno Gráfico)" "Reiniciar" "Regresar"
					do
						# Asigna el valor correspondiente del modo de arranque de sistema a una variable
						# y usuarla posteriormente
						case $REPLY in
							1)
								modo="poweroff"
								break
								;;
							2)
								modo="rescue"
								break
								;;
							3)
								modo="multi-user"
								break
								;;
							4)
								modo="graphical"
								break
								;;
							5)
								modo="reboot"
								break
								;;
							6)
								break 2
								;;
							*)
								break
								;;
						esac
					done

					# Ejecutar el comando de reinicio del sistema
					clear
					read -p "Presione una tecla para continuar..." -n1 -s
					systemctl $modo > /dev/null 2>&1

				done
				break
				;;
			3)
				break 2
				;;
			*)
				break
				;;
		esac
	done
done
exit 0
