library(datasets)
data(iris)

## Q1
tapply(iris$Sepal.Length, iris$Species, mean)
mean(iris$Sepal.Length[iris$Species=="virginica"])

## Q2
apply(iris[, 1:4], 2, mean)

## Q3
data(mtcars)

tapply(mtcars$mpg, mtcars$cyl, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)


## Q4
hpall <- tapply(mtcars$hp, mtcars$cyl, mean)
hpall[3]-hpall[1]
