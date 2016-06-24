#### Arithmetic Mean

## Read the per capita gdp csv
mydata <- read.csv('percapitagdp.csv', stringsAsFactors = F)

## check the first 6 rows of data
head(mydata)

## Find the total number of rows
nrow(mydata)

## Find the structure of the dataframe
str(mydata)

## Find the country which has the maximum Per Capita GDP
mydata$Country[mydata$Percap_GDP==max(mydata$Percap_GDP)]

## Now we know Luxembourg is the country with maximum GDP
## We want to know what is the GDP of Luxembourg
## We need to list the entire row instead of just Country
mydata[mydata$Percap_GDP==max(mydata$Percap_GDP),]

## Find the country which has the maximum Per Capita GDP
mydata[mydata$Percap_GDP==min(mydata$Percap_GDP),]

## Find the mean per capita gdp
mean(mydata$Percap_GDP)





#### Median

## Finding the median
## There are 189 rows.So median is the 95th value
## First we need to sort them by Percap_GDP

## load the package doBy
## we are going to use the command orderBy in the package doBy
library(doBy)

## Open the help file for the command ?orderBy
?orderBy

## Sort the data by ascending order of Percap_GDP
mydata <- orderBy(~Percap_GDP, data=mydata)

## check the first 6 rows of mydata
head(mydata)

## check the last 6 rows of mydata
tail(mydata)

## 95th value is the median
## List the 95th value
mydata[95,]

## Instead we can use median command
median(mydata$Percap_GDP)

## Find the country which has the median value
mydata[mydata$Percap_GDP==median(mydata$Percap_GDP),]





#### Trimmed Mean

## Loading the values into an object
mydata <- c(34, 46, 38, 33, 41, 37, 43, 35, 42, 38)

## List all elements of mydata
mydata

## Find the mean
mean(mydata)

## Find the median
median(mydata)

## Loading the new values into an object
mydata <- c(34, 46, 38, 33, 99, 37, 43, 35, 42, 38)

## Find the mean
mean(mydata)

## Find the median
median(mydata)

## Find the 10% trimmed mean
mean(mydata,trim=.1)


  ## Grahps in the slide
  ## Load the first data set into an object
  mydata <- c(34, 46, 38, 33, 41, 37, 43, 35, 42, 38)  

  ## Graph first set
  plot(mydata,type='b',xlab='',ylab='',las=1,ylim=c(0,100))
  
  ## Load the second data set into an object
  mydata <- c(34, 46, 38, 33, 99, 37, 43, 35, 42, 38)

  
  ## Graph second set
  plot(mydata,type='b',xlab='',ylab='',las=1,ylim=c(0,100))





#### Quartile

## Let us load the percapita GDP again
mydata <- read.csv('percapitagdp.csv', stringsAsFactors = F)

## Find the quartiles
quantile(mydata$Percap_GDP)

## Lets verify 
## First sort the Percap_GDP
library(doBy)
mydata <- orderBy(~Percap_GDP, data=mydata)

## First Quantile should be the 48th observation
## Find the 48th value of Percap_GDP
mydata$Percap_GDP[48]

## Third Quantile should be the 142nd observation
## Find the 142nd value of Percap_GDP
mydata$Percap_GDP[142]


### How to recreate the graphs used in the slides

  ##First Graph
  ## Let us load the percapita GDP again
  mydata <- read.csv('percapitagdp.csv', stringsAsFactors = F)

  ## Arrange the data based on Percap_GDP
  library(doBy)
  mydata <- orderBy(~Percap_GDP, data=mydata)

  ## Let us plot Percap_GDP 
  plot(mydata$Percap_GDP,xlab='',ylab='',las=1)

  ## To change scientific notation on the y axis
  options(scipen=5)

  ##Now plot again
  plot(mydata$Percap_GDP,xlab='',ylab='',las=1)

  ## Add a vertical line at 95
  abline(v=95)

  ## Add a horizontal line at median 6044
  abline(h=6044)

  ##Second Graph
  ## Plot Percap_GDP
  plot(mydata$Percap_GDP,xlab='',ylab='',las=1)
  
  ## Plot vertical lines at 95 and 47
  abline(v=95)
  abline(v=48)

  ## Plot horizontal line at 1781 (1st Quartile)
  abline(h=1781)

  ## Third Graph
  ## Plot Percap_GDP
  plot(mydata$Percap_GDP, xlab='',ylab='',las=1)

  ## Plot vertical lines at 95 and 47
  abline(v=95)
  abline(v=48)
  abline(v=142)

  ## Plot horizontal line at 1781 (1st Quartile)
  abline(h=16199)





