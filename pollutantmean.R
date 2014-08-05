pollutantmean <- function(directory, pollutant, id = 1:332) {
  all <- vector()
  for(i in id){
    ## add leading zeros for id < 99 cases  
    i <- formatC(i, width = 3, format = "d", flag = "0")
    filename <- paste(i,".csv", sep="")
    filepath <- paste(directory,filename,sep="/")
    polldf   <- read.csv(filepath)
    all      <- c(all,polldf[,pollutant])
  }
  mean(all, na.rm=TRUE)
}



