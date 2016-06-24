
#### covariance

## Readind devner data
denver <- read.csv('denver.csv',stringsAsFactors = F)

## check the top rows of denver
head(denver)

## count the number of rows
nrow(denver)

## let us take a scatter plot of free lunch program participation and crime rate
plot(denver$pc_freelunch, denver$crime_rate)

## there is one outlier here crime rate more than 600. let us remove that
denver <- denver [denver$crime_rate < 600,]

## Let us do the plot again
plot(denver$pc_freelunch, denver$crime_rate)
## if more children participate in free lunch program in school, it indicates
## more poverty and hence more crime rate

## let us find the covariance
cov(denver$pc_freelunch,denver$crime_rate)
## covariance is positive and hence there is a positive relationship between
## free lunch participation and crime rate
## more free lunch participation means more crime, less participation means 
## less crime 

## let us plot total_pop and crime rate
plot (denver$total_pop, denver$crime_rate)
## there is little bit of a downward trend
## may be less populated areas are less policed and hence more crime rate
## sparsely populated areas are tend to be more crime prone

## let us find the covariance
cov(denver$total_pop, denver$crime_rate)
## negative covariance confirms negative relationship

## co-variance can be found for all variables as a matrix
cov(denver)



#### Correlation

## correlation between free lunch participation and crime rate
## if more children participate in free lunch program in school, it indicates
## more poverty and hence more crime rate
cor(denver$pc_freelunch, denver$crime_rate)

## correlation between total population and crime rate
cor(denver$total_pop,denver$crime_rate)
## if the population is more, then crime rate is less

## correlation can be found for all variables as a matrix
cor(denver)



#### Simple Linear Regression

## Let us load the denver data and remove the outlier in crime rate
denver <- read.csv('denver.csv',stringsAsFactors=F)
denver <- denver [denver$crime_rate < 600,]

## Let us plot percentage participation in free lunch and crime rate
plot (denver$pc_freelunch,denver$crime_rate)

## Let us build a model with crime rate as dependent variable and free lunch
## participation percentage as independent variable
myfit <- lm(crime_rate ~ pc_freelunch, data=denver)

## Let us draw the regression line in the graph
abline(myfit)

## Let us have a look at the fit
myfit
## intercept gives the beta 0 value and denver$ccrime_rate gives the beta 1 value
## now our model is crime_rate = 31.77 + 1.24 * pc_freelunch

## Let us see the summary
summary(myfit)

## coefficients can be called by the following command
myfit$coefficients

## let us have a look at the fitted values
myfit$fitted.values

## let us have a look at the residuals
myfit$residuals

## let us plot residuals vs percentage free lunch
plot(denver$pc_freelunch, myfit$residuals)

## let us do a histogram of residuals
hist(myfit$residuals)
## this is not quite normally distributed but the mean is close to 0
## in most practical cases error will not be perfectly normal

## now using the model, we can tell what is the crime_rate when we are given the
## pc_freelunch
## let us calculate the crime_rate for the following PC_freelunch values
## 47.49, 63.29, 25.82, 28.50, 41.34
## calculate the manually

## we can also do this in R using the predict command
## first let us save the values in a dataframe
pred_crime <- data.frame(pc_freelunch =c(47.49, 23.29, 25.82, 28.50, 41.34))

## check the data frame
pred_crime

## predict the crime_rate for the dataset
predict(myfit,pred_crime,type="response")
## the values give the crime_rate for the various pc_freelunch values

## we can store the predicted values in the data frame
pred_crime$crime_rate <- predict(myfit,pred_crime,type="response")

## check the data frame
pred_crime

## write the data frame as a csv
write.csv(pred_crime, 'pred_crime.csv', row.names=F)




## Let us load the galton data
height <- read.csv ('galton.csv',stringsAsFactors=F)

## check the top rows
head(height)

## Count the number of rows
nrow(height)

## let us check the height of Father
summary(height$Father)

## There are many kids in a single family
## let us compare the mean height of every kid with the height of the father
## use tapply command to select mean for every family
tapply(height$Height,height$Family, mean)
## we need to store it in a dataframe

## Now let us add Father height to the dataframe height_mean
## first let us select all the father's height by 
father <- data.frame(Father=tapply(height$Father,height$Family,max))

## check the dataframe father
head(father)

