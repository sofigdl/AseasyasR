getwd()
setwd("C:/Users/chofi/Documents/2019/Maestria/Programming_Geostatistic/Import_info")
getwd()

#Import Info

list.files() #see files in the work space
table<-read.csv("test1.csv") #read csv
table
plot(table,type= 'b', col=45)

#Try some statistics
head(df) #Just print the first rows
tail (df) #""" last rows
summary(df) # summary statistics
plot(df)
str(df)
names(df) #names of col
dim(df)
class(df) #type 
levels(df)

#Datapasta
install.packages("datapasta")
#Pestañita de addins y buscar paste
data.frame(
           Code = c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L),
   biomass.(kg) = c(615.7292708, 556.1137017, 241.7802449, 490.7583653,
                    1276.330384, 25.5143339, 37.38477475, 54.44114506,
                    35.23288981)
)


#Data frame 2
df_1<-data.frame(plot="location_name_1",measure1=runif(100)*1000, measure2=round(runif(100)*100),value=rnorm(100,2,1),ID=rep(LETTERS,100)[1:100])
df_2<-data.frame(plot="location_name_2", measure1=runif(50)*100, measure2=round(runif(50)*10),value=rnorm(50), ID=rep(LETTERS,50)[1:50])
df<-rbind(df_1,df_2) #combine two data frame row-wise, cbind for columns
df
df[,c('measure1','measure2')]
df[66:70,c('measure1')]

#Explore plots
plot(df)
boxplot(df)
hist(a)
coplot(measure1 ~ measure2 | value, df)

#3d plot
f<-c(seq(1,80, by=2))
install.packages("lattice")
library(lattice)
cloud(a ~ z*f)

#list

a<- list(obj_1=runif(10), obj_2=df$measure1, obj_3=table )
