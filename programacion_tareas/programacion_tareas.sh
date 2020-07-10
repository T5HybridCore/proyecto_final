#!/bin/bash

# Menu Programación de Tareas
while :
do
	clear
	PS3=""$'\n'"=============================================================="$'\n\n'"Opción [1-5]: "
	echo "=================== Programación de Tareas ==================="
	echo ""
	select opcion in "Programación de tareas (Manual)" "Respaldo programado" "Borrado de temporales programado" "Inhabilitación de usuarios" "Regresar"
	do
		case $REPLY in
			1)
				chmod +x programacion_tareas/uno.sh
				programacion_tareas/uno.sh
				break
				;;
			2)
				chmod +x programacion_tareas/dos.sh
				programacion_tareas/dos.sh
				break
				;;
            3)
				chmod +x programacion_tareas/tres.sh
				programacion_tareas/tres.sh
				break
				;;
            4)
				chmod +x programacion_tareas/cuatro.sh
				programacion_tareas/cuatro.sh
				break
				;;
			5)
				break 2
				;;
			*)
				break
				;;
		esac
	done
done
exit 0