## family no is stored in dimnames
dimnames(father)[[1]]

## let us add family no to the father dataframe
father$Family <- dimnames(father)[[1]]

## check the data again
head(father)

## let us take the mean height of kids in the same fashion
mean_kid <- data.frame(mean_k=tapply(height$Height,height$Family,mean))

## let us check mean_kid
head(mean_kid)

## we need to add family no
mean_kid$Family <- dimnames(mean_kid)[[1]]

## let us count the number of rows in mean_kid and father
nrow(mean_kid)
nrow(father)

## we need to merge the mean_kid and father dataframes
height_mean <- merge(x=father,y=mean_kid,by="Family")

## let us check the height_mean dataframe
head(height_mean)

## let us randomly check two families
height[height$Family==10,]
height[height$Family==103,]
mean(height$Height[height$Family==103])

## let us plot fathers height vs mean height of kids
plot(height_mean$Father,height_mean$mean_k)

## let us do a linear fit
myfit1 <- lm(mean_k ~ Father, data=height_mean)

## draw the regression line
abline(myfit1)

## let us see the summary of our fit
summary(myfit1)
## now calculate manuallthe kids hieght using the model for father's height=66.9

## let us plot the residuals vs father height
plot (height_mean$Father, myfit1$residuals)
## variance of error is not exactly the same across all the range of father height

## let us do a histogram of the errors
hist(myfit1$residuals)

## now we want to predict the height of kids of 10 couples
## let us load the data
height1 <- read.csv('Galton_pred.csv',stringsAsFactors = F)

## let us check the data
head(height1)

## let us do the prediction now
predict(myfit1,newdata=height1)

## lets store the prediction in a column in height1
height1$Kids <- predict(myfit1,newdata=height1)

## let us check the predictions
height1





#### Multiple Linear Regression

## Load boston data
boston <- read.csv("Boston.csv",stringsAsFactors  = F)

## Check the data
head(boston)

## count the rows
nrow(boston)

## let us do some plots
plot(boston)
## lstat, rm and nox seems to have linear relationship with medv

## Let us see the correlation
cor(boston)
## lstat, rm and indus have more correlation with medv

## let us do a multiple linear regression between medv and lstat,rm
myfit2 <- lm(medv ~ lstat + rm, data=boston)

## let us see the summay of fit
summary(myfit2)
## now our model is medv = -1.36 -0.64 * lstat + 5.09 * rm
## find the value of medv for lstat = 11.36, rm = 6.208

## let us store the values in a data frame
boston_pred <- data.frame(lstat=11.36, rm=6.208)

## check the data frame
boston_pred

## let us predict
predict(myfit2,boston_pred,type='response')
## the predicted value of medv is 22.97

## let us add nox as well
myfit3 <- lm(medv ~ lstat + rm + nox, data=boston)

## let us see the summary of the fit
summary(myfit3)
## look at the Pr(>|t|) of nox. it is more than 0.05 and hence it is not an 
## important variable

## let us remove nox and add indus
myfit4 <- lm(medv ~ lstat + rm + indus, data=boston)

## let us see the summary of the fit
summary(myfit4)

## let us remove indus and add age
myfit5 <- lm(medv ~ lstat + rm + age, data=boston)

## let us see the summary of the fit
summary(myfit5)

## let us use all the variables and build a model
myfit6 <- lm (medv ~ ., data=boston)

## let us see the summary of the fit
summary(myfit6)






## using categorical variables as predictor variables
## load the library DMwR
library(DMwR)

## load the dataset algae
## dataset algae is part of the package DMwR
## it is preloaded
data(algae)

## check the top rows of algae
head(algae)


## to know more about algae dataset, use help
?algae


## check the structure of the dataframe
str(algae)
## first 3 variables are categorical variables and are stored as factors
## before using any categorical variable as a predictor variable, we need to
## declare them as factors

## let us see how the variable sesaon is stored 
contrasts(algae$season)
## one variable which has four categories is actually stored as 3 variables
## for autumn, all the three variables are 0
## for spring only spring is 1, for summer only summer is 1 and for 
## winter only wineter is 1
## in general if there are n categories in a variables, R will store the variabe
## in n-1 dummy variables