##### Mode

## Write a function to find mode
mode <- function(x) {
  unique_val <- sort(unique(x))
  k <- length(unique_val)
  for (i in 1:k) {
    z <- unique_val[i]
    count_z <- length(which(mydata==z))
    counts[i] <- count_z
    rm(z)
  }
  max_count <- max(counts) 
  position <- c(which(counts==max_count))
  if (mean(counts)==max_count) 
      mode_x <- 'Mode does not exist'
      else 
      mode_x <- unique_x[position]
  return(mode_x)
}

## Simpler version of the above function
mode <- function(x) {
  unique_val <- unique(x)
  counts <- vector()
  for (i in 1:length(unique_val)) {
    counts[i] <- length(which(x==unique_val[i]))
  }
  position <- c(which(counts==max(counts)))
  if (mean(counts)==max(counts)) 
    mode_x <- 'Mode does not exist'
  else 
    mode_x <- unique_val[position]
  return(mode_x)
}


## Load the data in an object
mydata <- c(1,1,2,4,5,4,6,3,7,1)

## Find the mode using the function
mode(mydata)

## Load the next set of data
mydata <- c(1,1,3,1,4,5,5,6,5)

## Find the mode using the function
mode(mydata)

## Load the next set of data
mydata <- c(1,2,3,4,5)

## Find the mode using the function
mode(mydata)

## Let us load the Per Cap GDP again
mydata <- read.csv('percapitagdp.csv', stringsAsFactors = F)

## Let us find the mode of Per Cap GDP
mode(mydata$Percap_GDP)





## Range

## Load Per Cap Data
mydata <- read.csv('percapitagdp.csv', stringsAsFactors = F)

## Find the range of Per Capita GDP
a <- range(mydata$Percap_GDP)
diff(a)

## Find the difference between max and min to verify
max(mydata$Percap_GDP) - min(mydata$Percap_GDP)





#### Inter Quartile Range

## Load Per Cap Data
mydata <- read.csv('percapitagdp.csv', stringsAsFactors = F)

## Find the Inter Quartile Range
IQR(mydata$Percap_GDP)

## Cross verify
quantile(mydata$Percap_GDP)





#### Variance & Standard Deviation

## Load Titanic Data
titanic <- read.table('http://lib.stat.cmu.edu/S/Harrell/data/ascii/titanic.txt',stringsAsFactors = F,sep=",",header=T)

## We are interested in age of passengers
## see the summary of age
summary(titanic$age)
## there are NA's and fractional values (age can't be a fraction) 

## first let us remove remove NAs from our data
titanic <- titanic[complete.cases(titanic$age),]

## Let us convert the age as integer
titanic$age <- as.integer(titanic$age)

## Let us remove 0s from age
titanic <- titanic[titanic$age != 0,]

## Let us see the summary again
summary(titanic$age)

## Calculate the mean age and store it in a variable
mean_age <- mean(titanic$age)

## Calculate the difference between mean and the actual age
titanic$diff <- titanic$age - mean_age

## Calculate the square of difference
titanic$diff2 <- titanic$diff ^ 2

## Sum of squared difference divided by n-1 is variance
variance_age <- sum(titanic$diff2)/(nrow(titanic)-1)

## See the variance
variance_age

## Variance can also be found using the function var
var(titanic$age)

## Standard deviation is the square root of variance
sd_age <- sqrt(variance_age)

## see the standard deviation
sd_age

## standard deviation can also be found using the function sd
sd(titanic$age)

## Now let us check our empirical rule
## Find the upper limit of 1 standard deviation from mean
upper1 <- mean_age + sd_age

## Find the lower limit of 1 standard deviation from mean
lower1 <- mean_age - sd_age

## Find the total number of countries in the data
total_count <- nrow(titanic)

## List the countries for whom GDP lies within 1 sd of mean
sd1 <- titanic[titanic$age > lower1 & titanic$age < upper1,]

## find the total number of countries within 1 sd of mean
sd1_count <- nrow(sd1)

## Find the percentage
sd1_count/total_count
## we got 71% which is close to 68%

