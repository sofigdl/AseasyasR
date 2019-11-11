#DF TO RASTER

#create a data frame with 1000 random uniformly distributed numbers
df<-data.frame(measure1=runif(1000)*100, measure2=round(rnorm(1000)*100))
length(df$measure1) #check the length of the column

library(raster)
r1<-raster(nrows=100, ncols=100) #create empty raster
r1
r1[]<-df$measure1[1:1000] #populate empty raster with measure1 values
plot(r1)

r2<-raster(nrows=100, ncols=100)
r2[]<- df$measure2[1:1000]
plot(r2)

r12<-stack(r1,r2) #stack two raster together
r12
plot(r12)

plot(r12[[1]]) #plot just one raster

r12$new<-r12[[1]]*r12[[2]]^2 #create a new raster layer
plot(r12)

#convert rasters back to data frame
df12<-r12[]
head(df12)

str(raster_name) #????