## let us fit a multiple linear regression, using the variables
## season, mxPH, mnO2, Cl, NO3, NH4, oPO4, PO4 and Chla to predict a1
myfit <- lm(a1 ~ season + mxPH + mnO2 + Cl + NO3 + NH4 + oPO4 + PO4 + Chla, data=algae)

## let us see the summary of the fit
summary(myfit)
## in the summary you can see the three dummy variables 






#### Evaluation Criteria

## Mean Squared Error

## load the package Metrics
require(Metrics)

## Find the MSE of myfit1
mse(height$Height, myfit1$fitted.values)

## R-squared and adjusted R-squared can be found from the summary of fit
summary(myfit)
## R-squared is .39. Therefore only 39% of the variation in the original data
## is explained by the model. In other words the percentage participation in 
## free lunch explains only 39% of crime rate

## Mallows cp

## Load the library locfit
library(locfit)

## let us find the cp for lm fit
cp(myfit)


## t-test

## Load boston data
boston <- read.csv("Boston.csv",stringsAsFactors  = F)

## make a fit with all the variables
myfit <- lm(medv ~ .,data=boston)

## let us see the summary
summary(myfit)
## the Pr(>|t|) gives the p-value of the t-test for each coefficient
## Each probability for each variable gives us the p-value for the hypothesis
## that the coefficient of that variable is 0
## for example the value against chas gives the p-value for the t-test
## with null hypothesis H0:beta(chas) = 0
## we can eliminate X and indus from our model since both have p-value greater
## than alpha level 0.05


## Partial F-test

## Let us use all variables except chas and fit a model
myfit1 <- lm(medv ~. -chas,data=boston)

## let us do a partial F-test with myfit and myfit1
anova(myfit,myfit1)
## notice that the p-value corresponds to the p-value of t-test against chas

## now let us remove chas, X and indus from out model
myfit2 <- lm(medv ~. -chas - X - indus, data=boston)

## let us do a partial F-test using the models myfit and myfit2
anova(myfit,myfit2)
## the p-value gives us the p-value for the test with null hypothesis: 
## coefficients of chas, X and indus all are 0






#### Backward elemination

## we are going to use the boston data
## let us load the boston data
boston <- read.csv("Boston.csv",stringsAsFactors  = F)

## we are going to build a model to predicct medv
## let us build a model with all the variables
back1 <- lm(medv ~ ., data=boston)

## let us check the summary of the fit
summary(back1)
## out of all the variables, age has the hightest p-value and the p-value is
## greater than the alpha level (0.05)

## let us remove age and build a model
back2 <- lm(medv ~. -age, data=boston)

## let us check the summary of the fit
summary(back2)
## now indus is the next variable with the highest p-value

## let us remove indus and build a model
back3 <- lm(medv ~ . -age -indus, data=boston)

## let us check the summary of the fit
summary(back3)
## now crim is the next variable with the highest p-value

## let us remove crim and build a model
back4 <- lm(medv ~. -age -indus -crim, data=boston)

## let us checck the summary of the fit
summary(back4)
## now X is the next variable with the highest p-value

## let us remove X and build a model
back5 <- lm(medv ~. -age -indus -crim -X, data=boston)

## let us check the summary of the fit
summary(back5)
## now all the variables have the p-values less than the alpha level 0.05
## hence we stop here and back5 is the best fit as per backward elimination
## the selected variables are zn, chas, nox, rm, dis, rad, tax, ptratio, black
## and lstat
## note: if two p-values are equal and we are unable to select between the two,
## then we need to consider additional statistic like residual error
## out of the two, we need to select the variable with the lesser residual error






## forward selection

## let us use denver data
denver <- read.csv('denver.csv',stringsAsFactors=F)

## here we are going to predict crime rate
## in forward selection we start with a null model
## now we need to check all the possible variables

forw1 <- lm(crime_rate ~ total_pop, data=denver)
summary(forw1)
## total_pop has a p-value of 0.0163

forw2 <- lm(crime_rate ~ pc_pop, data=denver)
summary(forw2)
## pc_pop has a p-value of 0.0856

forw3 <- lm(crime_rate ~ pc_u18, data=denver)
summary(forw3)
## pc_u18 has a p-value of 0.063818

forw4 <- lm(crime_rate ~ pc_freelunch, data=denver)
summary(forw4)
## pc_freelunch has a p-value of 0.00503

