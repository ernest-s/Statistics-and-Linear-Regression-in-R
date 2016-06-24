## Mathematical Operators

1+1

3*5

4-1

3.1-4

3.1 - 2.1

7/5

sqrt(16)




## assign the value of 231 to x
x <- 231

## print x
print(x)

## If you just type x it will autoprint x
x

## you can use the variable x in numerical operations
x +1

x+1750






#### Data types





## character
## character needs to be enclosed in quotes
name <- 'Ernest'
name
## we can use either single quotes '' or double quotes ""

## to know about the data type use the command str
## helps to find the class
class(name)

## integer
age <- 25
class(age)
## R stores integers as numbers by default
## if we want specifically store it as an integer, we need to use as.integer
age <- as.integer(25)
class(age)
age/7






## numeric
weight <- 69.75
weight
class(weight)





## Complex
complex1 <- 3 + 2i
complex1
class(complex1)





## Logical (true or false)
result <- TRUE
class(result)
## just T is enough for TRUE and F is enough for FALSE
result <- T
result
result <- FALSE
result





## Date
dob <- 1990/04/23
dob
## the above is a wrong way of entering date

dob <- as.Date("1990/04/23")
dob
class(dob)

## let us store the date 2012-01-01 in an object
x <- as.Date("2012-01-01")
x

## let us unclass x
unclass(x)
## gives the number of days after 01 jan 1970
## Date starts with 01 jan 1970. 02 jan 1970 is stored as 2 and so on.
## Time is seconds past 01 jan 1970

## let us verify
a <- ("1970-01-01")
a <- as.Date(a)
x-a

## let us store date in another format
end_date <- '01-11-2016'
end_date

## let us convert it to date
end_date <- as.Date(end_date)
end_date
## we haven't given the date in the default format
## let us start over again

end_date <- '01-11-2016'
end_date <- as.Date(end_date,format="%d-%m-%Y")
end_date
## now R has recognized correctly

## let us see the structure of end_date
str(end_date)

## Date formats
## %d - days (01-31)
## %a - weekday (Mon, Tue, Wed.)
## %A - weekday (Monday, Tuesday, Wednesday.)
## %m - month (01-12)
## %b - month (Jan, Feb, Mar.)
## %B - month (January, February, March.)
## %y - year (07, 14..)
## %Y - year (2007, 2015.)







#### Vector





## numeric vector
nums <- c(2,3,4,5,2.5,4,5)
nums
str(nums)
print(nums)


## add 1 to every element of the vector
nums + 1

## store the values 1 to 10 in a vector
store <- c(1,2,3,4,5,6,7,8,9,10)
store <- c(1:10)
## both the above ways are the same

## store numbers from 34 to 73 in a vector x1
x1 <- 34:73
x1

## head() command will fetch you the first 6 elements
head(x1)

## you can also specify the number of records to be fetched using head()
head(x1,10)

## tail() will fetch you last 6 elements
tail(x1)

## to find the number of elements in a vector
length(x1)

## find the maximum & minimum value of a vector
max(x1)
min(x1)

## summary will give you 5 number summary of the data
summary(x1)






## character vector

names <- c('Ernest','Kumar','Mark','Sandya','Kalyan')
names

## to find the structure use str command
str(names)
class(names)
max(names)
names +1
## we are getting an error because we can't do arithmetic operations on character


## try to create a empty character vector
x <- vector("character", length=10)
x

## check whether a vector is character
is.character(names)

## you can store the output to an object
char_or_not <- is.character(names)
char_or_not
class(char_or_not)

## check whether char_or_not is logical
is.logical(char_or_not)




## vector of complex numbers
x <- c(3+0i,4+7i)

## to create an empty vectors of lentgh 10
x <- vector("complex",length=10)
x
class(x)
length(x)







## vector of logical variables
x <- c(TRUE,FALSE,TRUE,TRUE)
class(x)
x <- c(true, false)
x <- c(True, False)
x <- c("TRUE","FALSE")
class(x)
## if given under quotations, logical element will be stored as character





## Automatic coercion by R




## enter a numeric and character value into a vector
x <- c('A',1.7)
class(x)
x
## here number is coerced as a character by R


## enter a logical and character value into a vector
x <- c(T,'A')
class(x)
x
## here logical variable is coerced into a character

