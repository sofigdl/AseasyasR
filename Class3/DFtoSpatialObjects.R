#Transform DF to Spatial Objects

spdf.obj<-df #create a copy
names(spdf.obj) #check the names
library(sp) 

coordinates(spdf.obj) <- ~x+y #define x and y as coordinates

library(rgdal)
proj4string(spdf.obj) <-CRS("+init=epsg:32632") #assign coordinates system

plot(spdf.obj) #Check if it works
class(spdf.obj)

setwd("C:/Users/chofi/Documents/2019/Maestria/Programming_Geostatistic/GIT/AseasyasR/Class3")
getwd()
spdf.obj
spdf.obj@data<-df
writeOGR(spdf.obj, "sample_point_with_data.shp", driver="ESRI Shapefile", "data")
