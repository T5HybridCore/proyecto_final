#!/bin/bash

# Menu Mantenimiento (Volumenes)
while :
do
	clear
	PS3=""$'\n'"========================================================="$'\n\n'"Opción [1-6]: "
	echo "======================= Volumenes ======================="
	echo ""
	select opcion in "Chequeo (Arranque)" "Chequeo (Manual)" "Creación" "Formato" "Montaje" "Regresar"
	do
		case $REPLY in
			1)
				chmod +x mantenimiento/volumenes_chequeo_arranque.sh
				mantenimiento/volumenes_chequeo_arranque.sh
				break
				;;
			2)
				chmod +x mantenimiento/volumenes_chequeo_manual.sh
				mantenimiento/volumenes_chequeo_manual.sh
				break
				;;
			3)
				chmod +x mantenimiento/volumenes_creacion.sh
				mantenimiento/volumenes_creacion.sh
				break
				;;
			4)
				chmod +x mantenimiento/volumenes_formateo.sh
				mantenimiento/volumenes_formateo.sh
				break
				;;
			5)
				chmod +x mantenimiento/volumenes_montaje.sh
				mantenimiento/volumenes_montaje.sh
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
done
exit 0