## enter a logical value and a numeric value into a vector
x <- (TRUE,7)
## R is unable to coerce a logical value and a numeric value






## Explicit coercion





## logical to numeric
x <- c(T,T,F,F,T,F,F,F,T)
x
class(x)
str(x)
## convert this into a numeric vector
as.numeric(x)
as.integer(x)
## R stores TRUE as 1 and FALSE as 0


## numeric to logical
x <- c(0,1,1,0,0,1,0,1)
class(x)
## convert this to a logical vector
as.logical(x)
## 0s are converted as FALSE and 1s as TRUE
x <- c(0,1,1,0,0,1,0,23)
as.logical(x)
## anything not equal to 0 will be TRUE


## numeric to character
x <- c(0,1,1,0,0,1,0,1)
x
as.character(x)


## logical to character
z <- c(T,F,T,T,T,F,T,T,T)
class(z)
as.character(z)


## logical to numeric
y <- as.numeric(z)
y


## convert back to logical
as.logical(y)


## character to numeric
names
as.numeric(names)
## we get NAs because character can't be converted to numeric

## we store the above result in an object
char2num <- as.numeric(names)
char2num

## Validate which of the elements of char2num are NAs
is.na(char2num)






#### Acccessing elements of a vector




## to select an element of a vector use []
x[1]
x[7]
x[21]
names[2]
## display 2nd to 4th names
names[2:4]

## to add an element to a vector use the assignment operator
names
## let us add another name 'Kohli'
## since the vector has 5 names we will add kohli as 6th name
names[6] <- 'Kohli'
names

## we can also use the assignment operator to replace any element
## let us say we actually wanted to add Dhoni instead of Kohli
names[6] <- 'Dhoni'
names

## the third name is actually Marky 
## we have wrongly entered as Mark
## change the third name
names[3] <- 'Marky'
names

## create a vector of numbers from 101 to 125 and store it in an object x
x <- 101:125
x

## extract first element of x
x[1]

## extract the 25th element of x
x[25]

## extract the first 5 elements of x
x[1:5]

## extract first element and add 1000
x[1] + 1000

## extract the 10th to 15th element and add 1000 to each of them
x[10:15] + 1000

## extract the 5th, 10th, 15th, 20th and 25th element of x
x[5,10,15,20,25]

## we can do this in the following way
series <- c(5,10,15,20,25)
x[series]










#### List



## create a list
x <- list("Ernest",25,69.5,T)
x
class(x)
str(x)

## to extract an element of a list, use [[]]
x[[2]]

## we can add a vector to a list
x <- list("Ernest",25,69.5,T,names)
x
length(x)

## let us extract the names from x
x[[5]]

## now let us say we want to extract the 4th name from x
x[[5]][4]






## Matrices

## create a matrix
a <- matrix(c(2,4,3,6,2,4),nrow=2,ncol=3)
a
## matrix is filled column wise 

## fill it row wise
a <- matrix(c(2,4,3,6,2,4),nrow=2,ncol=3,byrow=T)
a
str(a)

## elements of a matrix can be accessed by specifying row and column no
a[1,2]

## to extract all elements of the 2nd row
a[2,]

## to extract all elements of the 3rd column
a[,3]

## to extract second and third column
a[,2:3]

## to extract first and third column
a[,c(1,3)]

## check the attributes of a
attributes(a)

## we can add row names and column names
dimnames(a) <- list(c('row1','row2'),c('col1','col2','col3'))
a
attributes(a)
a['row2','col3']

## we can bind two vectors to form a matrix
names
age <- c(25,31,24,22,31,35)
matrix1 <- cbind(names,age)
matrix1
str(matrix1)
## note that numeric column age has been coerced to character

## we can also create a matrix using rbind
e <- c(1,2,3)
f <- c(4,5,6)
matrix2 <- rbind(e,f)
matrix2

## if two vectors of different lengths are combined, the shorter row is repeated
e <- c(1,2,3)
f <- c(4,5,6,7,9,8)
matrix3 <- rbind(e,f)
matrix3


## if two vectors off different lengths are combined, and the shorter row is
## not a multiple of the longer row, then warning message is issued
e <- c(1,2,3)
f <- c(4,5,6,7,9)
matrix4 <- rbind(e,f)
matrix4






#### Factors




