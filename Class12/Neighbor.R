library(rgdal)
setwd("C:/Users/chofi/Documents/2018/R/PruebaRC/")


files
r<-lsat$B4_dn
r3<-focal(r, w=matrix(1/9, nrow=3, ncol = 3))
r5<-focal(r, w=matrix(1/25, nrow = 5, ncol = 5))

fw<-focalWeight(r,2,"Gauss")
r0<- focal(r, w=fw)

plot(r0)

fw<-focalWeight(r, 5000, "circle")
r0<-focal(r, w=fw)
plot(r0)


install.packages("glcm")
library(glcm)


texture_result<-glcm(r)
names(texture_result)

plot(texture_result$glcm_variance)
