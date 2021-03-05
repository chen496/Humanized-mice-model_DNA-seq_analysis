
#!/bin/sh
###############################################################################
#filename:toExcel
#功能：txt文本转换成excel，
#   txt文本内数据以"|"分隔
#
#帮助：toExcel -help OR toExcel --help
#
#input:
#1.单个文件处理的情况(参数个数可能：1、2)
#arg1:TXTfile (必须指定一存在文件)
#arg2:XLSfile (可以是一存在的存放目录，也可以是新的文件名,新的文件名
#可以带后缀也可以没有，但程序中最终会检查是否有后缀.xls，如果没有则
#会自动添加后缀.xls.如果这一参数是一目录， 程序则会修改原文件名后缀后?
#作为一新的文件名保存到指定目录。
#这一参数也可以不用输入，如果没有这个参数，新的文件则保存在TXT文件目录。
#2.批处理的情况(参数个数可能：2、3,其中第1个参数必为"-r")
#arg1: -r (表示使用批处理)
#arg2:TXTfileDIR (该目录必须存在要转换的文件)
#arg3:XLSfileDIR (数据文件最终存放目录，如果没有这个参数则数据存放在当前目录)
#
#注：以"0"开头的数字 或者 长度超过11的数字,数据前加"'",
# 则数据将以文本格式保存,最终数据以制表符分隔,后缀名为.xls
#另：转换后的xls文件名
#重名时程序自动在新名字后加数字序号，但指定的文件名有重名则覆盖
###############################################################################
#帮助
help()
{
cat << EOF
帮助:
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ 一、单文件转换:                                              ┃
┃     toExcel arg1 arg2                                        ┃
┃     arg1:待转换文件                                          ┃
┃     arg2:转换后xls文件名(可带路径)，或xls文件存放目录，如果 ┃
┃          这一参数为空则表示存放目录为待转换文件同一目录，这 ┃
┃          种情况下新文件名将使用旧文件名，后缀改为.xls。      ┃
┃ 二、批量转换("-r"):                                          ┃
┃     toExcel -r arg1 arg2                                     ┃
┃     arg1:待转换文件,可以是形如*.txt的表达式，也可以是一目录 ┃
┃          (将转换目录下所有文件)                              ┃
┃     arg2:转换后xls文件存放目录，这一参数为空则保存在待转换文 ┃
┃          件同目录                                            ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
EOF
}
#处理单个文件的转换
dealone()
{
if [ $# -ne 1 ] && [ $# -ne 2 ];then
echo "\nUsage: `basename $0` TXTfile XlSfile"
echo "OR: `basename $0` TXTfile saveDIR"
echo "OR: `basename $0` TXTfile \n"
help;
return 1;
fi
#帮助
if [ $# -eq 1 ];then
if [ "$1" = "-help" ] || [ "$1" = "--help" ];then
   help;
   return 0;
fi
fi
txtfile="$1" #txt文件
if [ ! -f $txtfile ];then
echo "<ERROR>TXT文件[$txtfile]不存在!"
help;
return 1;
fi
if [ $# -eq 2 ];then
xlsfile="$2"
else
xlsfile="`dirname $txtfile`"
fi
#最终保存的EXCEL文件的文件名
if [ -d $xlsfile ];then
#删除末尾"/"
xlsfile="`echo $xlsfile | sed 's/\/$//'`"
#将原文件修改后缀名为.xls作为最终EXCEL文件名
_tmpStr="` basename $txtfile | sed 's/\.[^.]*$//' `"
_tmpStr2="$xlsfile/${_tmpStr}.xls"
#防止同名文件
i=1
while [ -f "$_tmpStr2" ]
do
   _tmpStr2="$xlsfile/${_tmpStr}($i).xls"
   i=`expr $i + 1`
done
xlsfile="$_tmpStr2"
else
#检查上级目录是否存在
if [ ! -d `dirname $xlsfile` ];then
   echo "<ERROR>指定文件[$xlsfile]上级目录不存在!"
   return 1;
fi
#检查指定名有无后缀.xls如果没有则加上
_tmpStr="` basename $xlsfile | grep ".xls$" `"
if [ "$_tmpStr" = "" ];then
   xlsfile="${xlsfile}.xls"
fi
fi
#补齐行首和行尾的"|"
#在形如"0123"等数据前加"'",避免导入Excel后前面的"0"被删
#在长度超过11的数字前加"'",避免导入Excel后变为科学记数法
#删除行首和行尾的"|"
#将"|"替换成" "(Tab)
sed 's/^[^|]/|&/g' $txtfile | sed 's/[^|] *$/&|/g' |
sed 's/| *0[0-9]\{1,\} *|/ &/g' | sed 's/| *[1-9][0-9]\{11,\} *|/ &/g' |
sed "s/ |/|\'/g" |
sed "s/^|//g" | sed "s/|$//g" |
sed 's/|/ /g' > $xlsfile
if [ $? -eq 0 ];then
echo "[$txtfile] -> [$xlsfile] OK !"
return 0;
else
echo "[$txtfile] -> [$xlsfile] ERROR !"
return 1;
fi
}
#非批量处理的参数情况
if [ $# -lt 2 ] || [ $# -gt 3 ] || [ "$1" != "-r" ];then
dealone $*
exit;
else
#批量处理的参数情况
TXTfileDIR="$2"
if [ ! -e "$TXTfileDIR" ];then
   echo "\n<ERROR>[$TXTfileDIR]不存在!\n"
   help;
   exit 1;
fi
if [ -d "$TXTfileDIR" ];then
   TXTfileDIR="`echo $2 | sed 's/\/$//'`"
   if [ "`find $TXTfileDIR -type f`" = "" ];then
    echo "\n<ERROR>目录[$TXTfileDIR]下不存在文件!\n"
    help;
    exit 1;
   fi
   TXTfileDIR="$TXTfileDIR/*"
fi
if [ $# -eq 3 ];then
   XLSfileDIR="`echo $3 | sed 's/\/$//'`"
   if [ ! -d $XLSfileDIR ];then
    echo "\n<ERROR>数据存放目录[$XLSfileDIR]不存在!\n"
    help;
    exit 1;
   fi
else
   XLSfileDIR=""
fi
fi
#批量处理,TXTfileDIR可以是存放要文件的一目录，也可以是类似"*.txt"等 
###TXTfileDIR="/~/local/test/HTSeq/output1"
for txt in $TXTfileDIR
do
if [ ! -f "$txt" ];then
   continue;
fi
dealone $txt $XLSfileDIR
if [ $? -ne 0 ];then
   echo "<ERROR>[$txt] deal failed !"
fi
done
exit 0
