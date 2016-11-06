library(KoNLP)

useSejongDic()
setwd("/Users/red/webhard/OneDrive/문서/대학원-MSDN-SPECIAL/논문/flog")
data1 <- readLines("text10.txt")
data1
data2 <- sapply(data1, extractNoun, USE.NAMES=F)
head(unlist(data2),30)
data3 <- unlist(data2)
data3 <- Filter(function(x){nchar(x)>=2}, data3)

data3

data3 <- gsub("\\d+", "", data3)
data3 <- data3[data3 != ""]
write(data3, "text11.txt")
data4 <- read.table("text11.txt")
data4
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing = T), 80)
