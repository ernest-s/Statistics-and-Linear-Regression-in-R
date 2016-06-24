## write a program to check whether x is less than 3
## if x is less than 3, we need to print x
## if x is greater than 3, we need to print a message 'x is greater than 3'

## let us assign a value to x
x <- 2

## let us write the program
if (x < 3) {
  print(x)
} else {
    print('x is greater than 3')
}

## let us change the value of x and run the if condition again
x <- 5

## write a program to print the numbers 1 to 5
## print numbers 1 to 5
for (i in 1:5)
{
  print(i) 
}

## write a function to print the square root of numbers in a numeric vector

## let us declare a numeric vector
x <- c(45,27,36,107,81)

## print the square roots of nos in x
for (num in x)
{
  print(sqrt(num))
}

## write a program to print the squares of 1 to 10
## print the squares of 1 to 10
start <- 1
while (start <11) {
  print(start^2)
  start <- start +1
}


## print the square of natural numbers starting from 0 
## until the square value is 100
start <- 0
repeat {
  print(start^2)
    if (start^2 >=100) {
    break
  }
  else {
    start <- start +1
  }
}

## print the numbers from 1 to 25 except multiples of 3
for (i in 1:25) {
  if (i%%3 == 0){
    next
  }
    else {
      print(i)
  }
}






#### Functions



## write a function to add two numbers
addition <- function(x,y){
  return(x+y)
}

## let us execute our function
addition(5,6)

## write a function to find the min number in a vector
mini_fn <- function (x) {
  return(min(x))
}

## let us declare a numeric vector
a <- c(42,45,123,34,35,55,26,74,457,222)

## let us find the minimum number of the numeric vector
mini_fn(a)


## write a function to find the average of the columns in a dataframe
## find the average of columns in a dataframe
col_mean <- function(x) {
  nc <- ncol(x)
  average <- numeric(nc)
  for (i in 1:nc) {
    average[i] <- mean(x[,i])
  }
  return(average)
}

## let us load the library MASS
library(MASS)

## women is a inbuilt dataset in MASS
## check the top rows of women
head(women)

## to know more about women dataset use help
?women

## let us find the column averages using our function
col_mean(women)

##Write a function to find the nth root of a number
nth_root <- function (x,n) {
  return(x^(1/n))
}

## let us check our function
nth_root(4,2)
nth_root(8,3)
nth_root(100,5)

##Write a function to find the sum of a numeric vector
vector_add <- function (x) {
  len <- length(x)
  result <- 0
  for (i in 1:len) {
  result <- result + x[i] 
  }
  return(result)
}

## let us declare a numeric vector
a <- c(1,2,4,5,5,5,56,2,4)

## let us verify our function
vector_add(a)

## write a function to calculate the roots of a quadratic equation
quad_root <- function(a,b,c) {
  k <- b^2-4*a*c
  if (k < 0){
    l <- complex(real=0,imaginary=(sqrt(-k)))
    }
    else
    {
      l <- sqrt(k)
    }
  x[1] <- (-b+l)/(2*a)
  x[2] <- (-b-l)/(2*a)
  return(x)
}

## let us verify our function
quad_root (1,-5,6)
quad_root (1,5,9)
quad_root(1,4,4)






#### Loop Functions





##apply

## let us create a matrix
mat <- matrix(c(21:30,41:50),nrow=5,ncol=4)

## let us check the matrix
mat

## suppose we want to find out the maximum value in every columns
max_col <- c(0)
for (i in 1:ncol(mat)) {
  max_col[i] <- max(mat[,i])
}
max_col 

## we can do this with a single line using apply
apply(mat,2,max)

## suppose we want to find out the maximum value in every rows
max_col <- c(0)
for (i in 1:nrow(mat)) {
  max_col[i] <- max(mat[i,])
}
max_col 

## using apply command the same can be done in a single line
apply(mat,1,max)

## suppose we want to add 1 to all the values
apply(mat,c(1:2), function(x) x+1)







## lapply

## let us create a list
l1 <- list(c(1:5),c(11,2,343,2,23,3),c(1.3,4.5,1,4.32,6.8))

