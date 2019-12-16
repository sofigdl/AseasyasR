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

#The estructure is more complex...
str(r12)

library(raster)
r3<-raster(nrows=10, ncols=10)
r3
plot(r3)

r3[]<-rnorm(100) #fill raster with 100 random values
r3
plot(r3)

library(RStoolbox)

ggR(r12, layer=1, alpha=0.2)
ggRGB(r12,r=1,g=2, b=3)
      
########################################################################################
#NDVI

library(RStoolbox)
data(lsat)
lsat
ggRGB(lsat, r=4, g=5, b=3)
ndvi<-(lsat$B4_dn-lsat$B3_dn)/(lsat$B4_dn+lsat$B3_dn)
plot(ndvi)
ndvi<- overlay(lsat$B4_dn, lsat$B3_dn, fun=function(nir, red){
  (nir-red)/(nir+red)
})
ndvi<-calc(lsat, fun=function(x){(x[,4]-x[,3])/(x[,4]+x[,3])}, forcefun=TRUE)
ndvi
plot(ndvi)

savi<- overlay(lsat$B4_dn, lsat$B3_dn, fun=function(nir, red){(nir-red)/(nir+red+0.5)*(1+0.5)}, file="savi.tif", format= "GTiff")

plot(savi)

fun_ndvi<-function(nir, red){
  (nir-red)/(nir+red)
}

ndvi<- overlay(band_4, band_3, fun = fun_ndvi)

?spectralIndices

