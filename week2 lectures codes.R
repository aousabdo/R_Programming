x <- sample(-100:100,1)
if(x>0){
  y<-10
} else {
  y <- 0
}
y

y <- if(x>0){
  10
} else {
  0
}
y

x <- matrix(1:6, 2, 3)

for (i in seq_len(nrow(x))) {
  for (j in seq_len(ncol(x))){
    print(x[i,j])
  }
}

counter <- 0

while(counter < 10){
  print(counter)
  counter <- counter + 1
}

z <- 5

while(z>=3 & z <=10){
  print(z)
  coin <- rbinom(1,1,0.5)
  # random walk code below
  if(coin ==1){
    z <- z+1
  } else {
    z <- z-1
  }
}


for (i in 1:30){
  if(i<=20){
    next
  } 
  print(i)
}


f <- function(a,b){
  print(a)
  print(b)
}
f(44)


myplot <- function(x, y, type="l", ...) {
  plot(x, y, type=type, ...)
}

myplot(1:100, rnorm(100))
plot(1:100, rnorm(100))


above10 <- function(x){
  x[x>10]
}

above10(1:2)

above <- function(x, n=2){
  x[x>n]
}

above(1:12)
above(1:12,5)

colmeans <- function(x, removeNA=FALSE){
  nc <- ncol(x)
  means <- numeric(nc)
  for (i in 1:nc){
    means[i] <- mean(x[,i], na.rm=removeNA)
  }
  means
}

colmeans(matrix(1:10, 2,5))
colmeans(airquality)
colmeans(airquality, removeNA=TRUE)


make.power <- function(n){
  pow <- function(x){
    x^n
  }
  pow
}
square <- make.power(2)
cube <- make.power(3)

square(3)
cube(3)

ls(environment(cube))
get("n", environment(cube))


y <- 10

f<- function(x){
  y <- 2
  y^2 +g(x)
}

g <- function(x) {
  x*y
}

x <- matrix(1:4, 2,2)
y <- matrix(rep(10,4), 2, 2)
 
x*y
x%*%y
x/y


f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

z <- 10
f(3)


x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}
y
