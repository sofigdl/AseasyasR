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

savi<-spectralIndices(lsat, blue = "B1_dn", green = "B2_dn", red = "B3_dn", nir = "B4_dn", indices = "SAVI")

plot()
ndvi<-spectralIndices(lsat, blue = "B1_dn", green = "B2_dn", red = "B3_dn", nir = "B4_dn", indices = "NDVI")

gemi<-spectralIndices(lsat, blue = "B1_dn", green = "B2_dn", red = "B3_dn", nir = "B4_dn", indices = "GEMI")

getwd()
l_br<-raster("C://data/Landsat/Fragmentation_Brasil/crop_p224r63_all_bands.tif")
plot(l_br)
