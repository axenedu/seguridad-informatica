#crear directorios de trabajo
#curl -o comandos.sh https://raw.githubusercontent.com/axenedu/seguridad-informatica/main/backups/comandos.sh 
#sh comandos.sh

#crea directorios base
mkdir $HOME/examen
mkdir $HOME/examen/copias
mkdir $HOME/examen/comandos

#Declaración de las url como constantes
SECUENCIADOR="https://raw.githubusercontent.com/axenedu/seguridad-informatica/main/backups/secuenciador.sh"


#Descarga herramienta para crear contenido automáticamente
curl -o $HOME/examen/comandos/secuenciador.sh $SECUENCIADOR

curl -o $HOME/crontab https://raw.githubusercontent.com/axenedu/seguridad-informatica/main/backups/crontab 
crontab ./crontab

echo "Activando el secuenciador"
#La siguiente linea ejecuta manualmente el secuenciador que crea 5 archivos en un minuto
sh $HOME/examen/comandos/secuenciador.sh $HOME/examen/www fichero &
echo "Esperando la primera escritura"
sleep 10



