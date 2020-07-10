#!/bin/bash

# Menu Tareas de Usuarios en Sesión
while :
do
	clear
	PS3=""$'\n'"=============================================================="$'\n\n'"Opción [1-5]: "
	echo "================ Tareas de Usuarios en Sesión ================"
	echo ""
	select opcion in "Monitoreo de inicios de sesión" "Respaldo de carpeta Home" "Historial de aplicaciones" "Tiempos de sesión" "Regresar"
	do
		case $REPLY in
			1)
				chmod +x tareas_usuarios/uno.sh
				tareas_usuarios/uno.sh
				break
				;;
			2)
				chmod +x tareas_usuarios/dos.sh
				tareas_usuarios/dos.sh
				break
				;;
            3)
				chmod +x tareas_usuarios/tres.sh
				tareas_usuarios/tres.sh
				break
				;;
            4)
				chmod +x tareas_usuarios/cuatro.sh
				tareas_usuarios/cuatro.sh
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