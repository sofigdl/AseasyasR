#Converting DF to Spatial Objects
#spdf means Spatial Point Data Frame
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

#We can assigne a corresponding data frame to the spatial point object
spdf.obj
spdf.obj@data<-df

#Exporting as shp, geopackage, etc
writeOGR(spdf.obj, "sample_point_with_data.shp", driver="ESRI Shapefile", "data")

#Exporting certains parts as shp, geopackage, etc
writeOGR(spdf.obj[,1:14], "sample_point_with_data_1.shp", driver="ESRI Shapefile", "data")

test1.df <- as.data.frame(spdf.obj)
test1.df
