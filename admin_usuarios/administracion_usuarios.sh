#!/bin/bash

# Menu Administración de Usuarios
while :
do
	clear
	PS3=""$'\n'"=============================================================="$'\n\n'"Opción [1-5]: "
	echo "================= Administración de Usuarios ================="
	echo ""
	select opcion in "Alta de usuarios (.txt)" "Alta de usuarios (Manual)"  "Cambio de contraseñas (.txt)" "Cambio de contraseñas (Manual)" "Regresar"
	do
		case $REPLY in
			1)
				chmod +x admin_usuarios/usertext.sh
				admin_usuarios/usertext.sh
				break
				;;
			2)
				chmod +x admin_usuarios/adduserman.sh
				admin_usuarios/adduserman.sh
				break
				;;
			3)
				chmod +x admin_usuarios/passtext.sh
				admin_usuarios/passtext.sh
				break
				;;
			4)
				chmod +x admin_usuarios/passman.sh
				admin_usuarios/passman.sh
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