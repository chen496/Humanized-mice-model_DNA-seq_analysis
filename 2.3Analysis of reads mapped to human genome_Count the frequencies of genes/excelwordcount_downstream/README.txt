
input里面是含有reads的原文件
output里面是从原文件中提取出基因名称
output1里面是单个文件统计的结果
countSingle.R将input中的文件提取出基因名称，结果存放到output中，然后从output中读取基因名称，统计单个文件中基因名出现的次数，并且将结果保存到output1中。

然后将output1中所有文件按照组别进行汇总，将汇总的文件放到input2中

input2是汇总后的各组基因名称
countGroupfile.R读input2中的文件，统计各组中基因的数目，结果保存到output2中

output2里面是组的词频统计的结果



文件夹2中
input23中Total文件夹是output2中的文件
51GHLH。。。各个文件夹中分别是output1中各组的文件

51GHLH.R
51GHLHM.R
51GHLM.R
51GHLP.R
51KL.R
统计各个文件中基因出现的次数，并且将结果保存到output23中
output23是每个Grouup最后输出的结果