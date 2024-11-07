#!/bin/bash

# Verifica se foi passado um argumento (nome do arquivo)
if [ -z "$1" ]; then
  echo "Uso: sam2bam <arquivo.sam>"
  exit 1
fi

# Nome do arquivo sem a extensão .sam
input_file="$1"
output_file="${input_file%.sam}.bam"

# Executa o comando samtools
samtools view -b -S "$input_file" > "$output_file"
