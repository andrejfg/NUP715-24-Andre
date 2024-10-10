#!/bin/bash

# Verifica se o input e output foram passados como argumentos
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <input.fastq>"
    exit 1
fi

# Inicializa variáveis com valores padrão
trim_qual_right=20
trim_qual_window=5
trim_qual_step=1
trim_qual_type=min
min_len=30
out_format=3
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

filtered_dir_name="filtered_reads"
out_good="./$filtered_dir_name/$(basename "${1%.*}")_filtered_Q${trim_qual_right}_${min_len}"
out_bad="./$filtered_dir_name/bad"

mkdir -p ./$filtered_dir_name

prinseq-lite -verbose -fastq "$1" \
    -out_good "$out_good" \
    -out_bad "$out_bad" \
    -trim_qual_right "$trim_qual_right" \
    -trim_qual_window "$trim_qual_window" \
    -trim_qual_step "$trim_qual_step" \
    -trim_qual_type "$trim_qual_type" \
    -min_len "$min_len" \
    -out_format "$out_format"
