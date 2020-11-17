#!/bin/sh

# ejemplo de uso en crontab
# 4-59/4 * * * * sh $HOME/copiaDiferencial.sh $HOME/ $HOME/var/www/

FECHA=$(date +%Y-%m-%d_%H:%M:%S)
cp $1/total_ref $1/dif_ref
tar -czf $1/$FECHA"_diferencial.tar.gz" -g $1/dif_ref $2
cp $1/dif_ref $1/inc_ref

#copia base de datos si es necesaria

#rsync si es necesario

#Borrado de archivos si es necesario

