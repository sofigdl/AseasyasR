#Plotting raster objects with RStoolbox
remove.packages("raster")
install.packages("raster")
install.packages("RStoolbox")
install.packages("scales")
library(raster)
library(RStoolbox)
library(ggplot2)
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

#RGB plot with a linear stretch
ggR(lsat, 3, 2, 1, stretch = "lin")

#single layer greyscale
ggR(lsat, layer=4, maxpixels = 1e6, stretch ="hist")

#single layer map to user defined legend

ggR(lsat, layer=1, stretch="lin", geom_raster = TRUE)+
  scale_fill_gradient(low = "blue", high = "green")

library(devtools)
devtools::install_github("AniMoveCourse/animove")
library(animove)
data(buffalo_env)  
data(buffalo_utm)

buffalo_df<-data.frame(buffalo_utm)
ggp<- ggR(buffalo_env, layer ="mean_NDVI", geom_raster = TRUE)+
  scale_fill_gradient(low="gold", high = "darkgreen")

ggp + geom_path(data = buffalo_df, aes(x=coords.x1, y = coords.x2), alpha = 1)

#hillshade

terrainVariables<- terrain(buffalo_env[["elev"]], c("slope", "aspect"))
hillShade <- hillShade(terrainVariables$slope, terrainVariables$aspect, angle =10)

ggR(hillShade)+
  ggR(buffalo_env, layer="elev", alpha = 0.3,geom_raster = TRUE, ggLayer=TRUE) +
  scale_fill_gradientn(name="Elevation (m)", colors = terrain.colors(100))+
  geom_point(data = buffalo_df, aes(x=coords.x1, y = coords.x2), alpha = .1, size =.5)+
  theme(axis.test.y =element_text(angle=90), axis.title = element_blank())


#######################################
#Limit the extent

##get the extent of lsat

lim<-extent(lsat)

# use stored plot + new plotting commands

a +
  guides (fill= guide_colorbar())+
  geom_point(data=plots, aes(x=V1, y=V2), shape=3, colour="yellow")+
  theme(axis.title.x = element_blank())+
  scale_x_continuous(limits = c(lim@xmin, lim@xmax))+ ylim(c(lim@ymin, lim@ymax))
