#!/bin/sh
  
#Para instalar copia y pega el siguiente código 
#También puedes descargar el archivo y ejecutarlo
#Ejecutar en una máquina vagrant limpia
curl -o secuenciador.sh https://raw.githubusercontent.com/axenedu/seguridad-informatica/main/backups/secuenciador.sh
curl -o crontab https://raw.githubusercontent.com/axenedu/seguridad-informatica/main/backups/crontab 
crontab ./crontab

