#!/bin/bash

CAMINHO_IMAGENS=~/imagens-livros

cd "$CAMINHO_IMAGENS"

if [ ! -d "png" ]; then
    mkdir "png"
fi

for imagem in *.jpg
do
    imagem_sem_extensao=$(basename "$imagem" .jpg)
    convert "$imagem_sem_extensao.jpg" "png/$imagem_sem_extensao.png"
done
