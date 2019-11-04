#VECTOR

z<-seq(1,100,by=2.5) #create a sequence from 1 to 100 by steps 2.5
z
z[5]
z[4:10]
z[length(z)]
z[length(z)-1]
z[-4]#everything without 4 position, omit positions

#extract or omit a list of positions
idx<-c(1,4,6)
z[idx]
z[-idx]
#query values of data (True or false)
(z<=10) | (z>=30) 
#query and receive the values
z[(z<=10) | (z>=30)]

#changing values

z2<-numeric(length(z))
z2[z<=30]<- 1
z2[(z>30)& (z<70)]<-2
z2[z>70]<-3
z2

#Do the same as above but faster, not able to install car

install.packages("car")
library(car)
z2<- recode(z, "0:30=1; 30:70=2; else=3")

#some vector stats

sum(z) #general sum
cumsum(z) #cummulative sum

#some data modification

rev(z) #revert the order
sort(z, decreasing = TRUE) #same
same (z, 10) #sample 10 values oout of X
#######################################
#MATRIX

m1<-matrix(z, nrow=2) #create a matrix
m1
m2<-matrix(z,
           nrow=5,
           ncol=4,
           byrow=TRUE)
m2
numbers_1<-rnorm(80,mean=0,sd=1) #create a vector with 80 entries based on normally distributed data
mat_1<-matrix(numbers_1,nrow = 20, ncol = 4) #populate matrix with vector data in 20 rows and 4 columns
mat_1

df_1<-data.frame(mat_1) #transform matrix into data frame
names(df_1)<-c("var1","var2","var3","var4")#assign columns names
head(df_1)
summary(df_1)
#######################################
#DATA FRAMES

test<-data.frame(A=c(1,2,3), B=c("aB1","aB2", "aB3"))
test[,1] #query
test[,"A"]
test$A #query
names(df_1)
df_1["var1"]
df_1$var1[1:3]
#Runif equal distribution w/number of observations (to get "random" numbers)
#rnorm normal distribution with mean and sd
#rep() repeat x times
#LETTERS?in-build constants
df_1<-data.frame(plot="location_name_1",measure1=runif(100)*1000, measure2=round(runif(100)*100),value=rnorm(100,2,1),ID=rep(LETTERS,100)[1:100])
df_2<-data.frame(plot="location_name_2", measure1=runif(50)*100, measure2=round(runif(50)*10),value=rnorm(50), ID=rep(LETTERS,50)[1:50])
df<-rbind(df_1,df_2) #combine two data frame row-wise, cbind for columns
df
str(df) #display of structure
mode(df) #storage mode object
head(df) #first part

df[,c('plot','measure1','measure2')]
df[66:70,c('plot','measure1','measure2')]
plot(df)
#######################################
#LIST
a<-runif(40)
b<-c("aa","bb","cc","dd","ee")
c<- list(a,b)
c
d<-list(obj_1=runif (100), obj_2=c("aa", "bb"),obj_3=c(1,2,4))
d$obj_1 #the same as d[["obj_1"]] or d[[1]]

e<-list(m1=matrix(runif(50), nrow=5), v1=c(1,6,10), df1=data.frame(f=runif(100), g=rnorm(100)))

head(e)
#######################################