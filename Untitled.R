x <- data.frame(name=c("a", "b", "c"), math=c(1,2,3))
y <- data.frame(name=c("a", "b", "d"), math=c(3,4,5))
merge(x,y, all=TRUE)
