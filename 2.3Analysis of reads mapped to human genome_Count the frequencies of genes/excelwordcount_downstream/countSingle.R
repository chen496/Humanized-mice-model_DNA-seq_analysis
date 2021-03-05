library(xlsx)
library(wordcloud2)
library(dplyr)
library(openxlsx)
library(rJava)
library(stringr)

path <- 'E:/Data/excelwordcount/input/'
dir.name <- dir(path)
doc.name <- list()
fre <- numeric()
for (i in 1:length(dir.name)) {
  doc.name[i]<- dir(paste(path,dir.name[i]))
  fre[i] <- length(doc.name[i])
}
dir <- rep(dir.name,fre)
doc.name <-unlist(doc.name)
file.name <- character()
outfile.name<-character()
outfile1.name<-character()
for ( i in 1:length(dir)){
  
  file.name[i]<-  paste0(path,dir[i])
  outfile.name[i]<-paste0('E:/Data/excelwordcount/output/',str_replace(dir[i], "\\.xlsx", "\\.txt"))
  alin<- read.xlsx(file.name[i],sheet=1,colNames = FALSE,rowNames = FALSE)
  # colnames(alin)<- c("Chr","Start","End","Ref","Alt",	"Func.refGene",
  #                    "Gene.refGene",	"GeneDetail.refGene",	"ExonicFunc.refGene",	"AAChange.refGene",	"cytoBand","genomicSuperDups","Reads", "Reads ID")
  n<- length(alin[7])
  n
  gene<- alin[7]
  
  write.table(gene, file = outfile.name[i], row.names = F, quote = F, col.names = F)
  

  #filePath = "E:/Data/excelwordcount/foo.txt"
  outfile1.name[i]<-paste0('E:/Data/excelwordcount/output1/',str_replace(dir[i], "\\.xlsx", "\\.csv"))
  text = readLines(outfile.name[i])
  txt = text[text!=""]
  #txt = tolower(txt)
  txtList = lapply(txt, strsplit," ")
  txtChar = unlist(txtList)
  txtChar = gsub("\\.|\\!|:|;|\\?","",txtChar) #clean symbol(.,!:;?)
  txtChar = txtChar[txtChar!=""]
  data = as.data.frame(table(txtChar))
  #colnames(data) = c("Word","freq")
  ordFreq = data[order(data$Freq,decreasing=T),]
  data
  write.csv(data,outfile1.name[i])

}