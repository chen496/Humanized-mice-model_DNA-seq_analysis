


# 实现每个组里面的基因的统计
# 将output24中的excel表读进来，分别统计每个组，结果输出到output25
# 
library(xlsx)
library(wordcloud2)
library(dplyr)
library(openxlsx)
library(rJava)
library(stringr)
library(hash)

Data<- read.xlsx("E:/Data/excelwordcount/2/input23/51GHLH.xlsx",sheet=1)

Data$Word

length(Data$Word)



x<-vector(mode="numeric",length=0)
y<-vector(mode="numeric",length=0)
# for(i in 1:100)
# {
#   x[i]<-i
# }




# 首先读取output24里面的文件
path <- 'E:/Data/excelwordcount/2/input23/singlefile/'
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
m<-character()

for ( i in 1:length(dir)) {
  
  x<-vector(mode="numeric",length=length(Data$Word))
  # for(i in 1:length=length(Data$Word)){
  #   x[i]<-0
  # }
    
  

  
  gene<-vector(mode="character",length=length(Data$Word))
  num<-vector()
  
  file.name[i]<-  paste0(path,dir[i])
  
  alin<- read.csv(file.name[i])
  file.name[i]
  
   gene<-Data$Word
   num<-Data$freq
  # 
   #h<- list(gene=Data$Word,num=Data$freq)
  # 
  # h$gene[1]
  
  
   h<-hash(keys=Data$Word,values=x)
  # h
  # as.lish(h)
  # h1<-hash(keys=alin$Word,values=alin$freq)
 
 for(i in 1:length(alin$Word)){
     
    #v<-values()$alh1in$Word[i]
     t<-as.character(alin$Word[i])
     
      m1<-h[t]
      h[[t]]<-alin$freq[i]
     # #C19orf81
     # h[[t]]<-alin$freq[i]
    
     
   }
  
  
}














