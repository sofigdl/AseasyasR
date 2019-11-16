#Vector
z<-seq(1,100,by=2.5)

#Matrix
m1<-matrix(z, nrow=2) #create a matrix
m1
m2<-matrix(z,
           nrow=5,
           ncol=4,
           byrow=TRUE)

#Create a data frame
df_1<-data.frame(plot="location_name_1",measure1=runif(100)*1000, measure2=round(runif(100)*100),value=rnorm(100,2,1),ID=rep(LETTERS,100)[1:100])
df_2<-data.frame(plot="location_name_2", measure1=runif(50)*100, measure2=round(runif(50)*10),value=rnorm(50), ID=rep(LETTERS,50)[1:50])
df<-rbind(df_1,df_2) #combine two data frame row-wise, cbind for columns
df

#Convert df to sp
spdf.obj<-df #create a copy
names(spdf.obj) #check the names
library(sp) 

coordinates(spdf.obj) <- ~x+y #define x and y as coordinates

library(rgdal)
proj4string(spdf.obj) <-CRS("+init=epsg:32632") #assign coordinates system

plot(spdf.obj) #Check if it works
class(spdf.obj)