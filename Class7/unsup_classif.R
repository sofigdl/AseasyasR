library(sp)
library(raster)
library(cluster)
b1<-raster("C://data/Landsat/p224r63/LT52240632006164CUB03.tar/LT52240632006164CUB03_B1.TIF")
b2<-raster("C://data/Landsat/p224r63/LT52240632006164CUB03.tar/LT52240632006164CUB03_B2.TIF")
b3<-raster("C://data/Landsat/p224r63/LT52240632006164CUB03.tar/LT52240632006164CUB03_B3.TIF")
b4<-raster("C://data/Landsat/p224r63/LT52240632006164CUB03.tar/LT52240632006164CUB03_B4.TIF")
b5<-raster("C://data/Landsat/p224r63/LT52240632006164CUB03.tar/LT52240632006164CUB03_B5.TIF")
b6<-raster("C://data/Landsat/p224r63/LT52240632006164CUB03.tar/LT52240632006164CUB03_B6.TIF")
b7<-raster("C://data/Landsat/p224r63/LT52240632006164CUB03.tar/LT52240632006164CUB03_B7.TIF")
plot(raster_stack)
raster_stack<-stack(b1,b2,b3,b4,b5,b6,b7)
raster_df<-raster_stack[]

plot(raster_df)
kmeans_out<- kmeans(raster_df, 12, iter.max = 100, nstart = 10)
kmeans_raster<- raster()

data(lsat)
uc<-unsuperClass(lsat, nClasses = 5)
ggR(uc$map, forceCat = TRUE, geom_raster = TRUE)


uc_ndvi<-unsuperClass(ndvi, nClasses = 5)
ggR(uc_ndvi$map, forceCat = TRUE, geom_raster = TRUE)
