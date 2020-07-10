#!/bin/bash

# Menu Administración de Usuarios
while :
do
	clear
	PS3=""$'\n'"=============================================================="$'\n\n'"Opción [1-3]: "
	echo "================= Administración de Usuarios ================="
	echo ""
	select opcion in "Alta de usuarios" "Cambio de contraseñas" "Regresar"
	do
		case $REPLY in
			1)
				chmod +x admin_usuarios/usertext.sh
				admin_usuarios/usertext.sh
				break
				;;
			2)
				chmod +x admin_usuarios/passtext.sh
				admin_usuarios/passtext.sh
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