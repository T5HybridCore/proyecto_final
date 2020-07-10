#!/bin/bash

# Menu Mantenimiento
while :
do
	clear
	PS3=""$'\n'"==============================================================="$'\n\n'"Opción [1-3]: "
	echo "=================== Tareas de Mantenimiento ==================="
	echo ""
	select opcion in "Modo de Arranque de Sistema" "Volumenes" "Regresar"
	do
		case $REPLY in
			1)
				chmod +x mantenimiento/arranque.sh
				mantenimiento/arranque.sh
				break
				;;
			2)
				chmod +x mantenimiento/volumenes.sh
				mantenimiento/volumenes.sh
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
