corr <- function(directory, threshold=0) {
  corrfact <- vector()
  for(i in 1:332){
    ## add leading zeros for id < 99 cases  
    ID <- formatC(i, width = 3, format = "d", flag = "0")
    filename <- paste(ID,".csv", sep="")
    filepath <- paste(directory,filename,sep="/")
    polldf   <- read.csv(filepath)
    polldf   <- polldf[(!is.na(polldf$sulfate) & !is.na(polldf$nitrate)),]
    if(nrow(polldf) > threshold){
      corrfact[i] <- cor(polldf$sulfate, polldf$nitrate)
    }
    else{corrfact[i] <- NA}
  }
  corrfact <- corrfact[!is.na(corrfact)]
  if(all(is.na(corrfact))){corrfact <- numeric(0)}
  return(corrfact)
}



