prinseq-lite -verbose -fastq ../sra_data.fastq -out_good sra_data_filtered_Q20_30 -out_bad bad -trim_qual_right 20 -trim_qual_window 5 -trim_qual_step 1 -trim_qual_type min -min_len 30 -out_format 3