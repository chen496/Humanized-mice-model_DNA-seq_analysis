#!/bin/sh  
#============ get the file name ===========# 


FolderPath="/nethome/cxw496/local/test/HTSeq/output/fit"
for files in ${FolderPath}/*; do

mv $files ${files}.bed
tempFile=`basename $files`
    echo $tempFiles 
    

done


