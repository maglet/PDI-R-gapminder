#Assignment operator
x<-4 #assigns the value 4 to the variable x
x #print x to the output screen

#downloading files
#     url = web location of the file
#     destfile = desired file path and name. Defaults to working directory
download.file(url="https://github.com/maglet/r-for-beginners/blob/master/inflammation.csv",
              destfile = "inflammation.csv")

?download.file # get R documantation for download.file function

#Loading data into R
inflammation<-read.csv("inflammation.csv") #reads data from the csv file

#Inspeciting the data
class(x)                 #returns the data type of x
class(inflammation)      #returns the data type of inflammation

head(inflammation) #displays the first 6 elements of all columns

View(inflammation) #opens the data frame in a new tab

str(inflammation) #gives information about the data stored within the columns

#Summarizing the data

