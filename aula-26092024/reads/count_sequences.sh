#!/bin/bash

# Verifica se um arquivo foi passado como argumento
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <arquivo.fastq>"
    exit 1
fi

# Conta o número de linhas e divide por 4
records=$(expr $(wc -l < "$1") / 4)

# Exibe o resultado
echo "$records"
