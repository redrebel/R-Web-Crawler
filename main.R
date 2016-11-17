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


