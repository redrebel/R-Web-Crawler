#install.packages("XML")
#install.packages("stringr")
library(KoNLP)
library(XML)
library(stringr)
useSejongDic()

init <- function(){
  
  Sys.setlocale("LC_ALL", "en_US.UTF-8") 
  localeToCharset()
  #Sys.getlocale()
  #Encoding(minutes)
}

# url에서 body 값들을 가져온다.
getValue <- function(url){
  print (url)
  #t <- htmlTreeParse("http://hankookilbo.com", useInternalNodes=TRUE, trim=TRUE)
  t <- htmlTreeParse(url, useInternalNodes=TRUE, trim=TRUE)
  ## 위에서 http:// 이후는 주소 부분
  t
  minutes<- xpathSApply(t,"//p", xmlValue)
  #minutes <- str_replace_all(minutes, "https?[^ ]+", "")
  #minutes <- str_replace_all(minutes, "[A-Z,a-z]", "")
  minutes <- str_replace_all(minutes, "[^[가-힣, ,.]]", "")
  minutes <- str_replace_all(minutes, " {2,}", " ")
  minutes <- Filter(function(x){nchar(x)>=2}, minutes)
  #minutes <- str_replace_all(minutes, "[^[:alpha:]]", ,." ")
  minutes
}

## 단어들을 필터링한다.
filter <- function(data){
  data <- Filter(function(x){nchar(x)>=2}, data)
  data <- gsub("\\d+", "", data)
  data <- gsub("자기", "", data)
  data <- gsub("들이", "", data)
  data <- gsub("하시", "", data)
  data <- gsub("대부분", "", data)
  data <- gsub("하게", "", data)
  data <- gsub("으로", "", data)
  data <- gsub("\n", "", data)
  
  data <- data[data != ""]
  sum(str_count(tolower(data3), "요소"))  
  #+ " filtered"
  data
}

# 초기화한다.
init();



for(i in 1:9){
  url <- paste("http://blog.cjred.net/rss/", i , sep="")
  minutes <-getValue(url)
  
  data2 <- sapply(minutes, extractNoun, USE.NAMES=F)
  data2
  #sum(str_count(tolower(data2), "트럼프"))
  #sum(str_count(tolower(data2), "다운"))
  
  #warnings()
  head(unlist(data2),30)
  data3 <- unlist(data2)
  
  data3 <- filter(data3)
  data3
  #sum(str_count(tolower(data3), "요소"))
  write(data3, paste("data0", i , ".txt", sep=""))
}

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