## unordered factor
x <- factor (c ("Male", "Female", "Male", "Female", "Female", "Female"))
x
class(x)
unclass(x)
## 'Female' is assigned value 1 and 'Male' is assigned value 2 because 
## 'Female' comes first in the alphabetical order




## ordered factor
x <- factor(c('Analyst','Senior Analyst','Junior Analyst','Analyst'))
x
unclass(x)
## we need to change the order
x <- factor(c('Analyst','Senior Analyst','Junior Analyst','Analyst'), 
            levels =c("Junior Analyst","Analyst","Senior Analyst"))
x
unclass(x)
## we can see counts by table() command
table(x)






#### Missing Values

x1 <- c(1,2,NA,4,NA,6,7)
## construct a vector with 5 Nos and 2 NAs

## is.na() command will tell you whether an element is NA or not
is.na(x1)
## notice that the output is a logical vector which has TRUE for NA values


## is.nan() command will tell you whether an element is a number or not
is.nan(x1)
## R considers even NA as a number in a numeric vector


x2 <- c(1,2,3,NA,5,6,0)
## construct the above numeric vector

## divide the above numeric vector by 0 and store the result in another vector
x3 <- x2/0

## now find how many of the elements of x3 are NaN
is.nan(x3)
## Inf, NA are considered numbers where 0/0 is considered as NaN

## find how many are NAs in x3
is.na(x3)
## notice that NaN is also considered as NA






#### Data Frames

names
age
weight <- c(69.5,80.6,54.3,48.5,79.0,73.5)
sex <- c("M","M","M","F","M","M")

data1 <- data.frame(Name=names,Age=age,Mass=weight,Gender=sex)
data1
class(data1)
str(data1)
attributes(data1)
## notice that name is stored as a factor but it is a character
## by default data.frame command saves character as factor
## there are two ways of doing this 
## while creating a dataframe save all strings as strings and later
## convert factors as factors
## another way is to save all characters as factors and later convert 
## strings as characters
## we will see this later


## find the number of rows and columns
nrow(data1)
ncol(data1)

## the above two commands can be combined in one command
## find the dimensions of data1
dim(data1)

## extract data from a dataframe
data1[2,3]

## we can pull rows using $ command
data1$Age

## We can get the age of the third person 
data1$Age[3]
data1[2,3]

## let us convert Name as character
data1$Name <- as.character(data1$Name)
str(data1)

## while loading the dataframe let us save everything as strings
data1 <- data.frame(Name=names,Age=age,Mass=weight,Gender=sex,
                    stringsAsFactors=F)
str(data1)
## now everything is character
## we need to change Gender to factor
data1$Gender <- as.factor(data1$Gender)
str(data1)





## Names

## create the numeric vector below
x <- c(25,69.5)

names(x)
## names is NULL because we haven't given x any names

## print the vector
x
## doesn't give you any idea about what they represent

## let us give some names to the elements
names(x) <- c('Age','Weight')

## now let us print the vector
x
## now the vector is lot more meaningful

## let us check the names of x
names(x)


## Matrix names (we have already seen this before)
## let us create a matrix
## it contains the height and weight of Ernest and Kumar
a1 <- matrix(c(25,31,69.5,80.6),ncol=2,nrow=2,byrow=T)

## print the matrix
a1

## let us assign names to the matrix
dimnames(a1) <- list(c('Ernest','Kumar'),c('Age','Weight'))

## let us print the matrix again
a1
## now the matrix has become lot more meaningful





## Exercise

## create a vector with 10 student names
names <- c ("Simbu", "Vijay", "Ajith", "Nayan", "Jothika", "Prabu", 
            "Kamal", "Rajini", "Dhanush", "Lakshmi")

## create another vector with the marks of the students in maths exam
maths_score <- c(60, 74, 56, 82, 58, 67, 95, 95, 99, 65)

## combine the above two vectors to form a data frame
maths <- data.frame (stu_name = names, score = maths_score)

## check the top 3 rows of dataframe
head(maths,3)

## check the bottom two rows
tail(maths,2)

## check the row names of the dataframe
row.names(maths)

## count the number of rows and number of columns
nrow(maths)
ncol(maths)

## check the structure of the dataframe
str(maths)

## convert names to character
maths$stu_name <- as.character(maths$stu_name)

## check the summary of marks
summary(maths$score)

