#!/bin/bash

# Menu Principal
while :
do
	clear
	PS3=""$'\n'"================================================================"$'\n\n'"Opción [1-6]: "
	echo "=================== Administrador de Sistema ==================="
	echo ""
	select opcion in "Administración de Usuarios" "Programación de Tareas" "Tareas de Mantenimiento" "Tareas de Usuarios en Sesión" "Funciones Extendidas" "Salir"
	do
		case $REPLY in
			1)
				chmod +x admin_usuarios/administracion_usuarios.sh
				admin_usuarios/administracion_usuarios.sh
				break
				;;
			2)
				chmod +x programacion_tareas/programacion_tareas.sh
				programacion_tareas/programacion_tareas.sh
				break
				;;
			3)
				chmod +x mantenimiento/mantenimiento.sh
				mantenimiento/mantenimiento.sh
				break
				;;
			4)
				chmod +x tareas_usuarios/tareas_usuarios.sh
				tareas_usuarios/tareas_usuarios.sh
				break
				;;
			5)
				chmod +x funciones_ext/funciones_ext.sh
				funciones_ext/funciones_ext.sh
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
