install.packages("XML")
install.packages("stringr")
library(KoNLP)
library(XML)
library(stringr)

useSejongDic()

t <- htmlTreeParse("http://hankookilbo.com", useInternalNodes=TRUE, trim=TRUE)
## 위에서 http:// 이후는 주소 부분
t
Sys.setlocale("LC_ALL", "en_US.UTF-8") 
localeToCharset()
Sys.getlocale()
Encoding(minutes)
minutes<- xpathSApply(t,"//p", xmlValue)
minutes
data2 <- sapply(minutes, extractNoun, USE.NAMES=F)
data2
sum(str_count(tolower(data2), "트럼프"))


head(unlist(data2),30)
data3 <- unlist(data2)
data3 <- Filter(function(x){nchar(x)>=2}, data3)

data3
