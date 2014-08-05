complete <- function(directory, id = 1:332) {
  completecount <- vector(length=length(id))
  j <- 1
  for(i in id){
    ## add leading zeros for id < 99 cases  
    ID <- formatC(i, width = 3, format = "d", flag = "0")
    filename <- paste(ID,".csv", sep="")
    filepath <- paste(directory,filename,sep="/")
    polldf   <- read.csv(filepath)
    completecount[j] <- nrow(polldf[(!is.na(polldf$sulfate) & !is.na(polldf$nitrate)),])
    j <- j + 1
  }
  
  completedf <- data.frame(id=id, nobs=completecount)
  return(completedf)
}



