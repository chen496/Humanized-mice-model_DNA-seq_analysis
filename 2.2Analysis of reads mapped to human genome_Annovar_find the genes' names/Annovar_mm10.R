library(stringr)

files = dir("./avinput_mm10")
#ref = "./sortedBam/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna"

for(file in files[str_detect(files, ".input")]){
  input  = paste0(c("./avinput_mm10/", file), collapse = "")
  output = paste0(c("./avoutput_mm10/", str_replace(file, "\\.input", "\\.")), 
                  collapse = "")
  cat(sprintf("perl table_annovar.pl %s humandb/ -buildver mm10 -out %s -remove -protocol refGene -operation g -nastring . ",input, output))
  system(sprintf("perl table_annovar.pl %s humandb/ -buildver mm10 -out %s -remove -protocol refGene -operation g -nastring . ", input, output))

}


