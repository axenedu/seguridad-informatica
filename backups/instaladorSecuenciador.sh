#!/bin/sh
  
#Para instalar copia y pega el siguiente código 
#También puedes descargar el archivo y ejecutarlo
#Ejecutar en el directorio $HOME de una máquina vagrant limpia
curl -o $HOME/secuenciador.sh https://raw.githubusercontent.com/axenedu/seguridad-informatica/main/backups/secuenciador.sh
curl -o $HOME/crontab https://raw.githubusercontent.com/axenedu/seguridad-informatica/main/backups/crontab 
crontab ./crontab

