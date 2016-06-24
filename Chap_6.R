
#### Central Limit Theorem

## E-bay auction data
mydata <- read.csv("Palm 7-day 158auctions Visualization.csv")

## Check the data
head(mydata)

## Find the number of rows
nrow(mydata)

## Find the average bid amount
mean(mydata$Bid.Amount)

## Plot a histogram of bid amount
hist(mydata$Bid.Amount,las=1,main="Population distribution",xlab="mean=138.66",ylab="")

## Let us take a random sample of 50 bids 
## We are going to use the sample function
mydata_sample <- mydata[sample(1:nrow(mydata),50,replace=F),]


## Let us check out our sample
mydata_sample
## Look at the row numbers it is completely random

## Let us find the mean bid amount of our sample
mean(mydata_sample$Bid.Amount)
## Let us repeat the process few more times


## Let us repeat the experiment for 1000 times and store their mean age
## Let us first create a dataframe to store the data
rand_sample <- data.frame(mean_bid = 0.00)

## Let us check the dataframe we have created
rand_sample

## Loop the program 1000 times
for (i in 1:1000) {
  mydata_sample <- mydata[sample(1:nrow(mydata),50,replace=F),]
  rand_sample[i,1] <- mean(mydata_sample$Bid.Amount)
}

## Let us see the top rows of rand_sample
head(rand_sample)

## Let us find the mean of the mean bid in rand_sample
mean(rand_sample$mean_bid)
## Note that the mean of mean bid amount of samples is almost equal to the mean 
## bid amount of the original dataset i.e. the population

## Let us plot the mean bid amount of the 1000 samples as a histogram
hist(rand_sample$mean_bid,main="Sampling distribution (N=50)",xlab="mean=138.44",ylab="",las=1)






#### Statistical Hypothesis Tests

## One sample Tests

## One sample t-test

## let us load the weight of the 8 sample cricket balls into an object
cric_ball <- c(160.39, 160.64, 160.13, 160.53, 160.86, 161.89, 160.51, 162.43)

## we are going to use the t.test command
## get help for the t.test command
?t.test

## we are going to test the hypothesis that the population mean is 161
## Let us have our significance level at 0.05
## If the p-value is less than 0.05, we will reject the null hypothesis
## and say the mean value of the cricket balls produced by the factory is not 161
## we need 95% confidence interval for the estimated population mean

t.test(cric_ball,mu=161,alternative="two.sided",conf.level=0.95)
## alternative is two.sided because, the weight of the cricket ball should not be
## less or greater than the prescribed value
## Note that the degrees of freedom is 7 (since n=8)
## p-value gives the probability of finding a sample like the one we have if the
## actual population mean is 161
## Since the probability is very high (greater than our significance level), we 
## cannot reject the null hypothesis

## Let us store the t.test in an object
one_samp_t <- t.test(cric_ball,mu=161,alternative="two.sided",conf.level=0.95)

## We can find the attributes  
attributes(one_samp_t)

## if we are interested only in the p-value
one_samp_t$p.value


## Now let us see another example
## Lets consider the chips packet example
## The manufacturer claims that the average amount of saturated fat in each packet
## is not more than 10 g
## Let us buy 10 packets of chips from a store and measure the saturated fat 
## content in each packet
## The values are 11.04, 12.36, 13.04, 9.68, 10.99, 10.30, 12.47, 12.57, 9.57 and
## 9.07
## Let us store the values in an object
chips_fat <- c(11.04, 12.36, 13.04, 9.68, 10.99, 10.30, 12.47, 12.57, 9.57, 9.07)

## Here null hypothesis is mu <= 10, alternate is mu > 10
## Let us do the t.test
## our significance level is 0.05
t.test(chips_fat, mu=10, alternative="greater",conf.level=0.95)

## we can see that the p-value is less than our significance level
## so we reject the null hypothesis
## the true average of saturated fat in each packet is more than 10g
## notice the confidence interval, one side we have infinity because we have 
## decclared the alternative as greater 


## Single sample z-test

## Load the library BSDA
library(BSDA)

## load the height_12 file into an object
height_12 <- read.csv('height_12.csv')

## check the top rows of height_12
head(height_12)

## we are interested in boy's height
## we want to check whether the population mean of 12-year old boys height is 150
## Remember that for z-test we need to know the population standard deviation
## we don't know the population sd. But since the number of observations
## in sample is large, we can substitute sample sd as population sd

## Find sample sd and store it in an object
sample_sd <- sd(height_12$boys)

## z-test
z.test(height_12$boys,mu=150,alte="two.sided",sigma.x=sample_sd,conf.level=0.95)
## p-value is very low and hence we reject the null hypothesis


## Chi-square test for variance

## our null hypothesis is: standard deviation = 2.6 cm
## we need to write this is terms of variance: variance = 2.6^2 = 6.76

## Load the package EnvStats
library(EnvStats)

## Check the function varTest
?varTest

## Run the chi-square test for variance
varTest(height_12$boys, alte="two.sided", conf=0.95, sigma.squared=6.76)
## p-value is very low (less than significance level)
## Hence we reject the null hypothesis that the population standard deviation
## is 2.6 cm or population variance is 6.76


