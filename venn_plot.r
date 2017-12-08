#!/usr/bin/env Rscript
# test direct
library(VennDiagram)
library(RColorBrewer)

argv <- commandArgs()

if (length(argv) <8){
	cat("\tUsage:venn_plot.R \"CategoryNames\" \"CategoryItemFiles\" \"PictureTitle\" OutFilePrefix\n")
	cat("\t\tCategoryNames are separated by comma, e.g., \"Category1,Category2,...\"\n")
	cat("\t\tCategoryItemFiles contain the items in each category, one items one row and one category one file, separated by comma, e.g. \"file1, file2, ...\"\n")
	cat("\t\tPictureTitle should be in quotes if spaces in it. e.g., \"Venn plot title\"\n")
	cat("\tPlease mail to coly_fu@163.com if you have any questions!\n")
	cat("\tfujun,2015-9-17\n")
	quit(save="no")
}

nameall <- unlist(strsplit(argv[6],",", fixed = TRUE))
fileall <- unlist(strsplit(argv[7],",", fixed = TRUE))
#print(fileall)
venndata <- list()

for (f in 1:length(fileall)){
	d = read.table(fileall[f],head=F)
	venndata[[nameall[f]]] <- d$V1
}
#venndata = venndata[1:length(venndata)]
#colnames(venndata) = nameall
#print(venndata)
cols <- brewer.pal(5,"Set2")
cols <- cols[1:length(fileall)]
venn.plot <- venn.diagram(
x = venndata,
filename = paste(argv[9],'.png',sep=''),
imagetype = 'png',
main = argv[8],
main.cex = 2.2,
col = 'black',
fill = cols,
alpha = 0.30,
cat.col = cols,
cat.cex = 1.2
)

