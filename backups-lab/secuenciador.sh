#!/bin/sh

#Este script se encarga de crear una estructura de directorios donde creará archivos cada 10 segundos
#sirve para generar información sobre la que prácticas la realización de copias de seguridad

DIR=$HOME
#Directorio en el que se creará el archivo si hay parámetro
[ $1 ] && DIR=$1

#Si el nombre del fichero se pasa como argumento
#se usa, si no, se pone uno por defecto
FILE="fichero"
[ $2 ] && FILE=$2

if [ ! -d $DIR ]; then
   mkdir -p $DIR
   #echo directorio $DIR creado
fi

sleep 10
for i in $(seq 1 5); do
   echo $(date "+%Y-%m-%d %H:%M:%S %N") >> $DIR/$FILE"_"$(date +%Y-%m-%d_%H-%M-)$((i*10))
   sleep 10
done;

