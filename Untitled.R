x <- data.frame(name=c("a", "b", "c"), math=c(1,2,3))
y <- data.frame(name=c("a", "b", "d"), math=c(3,4,5))
merge(x,y, all=TRUE)

print (paste("saveDataName" , "Done"))

a <- c("1", "2", "3")
b <- c("4", "3", "6")
c <- c(a,b)
c

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

data1 <- readLines("text11.txt")
data1
data2 <- readLines("text21.txt")
data3 <- c(data1, data2)
data3
data4 <- table(data3)
data4
w1 <- head(sort(data4, decreasing = T), 10)
w1
data5 <- read.table("text12.txt")
data6 <- read.table("text22.txt")
data5
data6
data7 <- rbind(data5,data6)
data7

data8 <- rbind(read.table("text11.txt"), read.table("text21.txt"))
data8 <- data.frame(data8)
data8
write.table(data8, "data8.txt")
w1 <- table(data8)
w1 <- head(sort(w1, decreasing = T), 10)
w1
write.table(w1, "w.txt")