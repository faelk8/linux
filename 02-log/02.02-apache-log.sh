#!/bin/bash

# caminho do log
cd ~/Documentos/github/linux/02-log

if [ -z "$1" ]; then
    while [ -z "$requisicao" ]; do
        read -p "Informe o parâmetro (GET, POST, PUT, DELETE): " requisicao
        # transforma em letra maiúscula
        letra_maiuscula=$(echo "$requisicao" | awk '{print toupper($1)}')
    done
else
    letra_maiuscula=$(echo "$1" | awk '{print toupper($1)}')
fi

case $letra_maiuscula in
    GET)
        grep "GET" apache.log
        ;;
    POST)
        grep "POST" apache.log
        ;;
    PUT)
        grep "PUT" apache.log
        ;;
    DELETE)
        grep "DELETE" apache.log
        ;;
    *)
        echo "Parâmetro inválido"
        ;;
esac
