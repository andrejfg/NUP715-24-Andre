#!/bin/bash

# Verifica se o input e output foram passados como argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <input.fastq> <output>"
    exit 1
fi

# Inicializa variáveis com valores padrão
trim_qual_right=20
trim_qual_window=5
trim_qual_step=1
trim_qual_type=min
min_len=30
out_format=3

# Lê o arquivo de configuração se existir
config_file="prinseq.config"
if [ -f "$config_file" ]; then
    while IFS='=' read -r key value; do
        case "$key" in
            trim_qual_right) trim_qual_right="$value" ;;
            trim_qual_window) trim_qual_window="$value" ;;
            trim_qual_step) trim_qual_step="$value" ;;
            trim_qual_type) trim_qual_type="$value" ;;
            min_len) min_len="$value" ;;
            out_format) out_format="$value" ;;
        esac
    done < "$config_file"
fi

mkdir -p ./filtered_reads

prinseq-lite -verbose -fastq "$1" \
    -out_good "./filtered_reads/$2" \
    -out_bad bad \
    -trim_qual_right "$trim_qual_right" \
    -trim_qual_window "$trim_qual_window" \
    -trim_qual_step "$trim_qual_step" \
    -trim_qual_type "$trim_qual_type" \
    -min_len "$min_len" \
    -out_format "$out_format"
