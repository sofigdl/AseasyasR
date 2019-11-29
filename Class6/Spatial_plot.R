#Plotting raster objects with RStoolbox
install.packages("raster")
install.packages("RStoolbox")
library(raster)
library(RStoolbox)
data(lsat)
lsat.df<-data.frame (coordinates(lsat), getValues(lsat))

lsat.df<-lsat.df[lsat.df$B3_dn!=0,]
ggplot(lsat.df)+
  geom_raster(aes(x=x,y=y, fill=B3_dn))+
  scale_fill_gradient(low="pink", high="red", na.value = NA)+
  coord_equal()

##single layers
plot(lsat[[1]])
ggR(lsat, 1)


##multiple layers

plot(lsat)
ggR(lsat,1:6, geom_raster = TRUE)
