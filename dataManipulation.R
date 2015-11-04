#R is a scripting language so we can just run this and it 
#doesn't need to get compiled into any other form
#set working directory
setwd("/Users/alexander.frieden/Documents/biostats/Rcode/")
#get table into variable
mydata = read.table("dummyTable.txt")
#check class for object, in this case it will be a data frame
class(mydata)
#prints mydata, notice that the column headers are not correct
mydata
#lets get the data so that it has the proper headers
mydata <- read.table("dummyTable.txt",header = TRUE)
#now we get the right values, this will give us a dataframe
mydata["val1"]
#this will give us an integer array
mydata$val1