#crear directorios de trabajo
#curl -o comandos.sh https://raw.githubusercontent.com/axenedu/scripts/main/examen_backups/plantilla/comandos.sh?token=AAIJOOQUNDXU2XPKEXTYXGS7XWGDW 
#sh comandos.sh

#crea directorios base
mkdir $HOME/examen
mkdir $HOME/examen/copias
mkdir $HOME/examen/comandos

#Declaración de las url como constantes
SECUENCIADOR="https://raw.githubusercontent.com/axenedu/scripts/main/examen_backups/solucion/secuenciador.sh?token=AAIJOOUL2EL2ZYA5ZJHC7TS7XWD5A"


#Descarga herramienta para crear contenido automáticamente
curl -o $HOME/examen/comandos/secuenciador.sh $SECUENCIADOR

echo "Activando el secuenciador"
#La siguiente linea ejecuta manualmente el secuenciador que crea 5 archivos en un minuto
sh $HOME/examen/comandos/secuenciador.sh $HOME/examen/www fichero &
echo "Esperando la primera escritura"
sleep 10

#sh $HOME/examen/comandos/secuenciador.sh $HOME/examen/www fichero

#sh $HOME/examen/comandos/copiaTotal.sh $HOME/examen/copias/ $HOME/examen/www/

#sh $HOME/examen/comandos/copiaIncremental.sh $HOME/examen/copias/ $HOME/examen/www/

#sh $HOME/examen/comandos/copiaDiferencial.sh $HOME/examen/copias/ $HOME/examen/www/

#rm -rf $HOME/examen



