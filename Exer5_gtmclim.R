install.packages("raster")
library(raster)
guatemala<-getData("GADM", country="GTM", level=2) #get country borders, other country codes can ve found in the manual
plot(guatemala)
prec<-getData("worldclim", var="prec",res=2.5) #get precipitation 
plot(prec)
prec_ger1<- crop(prec,guatemala) #crop precipitacion to extent of guate
spplot(prec_ger1) #plot results
prec_ger2<- mask(prec_ger1, guatemala) #mask precipitacion to extent of guate
spplot(prec_ger2) #plot result
prec_avg<-cellStats(prec_ger2,stat="mean") #extract precipitation average of guate, other statistics possible as well
plot(prec_avg, 
     main="Average monthly precipitation in Guatemala", 
     type= 'b',
     xlab="Month",
     ylab="Precipitation (mm)",
     lty=4, 
     pch=16, 
     col=4)
temp<-getData("worldclim", var="tmean",res=2.5) #get temperature
plot(temp)
temp_ger1<- crop(temp,guatemala) #crop temp to extent of guate
spplot(temp_ger1) #plot results
temp_ger2<- mask(temp_ger1, guatemala) #mask temp to extent of guate
spplot(temp_ger2) #plot result
temp_avg<-cellStats(temp_ger2,stat="mean") #extract temp average of guate, other statistics possible as well
plot(temp_avg, 
     main="Average monthly mean temperature in Guatemala", 
     type= 'b',
     xlab="Month",
     ylab="Mean Temperature (°C)",
     lty=4, 
     pch=16, 
     col="orangered1")
