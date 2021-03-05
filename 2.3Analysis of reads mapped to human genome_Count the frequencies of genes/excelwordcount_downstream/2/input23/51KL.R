


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

Data<- read.xlsx("E:/Data/excelwordcount/2/input23/Total/51KL.xlsx",sheet=1)

Data$Word

length(Data$Word)



x<-vector(mode="numeric",length=0)
y<-vector(mode="numeric",length=0)
# for(i in 1:100)
# {
#   x[i]<-i
# }




# 首先读取output24里面的文件
path <- 'E:/Data/excelwordcount/2/input23/51KL/'
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

x<-vector(mode="numeric",length=length(Data$Word))
h<-hash(keys=as.character(Data$Word),values=x)
for(s in 1:length(h)){
  h[Data$Word[s]]<-c(0,0,0,0,0,0,0,0)
}


for ( i in 1:length(dir)) {
  
  
  file.name[i]<-  paste0(path,dir[i])
  
  alin<- read.csv(file.name[i])

  
  for(n in 1:length(alin$txtChar)){
    
    
    t<-as.character(alin$txtChar[n])
    
    h[[t]][i]<-alin$Freq[n]
    
  }
  
  
}

hashdata<-as.list(h)

a<-as.data.frame(hashdata)
a<-t(a)
write.csv(a,file="E:/Data/excelwordcount/2/output23/51KL.csv")









