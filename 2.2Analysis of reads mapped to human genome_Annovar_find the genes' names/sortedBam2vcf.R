library(stringr)

files = dir("./sortedBam")
ref = "./sortedBam/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna"

for(file in files[str_detect(files, "sorted.bam")]){
  input  = paste0(c("./sortedBam/", file), collapse = "")
  output = paste0(c("./sorted2vcf/", str_replace(file, "\\.bam", "\\.raw\\.vcf")), 
                  collapse = "")
  cat(sprintf("samtools mpileup -uf %s %s | bcftools call -mv > %s \n", ref, input, output))

  system(sprintf("samtools mpileup -uf %s %s | bcftools call -mv > %s \n", ref, input, output))

  filter_output = paste0(c("./sorted2vcf/", str_replace(file, "\\.bam", "\\.raw\\.flt\\.vcf")),
                  collapse = "")

  cat(sprintf("bcftools filter -s LowQual -e '%%QUAL<20 || DP>100' %s  > %s \n",output, filter_output))
  system(sprintf("bcftools filter -s LowQual -e '%%QUAL<20 || DP>100' %s  > %s \n",output, filter_output))
}

