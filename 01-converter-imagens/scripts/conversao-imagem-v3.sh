#!/bin/bash

cd /home/rafael/deletar/imagens-livros
# Para cada imagem
for imagem in *.jpg
do
	convert $imagem $imagem.png
done
