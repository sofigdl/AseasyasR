library(raster)
r3<-raster(nrows=10, ncols=10)
r3
plot(r3)

r3[]<-rnorm(100) #fill raster with 100 random values
r3

PlantGrowth<-data.set(rnorm(100),row.names = NULL, check.rows = FALSE, check.names = TRUE,
                stringsAsFactors = default.stringsAsFactors(),
                document = NULL)
rasterAB<- rasterA*rasterB #intuitive arithmetic
raster_sd<- calc(your_raster, fun=sd) #more complex functions
raster_sd<- calc(your_raster, fun=sd, filename= "my_filename.tif", options = c("COMPRESS=DEFLATE")) #Extended options

#adding your own function
install.packages("rgdal")
library(rgdal)
library(raster)
r<-raster(volcano)

scaleFactor <- 1000
fun <- function(x){
  (x*1:10) * scaleFactor
  }

raster_output<-calc(r, fun, forcefun=TRUE,
                    filename= "myStandardizedAndScaled.tif", datatype = "INT2S")
data(volcano)
ext<-drawExtent() #draw an extent on the monitor (North-West corner and South-East corner)
r_crop<- crop(r, ext)#ext is anobject of class extent

calc(r,fun,forcefun=TRUE)


##Regression analysis
raster12<-stack(raster_1, raster_2)
fun<- function(x) {
  lm(x[1:5] ~ x[6:10])$coefficients[2]
  }
raster_output<-calc(raster12, fun)

##Raster calculations using overlay () with two or more rasters
###band calculation

raster_output<-overlay(raster_1, raster_2, fun=function(x,y){return(x+y)})

###Use more bands

raster_output<- overlay(raster_1,raster_2,raster_3,
                        fun=function(x,y,z){x*y*z
                          })
##Shrink and grow a raster
r
plot(r)

ext<-drawExtent() #draw an extent on the monitor

r_crop<-crop(r, ext) #ext is an object of class extents

ext<-ext*2 #grows extent in all four directions

plot(ext)
plot(r_crop[[1]], add=TRUE)

r_bigger<-extent(r,c(100,0)) #Grow an entire raster by 100 rows top and bottom