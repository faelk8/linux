#!/bin/bash

diretorio="~/imagens-novos-livros/png"

# Usando find para encontrar todos os arquivos .png dentro do diretório e subdiretórios
find "$diretorio" -type f -name "*.png" | while read -r arquivo; do
    echo "Removendo: $arquivo"
    rm "$arquivo"
done

echo "Todos os arquivos .png foram removidos."


