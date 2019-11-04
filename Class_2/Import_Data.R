getwd()
setwd("C:/Users/chofi/Documents/2019/Maestria/Programming_Geostatistic/Office")
getwd()

list.files() #see files in the work space
table<-read.csv("test1.csv") #read csv
table
plot(table,type= 'b', col=45)
summary(table) #basic statistics


install.packages(RCurl)
library(RCurl) #download from GitHub
df<-read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")
df
head(df) #Just print the first rows
tail (df) #""" last rows
summary(df) # summary statistics
plot(df)
str(df)
names(df) #names of col
dim(df)
class(df) #type 
levels(df)