setwd("~/Desktop/fb data")
data1 = read.table(file = './R23E10_Adapted_SMART-seq2.tsv', sep = '\t', quote="",header = TRUE)
rownames(data1) = data1[,1]
data1 = data1[,-1]
head(data1)

data2 = read.table(file = './R23E10_CEL-seq2_DGEM.tsv', sep = '\t', quote="",header = TRUE)
rownames(data2) = data2[,1]
data2 = data2[,-1]
head(data2)

data4 = read.table(file = './R23E10_SMART-seq2.tsv', sep = '\t', quote="",header = TRUE)
rownames(data4) = data4[,1]
data4 = data4[,-1]
head(data4)

length(union(data2$X,data1$X))
data3 = merge(data1, data2,by="row.names", all=TRUE) 
rownames(data3) = data3[,1]
data3 = data3[,-1]
data3[is.na(data3)] = 0
data3 = merge(data3, data4,by="row.names", all=TRUE) 
rownames(data3) = data3[,1]
data3 = data3[,-1]
data3[is.na(data3)] = 0
head(data3)
dim(data3)
write.csv(data3, file = "./Merged_RNA_Sequence_Data.csv")