forw5 <- lm(crime_rate ~ pc_income, data=denver)
summary(forw5)
## pc_income has a p-value of 0.00601

forw6 <- lm(crime_rate ~ pc_crime, data=denver)
summary(forw6)
## pc_crime has a p-value of 0.108


## out of the 6 variables pc_freelunch has the best p-value
## we add pc_freelunch to our model
## now we need to add second variable
## we fit all possible variables and find the best
model1 <- lm(crime_rate ~ pc_freelunch, data=denver)
summary(model1)

forw1 <- lm(crime_rate ~ pc_freelunch +total_pop, data=denver)
summary(forw1)
## total_pop has a p-value of 0.0109

forw2 <- lm(crime_rate ~ pc_freelunch +pc_pop, data=denver)
summary(forw2)
## pc_pop has a p-value of 0.05967

forw3 <- lm(crime_rate ~ pc_freelunch +pc_u18, data=denver)
summary(forw3)
## pc_u18 has a p-value of 6.01e-05

forw5 <- lm(crime_rate ~ pc_freelunch + pc_income, data=denver)
summary(forw5)
## pc_income has a p-value of 0.00315

forw6 <- lm(crime_rate ~ pc_freelunch +pc_crime, data=denver)
summary(forw6)
## pc_crime has a p-value of 0.3546

## out of the remaining 5 variables, pc_u18 has the best p-value in the presence
## of pc_freelunch
## we add pc_u18 in the model and check for the next best variable
model2 <- lm(crime_rate ~ pc_freelunch + pc_u18, data=denver)
summary(model2)


forw1 <- lm(crime_rate ~ pc_freelunch + pc_u18 +total_pop, data=denver)
summary(forw1)
## total_pop has a p-value of 0.028448

forw2 <- lm(crime_rate ~ pc_freelunch + pc_u18 +pc_pop, data=denver)
summary(forw2)
## pc_pop has a p-value of 0.004240

forw5 <- lm(crime_rate ~ pc_freelunch + pc_u18 +pc_income, data=denver)
summary(forw5)
## pc_income has a p-value of 0.000797

forw6 <- lm(crime_rate ~ pc_freelunch + pc_u18 + pc_crime, data=denver)
summary(forw6)
## pc_crime has a p-value of 0.125022


## in this iteration we select pc_income
model3 <- lm(crime_rate ~ pc_freelunch + pc_u18 + pc_income, data=denver)
summary(model3)

forw1 <- lm(crime_rate ~ pc_freelunch + pc_u18 + pc_income +total_pop, data=denver)
summary(forw1)
## total_pop has a p-value of 0.02527

forw2 <- lm(crime_rate ~ pc_freelunch + pc_u18 +pc_income + pc_pop, data=denver)
summary(forw2)
## pc_pop has a p-value of 0.0771

forw6 <- lm(crime_rate ~ pc_freelunch + pc_u18 + pc_income +pc_crime, data=denver)
summary(forw6)
## pc_crime has a p-value of 0.095834

## in this iteration we select total_pop
model4 <- lm(crime_rate ~ pc_freelunch + pc_u18 + pc_income + total_pop, data=denver)
summary(model4)


forw2 <- lm(crime_rate ~ pc_freelunch + pc_u18 +pc_income +total_pop+ pc_pop, data=denver)
summary(forw2)
## pc_pop has a p-value of 0.15008

forw6 <- lm(crime_rate ~ pc_freelunch + pc_u18 + pc_income +total_pop+pc_crime, data=denver)
summary(forw6)
## pc_crime has a p-value of 0.307569

## none of the two variables have p-value greater than alpha 0.05
## hence our final model according to forward selection is 
forw <- lm(crime_rate ~ pc_freelunch + pc_u18 + pc_income + total_pop +pc_crime, data=denver)
summary(forw)




## multicollinearity


## vif


## load the library DMwR
library(DMwR)

## load the dataset algae
## dataset algae is part of the package DMwR
## it is preloaded
data(algae)

## take help for algae dataset
?algae

## check the data
head(algae)

## count the number of rows
nrow(algae)

## we are not interested in the first 3 columns
## let us remove them
algae <- algae[,-(1:3)]

## let us check the data again
head(algae)

## let us load the library car
library(car)

