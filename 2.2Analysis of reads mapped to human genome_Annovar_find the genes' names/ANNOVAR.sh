#!/bin/bash

module load bowtie2/2.2.6
module load samtools/1.2
echo "module load success"
path=/nethome/cxw496/local/test/example1

###prepare vcf file
samtools mpileup -uf GCA_000001405.15_GRCh38_no_alt_analysis_set.fna  51GHLH1.sorted.bam | bcftools call -mv >  51GHLH1.raw.vcf
bcftools filter -s LowQual -e '%QUAL<20 || DP>100'  51GHLH1.raw.vcf  >  51GHLH1.raw.flt.vcf

### Annovar annotation
perl annotate_variation.pl -geneanno  -vcfinput  51GHLH1.raw.flt.vcf   -neargene 1000 humandb/  -buildver hg38 
perl table_annovar.pl  -vcfinput 51GHLH1.raw.flt.vcf  -neargene 1000  humandb/  -buildver hg38 -out VCFinput/ 