## let us check the list
l1

## there are 3 elements in the list
## we need to find the mean of all the elements
lapply(l1,mean)
## the command returns a list with 3 elements






## sapply

## let us apply the mean function over list l1
sapply(l1,mean)
## the function returns a vector instead of a list








## by

## let us load the crime data again
crime <- read.csv('Crime.csv')

## check the top rows
head(crime)

## check the number of regions
table(crime$region)
## there are 3 regions

## let us say we want to know the average crime rate, average sentence and 
## average density for every region
by(crime[,c(4,8,10)],crime$region,colMeans)
## crime rate, average sentence and average density are the 4th, 8th and 10th
## columns respectively

## let us verify
crime1 <- crime[crime$region=='central',]
colMeans(crime1[,c(4,8,10)])








#### Debugging




## warning message
a <- sqrt(-1)
## it is just a warning message 

## let us see a
a
## sqrt of -1 is not a number 


## let us write a function to tell whether a number is positive or negative
posneg <- function (x) {
  if (x >= 0)
    print ('positive')
  else
    print ('negative')
}


## let us verify the function
posneg(-1)
posneg(0)
posneg(1)
posneg(Inf)
posneg(-Inf)

## let us run the function on a
## to check whether a is negative or positive
posneg(a)
## now we are getting an error message since 'a' is not a number

## let us change the value of a
a <- 5
posneg(a)





## traceback




## traceback helps you to print the sequence of the function which led to the 
## error
posneg(sqrt(-1))
traceback()
## here traceback command shows the function which gave the error
## traceback is not particularly useful here since we used just one function


## let us write the following functions

## function 1 takes a value x
## if x is -ve, adds 4
## else sub 4 and find square root
fun1 <- function(x) {
  if (x < 0)
    x + 4
  else
    sqrt(x-4)
}

## let us write another function which will take the value y
## finds the fun1(y)
## if fun1(y) is -ve, adds 4 and finds square root
## else sub 4 and find square root 
fun2 <- function (y) {
  if (fun1(y) < 0)
    sqrt(fun1(y)+4)
  else
    sqrt(fun1(y)-4)
}

## let us write a third function which will take a value z  
## finds the fun2(z)
## if fun2(z) is -ve, adds 5 else adds 1
fun3 <- function(z) {
  if (fun2(z) < 0)
    fun2(z) +5
  else
    fun2(z) + 1
}

## now function 1 doesn't call any other function
## function 2 calls function 1
## function 3 calls function 2 which in turn calls function 1

## let us apply function 3 to the values: -6, 19, -9, 3
fun3(-6)
fun3(25)
fun3(-9)
## we are getting an error
## let us use the traceback() option
traceback()
## the error occurs at function 3
fun3(3)
## we are getting an error
## let us use the traceback() option
traceback()
## the error occurs at function 2 and then at function 3




## debug




## traceback tells you in which function error occurs
## but it doesn't tell you in which part of the function the error occurs
## in this case we can use debug
## it flags a function 
## to unflag, we need to use undebug

## let us debug function 3
debug(fun3)

## let us pass the value 30 to fun3
fun3(30)
## press enter key to run it step by step

## let us try another valuee
fun3(3)
## now we can see where the error occurs

## let us undebug
undebug(fun3)

## let us pass another value 45
fun3(45)





## browser




## you can use browser to stop a function at any particular point

## let us create a function which will add 2 nos and if the sum is > 10
## will return 'Yes', else will return 'No'
addxy <- function (x,y) {
  z <- sum(x,y)
  if (z > 10)
    print('Yes')
  else
    print('No')  
}

## let us verify the function
addxy(2,4)
addxy(5,6)

## let us add the browser() to the function
## you can insert anywhere you want
addxy <- function (x,y) {
  z <- sum(x,y)
  browser()
  if (z > 10)
    print('Yes')
  else
    print('No')  
}

## let us try the function again
addxy(2,4)
## the function stops where we have mentioned browser
## now let us check the value of z
## now we know the result is going to be 'No'
## continue running the function

## you can also add multiple browser() commands in a function




