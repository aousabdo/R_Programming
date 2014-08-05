x <- list(a=1:5, b=rnorm(10))
lapply(X=x,FUN=mean)
class(lapply(x,mean))

x <- 1:5
lapply(x, runif)
lapply(x,runif, min=5, max=10)

x <- list(a = matrix(1:4, 2,2), b= matrix(1:6, 3,2))
lapply(x, function(elt) elt[,1])

foo <- function(elt){
  elt[,1]
}

lapply(x, foo)

foo <- function(x, d=2){
  mean(x)/sum(x)*d    
}
lapply(x,foo, 3)

x <- list(a=1:5, b=rnorm(10), c=rnorm(122, mean=10))
sapply(x, mean)

#####
set.seed(123)
x <- matrix(rnorm(200), 20, 10)
apply(X=x, MARGIN=2, mean)
apply(x, 1, sum)
apply(x, c(1,2), sum)

## much faster
rowSums(x)
rowMeans(x)

apply(x, 1, quantile, probs=c(0.25, 0.75))

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)

a <- matrix(1:4, 2,2)
b <- matrix(5:8, 2,2)
c <- matrix(9:12, 2, 2)
foo <- array(c(a,b,c), c(2,2,3))
apply(foo, c(1,2), sum)


######
x <- c(rnorm(10), runif(10), rnorm(10), 1:10)
f <- gl(4, 10)
tapply(x, f, mean)
tapply(x, f, range)


#######
x <- c(runif(10), rnorm(10), rnorm(10))
x <- 1:30
f <- gl(3, 10)
split(x,f)

library(datasets)
head(airquality)

s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm=TRUE))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm=TRUE))

######
x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)
f1 
f2
interaction(f1,f2)
list(f1, f2)
df <- data.frame(x, f1, f2)
df
split(x, list(f1, f2))
str(split(x, list(f1, f2)))

################
list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
mapply(rep, 1:4, 4:1)

noise <- function(n, mean, sd){
  rnorm(n, mean, sd)
}

noise(5, 1, 2)
mapply(noise, 1:5, 1:5, 2)


##############
printmessage <- function(x){
  if(is.na(x)){
    print("x is not a number")
  }
  else if(x > 0) {
      print("x is greater than zero")
  }
  else{
    "x is less than or equal to zero"
  }
  invisible(x)
}

x <- log(-1)
printmessage(x)


#############
remove(x)
remove(y)
mean(x)
traceback()
lm(y ~ x)
traceback()

debug(lm)
lm(y ~ x)

options(error=recover)
read.csv("nosuchfile")
1