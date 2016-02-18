#Using the assignment operator

x<-4 #assigns the value 4 to the variable x

x #print x to the output screen

###Using comments. 

y<-"This is not in a comment" #This text will be assigned to the variable y
#y<-"This is in a comment"    #This text will not
y                             #prints y to the console

###Loading files

#Downloads the inflammation file
download.file(url="https://raw.githubusercontent.com/maglet/r-for-beginners/master/inflammation.csv",
              destfile = "inflammation.csv")

inflammation<-read.csv("inflammation.csv") #reads data from the csv file

###Accessing R help Files
help(download.file) # get R documentation for download.file function

###Inspecting your data

#Discovering R classes
class(x)
class(y)
class(inflammation)

#Displaying a data frame header
head(inflammation) #displays the first 6 elements of all columns

str(inflammation) #Displays the data frame's structure

summary(inflammation) #Calculates summary statistics for all columns

####Subsetting

day30inflammation<-inflammation$day30 #extracts data from the day 30 column

day30inflammation2<-inflammation[,32] #alternate to extract data from the day 30 column

#convince yourself that these 2 things are equivalent
day30inflammation == day30inflammation2

#a way to convince yourself with neat output
nrow(inflammation)==sum(day30inflammation == day30inflammation2)

#calculate the mean of the day 30 column
mean(day30inflammation)


### Using the apply function

#on columns
daymeans<-apply(X=inflammation[,3:32],  #the data you want to use
                MARGIN=2,               #apply the function to the columns
                FUN=mean)               #take the mean of the values

daysd<-apply(X=inflammation[,3:32],     #the data you want to use
             MARGIN=2,                  #apply the function to the colummns
             FUN=sd)                    #take the standard deviation of the columns

#on rows
ptmeans<-apply(X=inflammation[,3:32],    #the data you want to use
               MARGIN=1,                 #apply the function to rows
               FUN=mean)                 #take the mean of the rows

#####Subsetting Rows. 

inflammationF <- subset(x= inflammation,            #the data frame to subset
                 subset = (Gender == "F"))          #the factor to subset on


inflammationM <- subset(x= inflammation,            #the data frame to subset
                        subset = (Gender == "M"))   #the factor to subset on


#T test
t.test(inflammationF$day30, inflammationM$day30)

####Plotting data

#Making a histogram
hist(x=inflammation$day30,    #plots inflammation at day 30 for all patients
     main="Histogram of Inflammation level on day 30", #main title
     xlab="Inflammation level",                        #x axis label
     ylab="Frequency",                                 #y axis label
     col="blue")                                       #color


#making a bar chart
barplot(height=daymeans,                     #height of the bars 
        main="Mean inflammation over time",  #main graph title
        xlab="Days post vaccine",            #x axis label
        ylab="Mean Inflammation")            #y axis label

But wait, where are the error bars? This requires some extra code.

#adding error bats
error.bar <- function(x, # the bar plot
                      y, #daily means
                      upper, #standard deviation
                      lower=upper, #error bars in both directions
                      length=0.1,...) #length of the arrow head (in inches)
{
if(length(x) != length(y) | length(y) !=length(lower) | length(lower) != length(upper))
     stop("vectors must be same length")
arrows(x0=x,            #point to draw the arrow from (x)
       y0=y+upper,      #                             (y)
       x1=x,            #                        to (x) 
       y1=y-lower,      #                        to (y)
       angle=90,        #draw it at a 90 degree angle
       code=3,          #choose type of arrow
       length=length,   #length of the arrow head (inches)
       ...)             #sends graphics paramenters from the function call 
}

#This command draws the plot w/o error bars
barx <- barplot(height=daymeans,     #height of the bars 
                ylim=c(0,16),        #y axis range, determined by tweaking
                col="blue",          #blue bars
                axis.lty=1,          #choose line type (opaque) for y axis
                xlab="Day post vaccination",                #x axis label
                ylab="Mean inflammation (arbitrary units)") #y axis label

#this function call draws the error bars
error.bar(barx, daymeans, daysd)


            #Data to plot      #factor to separate on
boxplot(inflammation$day30 ~ inflammation$Gender,
        main="Day 30 inflammation by gender",
        ylab="inflammation (day 30)",
        xlab="Gender")


#Basic Plot
plot(inflammation$day10)

#Basic plot, using graphics options, color by a factor
plot(inflammation$day10, 
     xlab="Patient #",        #X axis label
     ylab= "Inflammation",    #Y axis label
     las= 1,                  #Make numbers horizontal on the x axis, 
     cex.lab=1.2,             #Increase axis labels font size
     cex.axis=1.2,            #Increase axis label number size
     lwd=2,                   #Increase line/dot thickness
     bty = "n",               #removes black border around the plot
     pch=16,                  #Specifies symbols to draw
     ylim= c(0,15),            #set y axis limits
     col = inflammation$Gender) #Set Color based on Gender


#Basic plot with options and colorization by factor and legend
plot(inflammation$day10, 
     xlab="Patient #",        #X axis label
     ylab= "Inflammation",    #Y axis label
     las= 1,                  #Make numbers horizontal on the x axis, 
     cex.lab=1.2,             #Increase axis labels font size
     cex.axis=1.2,            #Increase axis label number size
     lwd=2,                   #Increase line/dot thickness
     bty = "n",               #removes black border around the plot
     pch=16,                  #Specifies symbols to draw
     ylim= c(0,15),            #set y axis limits
     col = inflammation$Gender) #Set Color based on Gender

legend(x= 0,                                #x position of legend
       y=15,                                #y position of legend
       legend=levels(inflammation$Gender),  #Legend text 
       col = c(1:2),                        #colors to use in legend
       pch=16)                              #specifies how to draw symbols
