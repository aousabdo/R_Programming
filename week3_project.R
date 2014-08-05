makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  print(m)
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  ## below is where the mean is set, if this is commented out
  ## the mean will never be calcualated or stored
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}