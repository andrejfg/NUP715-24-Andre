bowtie2 --very-sensitive -x ../reference/S288C_reference_index_base \
        -U ../reads/script_test/filtered_reads/sra_data_filtered_Q30_30.fastq \
        -S sra_S288C_bowtie2.sam
