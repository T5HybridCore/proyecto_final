#!/bin/bash

# Menu Funciones Extendidas
while :
do
	clear
	PS3=""$'\n'"=============================================================="$'\n\n'"Opción [1-4]: "
	echo "==================== Funciones Extendidas ===================="
	echo ""
	select opcion in "Borrado de usuarios inactivos" "Configurar permisos" "Espacio en almacenamiento" "Regresar"
	do
		case $REPLY in
			1)
				chmod +x funciones_ext/uno.sh
				funciones_ext/uno.sh
				break
				;;
			2)
				chmod +x funciones_ext/dos.sh
				funciones_ext/dos.sh
				break
				;;
            3)
				chmod +x funciones_ext/tres.sh
				funciones_ext/tres.sh
				break
				;;
			4)
				break 2
				;;
			*)
				break
				;;
		esac
	done
done
exit 0