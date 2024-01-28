#!/bin/bash

converte_imagem() {
    local caminho_imagem=$1
    local imagem_sem_extensao=$(basename "$caminho_imagem" .jpg)
    local imagem_png="$imagem_sem_extensao.png"
    if [ ! -e "$imagem_png" ]; then
        echo "Convertendo $caminho_imagem para $imagem_png"
        convert "$caminho_imagem" "$imagem_png"
    else
        echo "A conversão para $imagem_png já foi realizada."
    fi
}

varrer_diretorio() {
    cd "$1" || return
    for arquivo in *; do
        local caminho_arquivo="$1/$arquivo"
        if [ -d "$caminho_arquivo" ]; then
            echo "Entrando no diretório: $caminho_arquivo"
            varrer_diretorio "$caminho_arquivo"
        else
            echo "Convertendo arquivo: $caminho_arquivo"
            converte_imagem "$caminho_arquivo"
            if [ $? -eq 0 ]; then
                echo "Conversão do arquivo $caminho_arquivo realizada com sucesso"
            else
                echo "Houve um problema na conversão do arquivo $caminho_arquivo"
            fi
        fi
    done
}

CAMINHO_PNG="/home/rafael/deletar/imagens-novos-livros/png"

if [ ! -d "$CAMINHO_PNG" ]; then
    mkdir "$CAMINHO_PNG"
fi

cp -r ~/imagens-novos-livros/jpg/* ~/imagens-novos-livros/png

varrer_diretorio "~/imagens-novos-livros/png"
if [ $? -eq 0 ]; then
    echo "Conversão realizada com sucesso"
else
    echo "Houve um problema na conversão"
fi

# Usando find para encontrar todos os arquivos .png dentro do diretório e subdiretórios
find "$CAMINHO_PNG" -type f -name "*.jpg" | while read -r arquivo; do
    echo "Removendo: $arquivo"
    rm "$arquivo"
done

echo "Todos os arquivos .jpg foram removidos."

