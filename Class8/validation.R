library(ggplot2)
library(dplyr)
vali<-readOGR("validation.shp")

class_ras<-raster("Class_test1.tif")

sc2<-superClass(allband, trainData = td, responseCol = "id", trainPartition = 0.1)
plot(sc1$map)
sc1<-superClass(allband, trainData = td, valData=vali, responseCol = "id") 
sc1$validation$performance
?validateMap
validateMap(class_ras, valData =vali, responseCol = "id", nSamples = 100, mode = "classification", classMapping = NULL)

ggplot(data = cm_test)
ggplot(confusion_matrix1, aes(x=Forest_P, y=Referencia))+geom_boxplot()

cm_test=as.data.frame(sc1$validation$performance$table)
cm_test
Referencia =c("ForestR", "WaterR", "GrasslandR", "UrbanR", "CroplandR")
Forest_P = c(926,54,0,659,60)
WaterP=c(24,376,198,5,51)
GrasslandP=c(0,21,8,0,25)
UrbanP=c(51,0,0,68,0)
CroplandP=c(0,101,55,0,321)

df_val<-data.frame(Forest_P)
df_val
confusion_matrix <- data.frame(Referencia, Forest_P, WaterP, GrasslandP, UrbanP, CroplandP)
confusion_matrix1<-data.frame(Forest_P, WaterP, GrasslandP, UrbanP, CroplandP, row.names = c(1,2,3,4,5))
confusion_matrix

ggplot(data = confusion_matrix) +
  geom_tile(aes(fill = Freq)) +
  geom_text(aes(label = sprintf("%1.0f", Freq)), vjust = 1) +
  scale_fill_gradient(low = "blue",
                      high = "red",
                      trans = "log")

ggplot(data = confusion_matrix)