## change the marks of the 7th row to 85
maths$score[7] <- 85
maths[7,2] <- 85







## Reading data

## read employees.csv data
read.csv('employees.csv')

## let us read the data and store it in an object
emp <- read.csv('employees.csv')

## let us check emp
emp
## now emp is a dataframe and you can do all manipulations 

## find number of rows
nrow(emp)

## to check the top rows
head(emp)

## find the structure of the dataframe
str(emp)

## to know more about the age (age is integer)
summary(emp$Age)

## to know more about the salary
summary(emp$Salary)

## to know more about Designation (Designation is factor)
table(emp$Designation)

## notice that name is also stored as a factor but it is a character string
## to avoid this we need to use stringsAsFactors argument
emp <- read.csv('employees.csv',stringsAsFactors=F)

## now check the structure
str(emp)
## now designation is also stored as character
## we need to change that

emp$Designation <- factor(emp$Designation)

## now use the table command again
table(emp$Designation)
str(emp)
## notice that the levels are not ordered properly
## the correct order is engineer, senior engineer, asst manager and manager

emp$Designation <- factor(emp$Designation, levels=c("Engineer",
                  "Senior Engineer","Asst. Manager","Manager"), ordered=T)

## now use the table command again
table(emp$Designation)
str(emp)

## similarly we need to convert sex to factor but without order
emp$Sex <- factor(emp$Sex)

## to know about various other arguments use help
?read.csv

## reading txt data
data1 <- read.table("emp_name.txt")

## check the top rows
head(data1)
## by default R doesn't recognize header info when we use read.table command

data1 <- read.table("emp_name.txt",header=T)

## now check the top rows
head(data1)






## writing data

## let us write the dataframe maths into a csv
write.csv(maths,'maths.csv')
## notice that R has written row names as well
## we don't need the row names

write.csv(maths,'maths.csv',row.names=F)

## let us write this as a txt file
write.table(maths,'maths.txt',row.names=F)
## by defatult the separator is space
## let us change it to - hyphen

write.table(maths,'maths.txt',row.names=F,sep="-")






#### Subsetting


weight
## extract the first element of weight
weight[1]
## the output is a vector since weight is a vector

## extract the first and third elements of weight
weight[c(1,3)]

names
## extract the first 4 elements of names
names[1:4]

## get all the elements of weight greater than 75
weight[weight>75]

## let us find whether the weight is more than 75 and store it in a vector
weight75 <- weight > 75

## let us check weight75
weight75
## we get a logical vector

## we want to get the elements of weight whose corresponding elements in
## weight75 is TRUE 
weight [weight75]

## in the maths dataframe we need a subset where score is more than 90
maths[maths$score >90,]

## if we want to store the baove in another dataframe
maths1 <- maths[maths$score >90,]

## let us say we need just the names of students who scored more than 90
maths[maths$score>90,1]
maths$stu_name[maths$score>90]

## we want to see who has scored the maximum marks
maths$stu_name[maths$score == max(maths$score)]

## let us verify the above command
max(maths$score)
maths[maths$score==99,]





## subsetting lists

## create a list with weights and ages
weight
age
list1 <- list(weight = weight,age = age)
str(list1)

## extract the weights from list1
list1[1]
list1["weight"]
## single brakcet [ ] will give you another list with element weight

list1[[1]]
list1[["weight"]]
## double bracket will give you just a sequence
list1$weight

## extract the first and second element of list1
list1[1:2]
list1[c(1,2)]

## we want to extract the fourth element of the 2nd element (age) of list1
list1[[c(2,4)]]
list1[[2]][[4]]




#### Remove missing values

## lets create a list with some NA values
a2 <- c(1,NA,2,4,6,1,NA)

## we want to remove these NAs
## first we need to create a logical vector which will tell whether the element
## is a NA or not
logi <- is.na(a2)
logi

## now filter out NA values
a2 <- a2[!logi]
## this command will remove elements from a2 which have a corresponding FALSE
## value in logi
a2

## let us create a dataframe
a3 <- data.frame(age=c(21,NA,33,42,51,NA,36,71,26), 
              weight=c(75,85,58,NA,97,65,81,64,74))
a3
## if you notice that in col1 and col2 some data are missing
## we want to select rows that has both age and weight
## for this we use complete.cases() command

a4 <- a3[complete.cases(a3),]
a4

