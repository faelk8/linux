#!/bin/bash

# variavel de ambiente
CAMINHO_IMAGENS=~/imagens-livros
# Para cada imagem
for imagem in $@
do
	convert $CAMINHO_IMAGENS/$imagem.jpg $CAMINHO_IMAGENS/$imagem.png
done