## now let us figure out the percentage between 2 sd of mean

## Find the upper limit of 2 standard deviation from mean
upper2 <- mean_age + 2 * sd_age

## Find the lower limit of 2 standard deviation from mean
lower2 <- mean_age - 2 * sd_age

## List the countries for whom GDP lies within 2 sd of mean
sd2 <- titanic[titanic$age > lower2 & titanic$age < upper2,]

## find the total number of countries within 1 sd of mean
sd2_count <- nrow(sd2)

## Find the percentage
sd2_count/total_count
## we got 95% 





####Box Plots

##use the cars data
mydata <- read.csv('cars1993.csv',stringsAsFactors = F)  

## check the top rows of mydata
head(mydata)

## lets to box plots for three types of prices
## the three prices are the min, mid and max prices for the variants of the model 
boxplot(mydata$Min_Price,mydata$Mid_Price,mydata$Max_Price)

##add title to the plot
boxplot(mydata$Min_Price,mydata$Mid_Price,mydata$Max_Price, main="Min, Median and Max Car Prices")

##rotate the values in y axis
boxplot(mydata$Min_Price,mydata$Mid_Price,mydata$Max_Price, main="Min, Median and Max Car Prices", las=1)

## lets do the box plot for city mpg
boxplot(mydata$City_MPG,main="Miles Per Gallon",las=1)

##lets separate the box plots for each car type
boxplot (City_MPG ~ Type, data=mydata,main="Miles Per Gallon", las=1)

## Use Per Cap GDP data
mydata <- read.csv('percapitagdp.csv', stringsAsFactors = F)

## Change scientific notation
options(scipen=5)

## Box plot for Per Capita GDP
boxplot (mydata$Percap_GDP, data=mydata, main = "Per Capita GDP", las=1)





#### Scatter Plots
mydata <- read.csv('LungCapData.csv',stringsAsFactors = F)
head(mydata)

plot(mydata$Height, mydata$LungCap)

