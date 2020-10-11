#!/bin/bash

####
# Criado por: Cleiton Marques 06.09.2020
# Objetivo: Fazer backup dos bancos do dokku mysql
###

### Constants
path=$"/storage/dokku-mysql-backups/"

clear

dokku mysql:list | 
while read -r db
do
    if [ "$db" != "=====> MySQL services" ]; then
    	echo "Iniciando backup do app "$db "$(date +"%T")"
    	echo "---"

		date=$(date '+%Y-%m-%d')
		cmd=$"dokku mysql:export $db > $path$db-$date.dump"
        
	    echo $cmd
    	eval $cmd
    	shift
    fi
done