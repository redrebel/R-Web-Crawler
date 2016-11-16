

init <- function(){
  library(KoNLP)
  library(XML)
  library(stringr)
  useSejongDic()
}

# url에서 body 값들을 가져온다.
getValue <- function(url){
  
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

#"http://blog.cjred.net/rss/"
doCrawl <- function(rss, max){
  path = getwd();
  if(!file.exists("data")){
    # 만일 data 디렉토리가 없으면 만든다.
    print ("Make data directory")
    dir.create(file.path(path, "data"))
  }
  for(i in 1:max){
    url <- paste(rss, i , sep="")
    print (paste("Crawling...", url))
    minutes <-getValue(url)
    
    data2 <- sapply(minutes, extractNoun, USE.NAMES=F)
    #print (data2)
    #sum(str_count(tolower(data2), "트럼프"))
    #sum(str_count(tolower(data2), "다운"))
    
    #warnings()
    head(unlist(data2),30)
    data3 <- unlist(data2)
    
    data3 <- filter(data3)
    #data3
    #sum(str_count(tolower(data3), "요소"))
    saveDataName = paste("./data/data0", i , ".txt", sep="")
    write(data3, saveDataName)
    print (paste("==> Saved ", saveDataName))
  }
  print ("Crawling Done")
}