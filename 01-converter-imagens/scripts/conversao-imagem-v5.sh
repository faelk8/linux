#!/bin/bash

converte_imagem(){
CAMINHO_IMAGENS=~/imagens-livros

cd "$CAMINHO_IMAGENS"

if [ ! -d "png" ]; then
    mkdir "png"
fi

for imagem in *.jpg
do
    local imagem_sem_extensao=$(basename "$imagem" .jpg)
    convert "$imagem_sem_extensao.jpg" "png/$imagem_sem_extensao.png"
done
}

converte_imagem 2>erro_conversao.txt
if [ $? -eq 0 ]
then
    echo "Conversão realizada com sucesso"
else
    echo "Houve uma falha no processo"
fi
