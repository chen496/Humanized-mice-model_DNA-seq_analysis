
library(stringr)
path <- 'E:/Data/excelwordcount/input2/'
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
for ( i in 1:length(dir)) {
  
  file.name[i]<-  paste0(path,dir[i])
  
  #filePath = "E:/Data/excelwordcount/foo.txt"
  outfile.name[i]<-paste0('E:/Data/excelwordcount/output2/',str_replace(dir[i], "\\.txt", "\\.csv"))
  text = readLines(file.name[i])
  txt = text[text!=""]
  #txt = tolower(txt)
  txtList = lapply(txt, strsplit," ")
  txtChar = unlist(txtList)
  txtChar = gsub("\\.|\\!|:|;|\\?","",txtChar) #clean symbol(.,!:;?)
  txtChar = txtChar[txtChar!=""]
  data = as.data.frame(table(txtChar))
  colnames(data) = c("Word","freq")
  ordFreq = data[order(data$freq,decreasing=T),]
  data
  write.csv(data,outfile.name[i])
  
}

outfile.name



