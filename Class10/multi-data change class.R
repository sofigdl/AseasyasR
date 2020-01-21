#############################
# MULTI-DATA CLASSIFICATION #
#############################
library(raster)
library(rgdal)
library(RStoolbox)
getwd()
setwd("C:/Users/chofi/Documents/2019/Maestria/Programming_Geostatistic/GIT/AseasyasR/Class10")

lsat88<-brick("C:/Users/chofi/Documents/2019/Maestria/Programming_Geostatistic/Data_set/raster_data/final/p224r63_1988.gri")
lsat11<-brick("C:/Users/chofi/Documents/2019/Maestria/Programming_Geostatistic/Data_set/raster_data/final/p224r63_2011.gri")

lsat88_11<-stack(lsat88,lsat11)

td_88_11<-readOGR("C:/Users/chofi/Documents/2019/Maestria/Programming_Geostatistic/Data_set/vector_data/change_classes_1988_2011.shp")

sc_88_11<-superClass(lsat88_11, trainData=td_88_11, responseCol = "id")

plot(sc_88_11$map)

validateMap(sc_88_11$map)
?validateMap  