## One sample proportion test

## x denotes the number of successes, n denotes the total number of observations
## or trials, p denotes the probability of success i.e. null hypothesis
prop.test(x=513, n=1000, p=0.55, alte="less", conf.level=0.95,correct=F)
## p-value is less than 0.05 hence we reject the null hypothesis


## two sample t-test

## loading the data into a dataframe
a <- c(159.17, 159.86, 159.77, 161.19, 159.25, 159.31, 161.75, 160.45, 162.80, 159.54)
b <- c(154.47, 159.66, 161.11, 160.82, 161.49, 159.16, 158.89, 163.73, 160.77, 158.20)
two_mean_t <- data.frame(machine1 = a, machine2 = b)

## check the data frame
two_mean_t

## null hypothesis is that the difference between the two population means is
## not significant
## in other words mu1 - mu2 = 0
## alternate hypothesis mu1 - mu2 is not equal to 0
t.test(two_mean_t$machine1,two_mean_t$machine2)
## p-value is high, so we can't reject the null hypothesis


## two sample z-test

## Load the library BSDA
library(BSDA)
## load the height_12 file into an object
height_12 <- read.csv('height_12.csv')

## We need to calculate the population standard deviation of both boys and girls
## population sd is unknown
## since sample size is large (1000), we can approximate sample sd as population sd
boys_sd <- sd(height_12$boys)
girls_sd <- sd(height_12$girls)

## null hypothesis is that there is no significant difference between the mean
## heights of boys and girls i.e. mu1 = mu2
z.test(height_12$boys, height_12$girls, sigma.x=boys_sd, sigma.y=girls_sd)
## p-value is very low and so we reject the null hypotheis
## there is significant difference between the mean heights of boys and girls


# paired t-test

## load blood glucose data
blood_glu <- read.csv('blood_glu.csv')

## check the data
blood_glu

## null hypothesis is that there is no significant difference in blood glucose
## levels before and after taking drugs i.e. mu1 - mu2 = 0
t.test(blood_glu$before,blood_glu$after, paired=T)
## p-value is very low, so we reject the null hypothesis
## i.e. the drug has some effect on the blood glucose level


## two sample proportion test

## number of successes for machine 1 = 250-31 = 219
## number of successes for machine 2 = 300-42 = 258
prop.test(x=c(219,258),n=c(250,300),correct=F)
## p-value is higher so we accept the null hypothesis that there is no 
## significant difference between the two machines on the proportion of 
## defective products 



## F-test

## load the height_12 file into an object
height_12 <- read.csv('height_12.csv')

## null hypothesis is that there is no significant difference between the 
## variance in height of boys and girls
var.test(height_12$boys,height_12$girls)
## significance level is very low and hence we reject null hypothesis
## there is significant difference in the variance



## ANOVA

## load the height_12 file into an object
height_12 <- read.csv('height_12.csv')

## Let us do a boxplot of height of boys in different states
boxplot(height_12$boys ~ height_12$State)

## our null hypothesis is that the mean across all the states are same
##H0: mu1 = mu2 = mu3 = mu4 = mu5
anova_test1 <- aov(height_12$boys ~ height_12$State)
summary(anova_test1)
## p-value is very low and hence we reject the null hypothesis
## mean height of 12 year old boys within states are not equal
## now we know that the means are different
## but we don't know which of the five means are different
## to know this we need to do a tukey hsd test
TukeyHSD(anova_test1)
## from p-values, we can find out which combinations are equal and
## which are not



## Chi-square test for independence

## let us load the data into a dataframe
colour <- read.csv('colour_pref.csv')

## check top rows of data
head(colour)

## make a contingency table
colour_tab <- table(colour$gender,colour$preference)

## our null hypothesis is that gender and colour preference are independent
## let us set a alpha value of 0.05
chisq.test(colour_tab)
## p-value is very low and hence we reject the null hypothesis
## colour preference and gender have strong dependency

## expected will give you the count given that the null hypothesis is true
chisq.test(colour_tab)$expected

#### Confidence intervals

## Loading sample data1
sample1 <- c(5.23, 5.04, 4.94, 4.97, 5.02)

## Let us see the summary
summary(sample1)

## Let us calculate and store the mean of sample1
mean_sample1 <- mean(sample1)

## Let us calculate and store the standard deviation of sample1 
sd_sample1 <- sd(sample1)

## Let us calculate the standard error
sderror_sample1 <- sd_sample1/sqrt(5)

## Store the t-value
tval_sample1 <- 2.132

## calculate the margin of error
corfac_sample1 <- tval_sample1*sderror_sample1

## Finding the confidence intervals
mean_sample1 - corfac_sample1
mean_sample1 + corfac_sample1

## We can do the same using the function t.test
t.test(sample1,conf.level=.9)

## let us calculate the confidence level for the next sample
sample2 <- c(5.04, 4.94, 4.97, 5.02, 4.78)

## find the confidence interval for the mean
t.test(sample2,conf.level=.9)

## Confidence interval for proportions
prop.test(x=582,n=1000,conf.level=.9)