## let us build a model to predict a1
myfit <- lm(a1 ~ mxPH + mnO2 + Cl + NO3 + NH4 + oPO4 + PO4 + Chla, data=algae)

## let us check the summary of myfit
summary(myfit)

## let us check the variance inflation factor
vif (myfit)

## oPO4 has the highest vif
## so let us remove it from the model
myfit1 <- lm(a1 ~ mxPH + mnO2 + Cl + NO3 + NH4 + PO4 + Chla, data=algae)

## let us check the summary of myfit
summary(myfit1)

## let us check the variance inflation factor
vif (myfit1)
## all vif are below 5. hence we stop here.
## if any of the variable still has vif more than 5, remove it and repeat the
## proccess

## let us see how vif is calculated
vif(myfit)
## here there are 9 predictor variables
## let us find the vif of PO4
## select PO4 as the dependent variable and the rest 8 variables as 
## independent variables and build a linear fit

myfit3 <- lm(PO4 ~ mxPH + mnO2 + Cl + NO3 + NH4 + oPO4 + Chla, data=algae)

## let us check the coefficient of determination
summary(myfit3)
## coefficient of determination is 0.8761
## let us find the vif value

## how to extract R squared and use it in our calculation?
names(summary(myfit3))
summary(myfit3)$r.squared

## let us calculate the vif value
1/(1-summary(myfit3)$r.squared)
## this value is equal to the vif calculated using the vif functions




#### Handling Outliers


## Cook's Distance

## let us load the library car
library(car)

## let us load the dataset mtcars
data(mtcars)

## check the top rows of mtcars
head(mtcars)

## get help for mtcars
?mtcars

## let us fit a linear model using the variables disp, hp, wt and drat to
## predict mpg
myfit <- lm(mpg~disp+hp+wt+drat, data=mtcars)

## let us calculate and store the cutoff value
cutoff <- 4/((nrow(mtcars)-4)-1) 

## find cook's distance
cooks.distance(myfit)

## plot cook's distance
plot(cooks.distance(myfit))

## let us draw the cut-off line
abline(h=cutoff,lty=2)
## lty is line type
## we can find from the plot that there are 2 observations above the cutoff
## let us assume that those two points are due to measurement errors
## we need to remove them from our model

## you can use identify command to find the points
identify(cooks.distance(myfit))
## after the command, click on the two points (outliers)
## click finish button in the graph screen
## now row numbers 17 and 31 are outliers in mtcars
## let us remove them and build a model

mtcars1 <- mtcars[c(-17,-31),]

## count the number of rows
nrow(mtcars1)
## note that count is reduced by 2, since we have removed 2 rows

## let us build our model again with the new data
myfit1 <- lm(mpg~disp+hp+wt+drat, data=mtcars1)

## let us calculate and store the new cutoff value
cutoff1 <- 4/((nrow(mtcars1)-4)-1) 

## plot cook's distance
plot(cooks.distance(myfit1))

## let us draw the cut-off line
abline(h=cutoff1,lty=2)
## we don't see the cutoff line because all points lie below the cutoff line

## check the cutoff value
cutoff1

## check the maximum value of cooks distance
max(cooks.distance(myfit1))
## now we have effectively removed influential observations





#### Feature Selection

# Principal Component Analysis
#http://www.r-bloggers.com/computing-and-visualizing-pca-in-r/

# load iris data
data(iris)
head(iris, 3)

# log transform
log.ir <- log(iris[, 1:4])
ir.species <- iris[, 5]

# apply pca
ir.pca <- prcomp(log.ir, center = TRUE, scale. = TRUE)

# analyzing the results
print(ir.pca)

# plot method
plot(ir.pca, type = "l")

# summary method
summary(ir.pca)

# We can use the predict function if we observe new data and want to predict their PCs values. 
# Just for illustration pretend the last two rows of the iris data has just arrived and we want to see what is their PCs values

# Predict PCs
predict(ir.pca, newdata=tail(log.ir, 2))

# PCA on caret package
require(caret)
trans = preProcess(iris[,1:4], method=c("BoxCox", "center", "scale", "pca"))
PC = predict(trans, iris[,1:4])
# By default, the function keeps only the PCs that are necessary to explain at least 95% of the variability in the data, 
# but this can be changed through the argument thresh

# Retained PCs
head(PC, 3)

# Loadings
trans$rotation