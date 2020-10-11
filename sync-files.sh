#!/bin/bash

####
# Criado por: Cleiton Marques 11.10.2020
# Objetivo: Sincronizar arquivos de diretórios
###

### Constants
path=$"/storage/dokku-site-files/"

dir=$1
remote_path=$2
local_path=$3

if [[ -z "$dir" || -z "$remote_path" || -z "$local_path" ]] 
then 
    echo "Erro: Todos os parametros são necessários"
    echo "$dir - $remote_path - $local_path"
else
    echo
    echo "------ $(date +"%T") ------"
    echo "Iniciando cópia do diretório \"$dir\""

    cmd=$"rsync -aP --ignore-existing $remote_path/$dir $local_path/"

    echo $cmd
    eval $cmd
    shift

    echo "------ $(date +"%T") ------" 
    echo
fi
