str(str)
str(1:3)

pnorm(0.1, mean=1, sd=2)
pnorm(0.1, mean=1, sd=2, lower.tail=FALSE)
1-pnorm(0.1, mean=1, sd=2)

set.seed(1)
rnorm(5)

rpois(12, lambda=22 )
mean(rpois(12, lambda=10000))
?rpois
ppois()

########set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2*x + e
summary(y)
plot(x, y)

set.seed(10)
x <- rbinom(100, size=1, prob=0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2*x + e
summary(y)
plot(x, y)


#################
set.seed(1)
rnorm(2)
rbinom(2, size=1, prob=0.2)
rnorm(2)
rbinom(2, size=1, prob=0.2)


#################
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3*x
y <- rpois(100, exp(log.mu))
x
y
summary(y)
plot(x, y)

###############
set.seed(1)
sample(1:10, 4)

a <- c("a", "b", "dff", "1")
sample(a, 2)

sample(1:10)

##############
for (i in 1:8){
  cat(i, system.time(rnorm(10**(i)))[1], "\n")
}

#### Elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))

### Elapsed time < user time
hilbert <- function(n){
  i <- 1:n
  1/outer(i-1, i, "+")
}
x <- hilbert(100)
system.time(svd(x))

#########
make.NegLogLik <- function(data, fixed=c(FALSE, FALSE)) {
  params <- fixed
  function(p) {
    params[!fixed] <- p
    mu     <- params[1]
    sigma  <- params[2]
    a <- -0.5 * length(data) * log(2*pi*sigma^2)
    b <- -0.5 * sum((data-mu)^2)/(sigma^2)
    -(a+b)
  }
}

set.seed(1)
normals <- rnorm(1e5, 1, 2)
nLL <- make.NegLogLik(normals)
nLL
ls(environment(nLL))

optim(par=c(mu=0.0, sigma=1.0), fn=nLL)

for (i in 1:7){
  set.seed(1)
  normals <- rnorm(10^(i), 1, 2)
  nLL <- make.NegLogLik(normals)
  nLL
  ls(environment(nLL))
  
  cat(i, optim(par=c(mu=0.0, sigma=1.0), fn=nLL)$par, "\n")  
}

## fix sigma to 2
set.seed(1)
normals <- rnorm(100, 1, 2)
nLL <- make.NegLogLik(normals, c(FALSE, 2))
optimise(nLL, c(-1, 3))$minimum

## fix mu to 1
set.seed(1)
normals <- rnorm(1e3, 1, 2)
nLL <- make.NegLogLik(normals, c(1, FALSE))
optimise(nLL, c(1e-6, 10))$minimum

## 
set.seed(1)
normals <- rnorm(1e3, 1, 2)
nLL <- make.NegLogLik(normals, c(1, FALSE))
optimise(nLL, c(1e-6, 10))$minimum
x <- seq(1.7, 2.3, len=100)
y <- sapply(x, nLL)
plot(x, exp(-(y-min(y))), type="l")

## 
set.seed(1)
normals <- rnorm(1e3, 1, 2)
nLL <- make.NegLogLik(normals, c(FALSE, 2))
optimise(nLL, c(1e-6, 10))$minimum
x <- seq(0.5, 1.5, len=100)
y <- sapply(x, nLL)
plot(x, exp(-(y-min(y))), type="l")
