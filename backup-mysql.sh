#!/bin/bash

####
# Criado por: Cleiton Marques 18.06.2020
# Objetivo: Fazer backup dos bancos mysql 
###

### Constants
path=$"/mnt/storage_nyc_1/dokku-mysql-backups/"
clear

while [ "$1" != "" ]; do
    db=$1

    echo "Iniciando backup do app "$db "$(date +"%T")"
    echo "---"

    date=$(date '+%Y-%m-%d')
    cmd=$"dokku mysql:export $db > $path$db-$date.dump"

    echo $cmd
    eval $cmd
    shift
done