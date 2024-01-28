#!/bin/bash

# se a pasta log não existir então crie
if [ ! -d "log" ]; then
    mkdir log
fi

processo_memoria() {
    # pega os 10 maiores processos retornando o id
    processos=$(ps -e -o pid --sort -size | head -n11 | grep -E '[0-9]')
    # loop para percorre cada processo
    for pid in $processos; do
        # pega o nome do processo passando o seu id
        nome_processo=$(ps -p $pid -o comm=)
        # pega a data e hora atual do sistema | -n para gravar na mesma linhas
        echo -n $(date "+%F,%H:%M:%S,") >> "log/$nome_processo.log" # salva 
        # pega o tamanho do processo
        tamanho_processo=$(ps -p $pid -o size | grep -E '[0-9]')
        # converte para mb e adiciona no arquivo
        echo "$(bc <<< "scale=2; $tamanho_processo / 1024") MB" >> "log/$nome_processo.log"
    done
}

processo_memoria
if [ $? -eq 0 ]; then
    # se tudo estiver correto 
    echo "Log salvo"
else
    # se deu falha
    echo "Falha ao salvar o log"
fi
