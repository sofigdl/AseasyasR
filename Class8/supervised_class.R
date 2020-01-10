library(raster)
library(RStoolbox)
library(rgdal)
install.packages("e1071")
library(e1071)
library(randomForest)
getwd()
allband<-raster("C:/Users/chofi/Documents/2019/Maestria/Digital Image Analysis and GIS/Raster/raster_data/final/p224r63_2011.gri")
td<-readOGR("training.shp")
vali<-readOGR("validation.shp")
setwd("C:/Users/chofi/Documents/2019/Maestria/Programming_Geostatistic/GIT/AseasyasR/Class8")
list.files()
plot(allband[[1]])
plot(td,add=TRUE)

sc3<-superClass(allband,trainData=td,
               responseCol = "tipo",
               filename="Class_test3.tif"
               )
plot(sc$map)
?plot

class_ras<-raster("Class_test3.tif")

sc2<-superClass(allband, trainData = td, responseCol = "id", trainPartition = 0.1)
plot(sc1$map)
sc1<-superClass(allband, trainData = td, valData=vali, responseCol = "id") 
sc1$validation$performance
?validateMap
validateMap(class_ras, valData =vali, responseCol = "id", nSamples = 100, mode = "classification", classMapping = NULL)