## Changing x and y labels, chart title
plot(mydata$Height, mydata$LungCap, xlab='Height',ylab='Lung Capacity', main = '
     Height vs Lung Capacity')

## rotate the values on y axis

plot(mydata$Height, mydata$LungCap, xlab='Height',ylab='Lung Capacity', main = '
     Height vs Lung Capacity',las = 1)

## changing the size of the character

plot(mydata$Height, mydata$LungCap, xlab='Height',ylab='Lung Capacity', main = '
     Height vs Lung Capacity', las =1, cex = 0.5)

## changing colour of the character

plot(mydata$Height, mydata$LungCap, xlab='Height',ylab='Lung Capacity', main = '
     Height vs Lung Capacity', las =1, cex = 0.5, col='blue')

## changing plotting characters

plot(mydata$Height, mydata$LungCap, xlab='Height',ylab='Lung Capacity', main = '
     Height vs Lung Capacity', las = 1, pch = 4)





#### Line Graphs

## read remittance data (million USD)
mydata <- read.csv('bse30.csv')

##check the data
head(mydata)

##select year 2014 alone
mydata <- mydata[1234:1474,]

##plot a line graph
plot(mydata$Close, type ="l")

##add title, x and y labels
plot(mydata$Close, type ="l", main="BSE 30", xlab="2014",ylab="Index Close")

##rotate the value on y axis
plot(mydata$Close, type ="l", main="BSE 30", xlab="2014",ylab="",las=1)

## remove the numbering on x axis
plot(mydata$Close, type ="l", main="BSE 30", xlab="2014",ylab="",las=1,xaxt='n')

##increase the thickness of line and change the colour to red
plot(mydata$Close, type ="l", main="BSE 30", xlab="2014",ylab="",las=1,xaxt='n',lwd=2,col="red")

## change the range of y axis
plot(mydata$Close, type ="l", main="BSE 30", xlab="2014",ylab="",las=1,xaxt='n',col="red",ylim=c(15000,30000))





#### Bar Charts
mydata <- read.csv("cars1993.csv")

##Get the first 6 rows of head
head(mydata)

##count the number of rows of mydata
nrow(mydata)

##step 1: Compute the frequency of Type
table(mydata$Type)

## store the above in a file
type_count <- table(mydata$Type)

## see what is there in the variable type_count
type_count

## plot a bar plot of type_count
barplot(type_count)

## add title and x and y labels
barplot(type_count, main ="1993 Car Data", xlab = "Type of Car", ylab = "No. of Cars")

##rotate the values on y axis
barplot(type_count, main ="1993 Car Data", xlab = "Type of Car", ylab = "No. of Cars", las=1)

##change the names of the bars
barplot(type_count, main ="1993 Car Data", xlab = "Type of Car", ylab = "No. of Cars", las=1, names.arg=c("compact","large","midsize","small","sport","van"))

##to change the graph from vertical to horizongal (change x and y labels)
barplot(type_count, main ="1993 Car Data", xlab = "No. of Observations", ylab = "", las=1, horiz=T)

## make changes the colors of the above graph
barplot(type_count, main ="1993 Car Data", xlab = "No. of Observations", ylab = "", las=1, horiz=T,col=c("blue","green"))

##plot percentage instead of absolute numbers
## save the percentages in a file
type_perc <- type_count/nrow(mydata)

##plot the new file
barplot(type_perc)





#### Pie Charts

## use the same cars data
mydata <- read.csv("cars1993.csv",stringsAsFactors=F)

## check the data
head(mydata)

## lets plot the cartype detail
type_count <- table(mydata$Type)
pie(type_count)

## add title to the chart
pie(type_count, main = "Car Type")





#### Histograms

mydata <- read.csv('LungCapData.csv',stringsAsFactors = F)
hist(mydata$LungCap)

## To use probability instead of frequency
hist(mydata$LungCap, freq = F)

## To change number of bins
## 29 breaks will produce 30 bins
hist(mydata$LungCap, freq = T, breaks=29)

## Bins can be given as a string input
hist(mydata$LungCap, breaks=c(0,3,6,9,12,15))

## Bins can also be defined as a sequence
hist(mydata$LungCap, breaks=seq(from=0,to=15,by=3))

## Changing title, x-axis & y-axis description
hist(mydata$LungCap, breaks=seq(from=0,to=15,by=.5),main= 'Histogram of Lung Capacity',
     xlab = 'Lung Capacity', ylab = 'No. of People')

## To rotate values on the y-axis
hist(mydata$LungCap, breaks=seq(from=0,to=15,by=.5), prob = T, main= 'Histogram of Lung Capacity',
     xlab = 'Lung Capacity',las=1)

## To draw a density curve over the histogram
lines(density(mydata$LungCap))

## To change colour and width of the line
lines(density(mydata$LungCap),col=2,lwd=2.5)

hist(mydata$LungCap, breaks=seq(from=0,to=15,by=1), prob = T, main= 'Histogram of Lung Capacity',
     col='blue',xlab = 'Lung Capacity',las=1)

## Adding multiple colours
hist(mydata$LungCap, breaks=seq(from=0,to=15,by=.5), prob = T, main= 'Histogram of Lung Capacity',
     col=rainbow(12),xlab = 'Lung Capacity',las=1)

## If you want only two colours to repeat
hist(mydata$LungCap, breaks=seq(from=0,to=15,by=1), prob = T, main= 'Histogram of Lung Capacity',
     col=rainbow(2),xlab = 'Lung Capacity',las=1)

## Change the colour
hist(mydata$LungCap, breaks=seq(from=0,to=15,by=0.5), prob = T, main= '',
     col=c('gray35','gray70'),xlab = '',ylab='',las=1)

## More colour patterns
colours <- c('gray80','gray78','gray76','gray74','gray72','gray70','gray68',
             'gray66','gray64','gray62','gray60','gray58','gray56','gray54',
             'gray52','gray50','gray48','gray46','gray44','gray42','gray40',
             'gray38','gray36','gray34','gray32','gray30','gray28','gray26',
             'gray24','gray22')
hist(mydata$LungCap, breaks=seq(from=0,to=15,by=0.5), prob = T, main= '',
     col=colours,xlab = '',ylab='',las=1)

## Let us see the histogram of Per cap GDP data

## Read the data
mydata <- read.csv('percapitagdp.csv', stringsAsFactors = F)

## Plot Percap GDP as histogram
## Data is unimodal
## Histogram is Right (or) Positive skewed
## Mode is between 0 and 10,000$
## Outliers can be seen in the data
hist(mydata$Percap_GDP, xlab='Per Cap GDP in USD', ylab='',las=1, main='Per Cap GDP of various countries')
