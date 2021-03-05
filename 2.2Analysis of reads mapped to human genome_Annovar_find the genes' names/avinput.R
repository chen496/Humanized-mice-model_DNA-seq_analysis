library(stringr)

files = dir("./avinput")
#ref = "./sortedBam/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna"

for(file in files[str_detect(files, ".input")]){
  input  = paste0(c("./avinput/", file), collapse = "")
  output = paste0(c("./avoutput/", str_replace(file, "\\.input", "\\.")), 
                  collapse = "")
  cat(sprintf("perl table_annovar.pl %s humandb/ -buildver hg38 -out %s -remove -protocol refGene,cytoBand,genomicSuperDups -operation g,r,r -nastring . ",input, output))
  system(sprintf("perl table_annovar.pl %s humandb/ -buildver hg38 -out %s -remove -protocol refGene,cytoBand,genomicSuperDups  -operation g,r,r -nastring . ", input, output))
}


