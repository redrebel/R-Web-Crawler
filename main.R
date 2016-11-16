#install.packages("XML")
#install.packages("stringr")

Sys.setlocale("LC_ALL", "en_US.UTF-8") 
localeToCharset()
#Sys.getlocale()
#Encoding(minutes)

source("source.R")

# 초기화한다.
init();

doCrawl("http://blog.cjred.net/rss/",1)

for(i in 1:9){
}

data4 <- read.table("data01.txt")
data4
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing = T), 80)

top1 <- head(sort(wordcount, decreasing = T), 10)
top1
write.table(top1, "text22.txt")

data5 <- read.table("text12.txt")
data6 <- read.table("text22.txt")
data5
data6
data7 <- rbind(data5,data6,)
data7

data8 <- rbind(read.table("text11.txt"), read.table("text21.txt"))
data8 <- data.frame(data8)
data8
write.table(data8, "data8.txt")
w1 <- table(data8)
w1 <- head(sort(w1, decreasing = T), 10)
w1
write.table(w1, "w.txt")
