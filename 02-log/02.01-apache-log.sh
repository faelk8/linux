#!/bin/bash

# caminho do log
cd ~/Documentos/github/linux/02-log

# regex para verificar o ip
regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

# verificar a informação do usuário
if [[ $1 =~ $regex ]]; then
    grep "$1" apache.log
    # se não encontrar
    if [ $? -ne 0 ]; then
        echo "Endereço não encontrado"
    fi
else
    echo "Formato inválido"
fi
