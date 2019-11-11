#INDEXING RASTERS/STACKS/BRICKS

library(raster)
r1<-raster(nrows=100, ncols=100) #create empty raster
r1[]<-df$measure1[1:1000] #populate empty raster with measure1 values


r2<-raster(nrows=100, ncols=100)
r2[]<- df$measure2[1:1000]


r12<-stack(r1,r2) #stack two raster together
r12
plot(r12)

#return first band
r12[[1]]
r2$layer

#plot first band
plot(r12[[1]])

#copy second band into a new object
x<-r12[[2]]
###################################################
#GET AND SET VALUES

#Values of rows one to ten of each band matrix 
y<-r12[1:10, ]
y

#all values
y<-r12[]
y<-getValues(r12)

#based on logical query
w<-r12[r12$layer.1<10]

#populate all bands with normally distributed data, ncells=number of entries
r12[]<-norm( ncell(r12))

#set all values below 0 to NA

r12[ r12< 0]<- NA

#Set vales 8 and 7 to -999

r12[ r12 %in% c(7,8)] <- -999

#more complex reclassification
m<-c(0, 025, 1, 0.25, 0.5, 2, 0.5, 1, 3)
conversionMatrix<-matrix(m, ncol=3, byrow = TRUE)
conversionMatrix
rc<-reclassify(r12,conversionMatrix)

#all values in env set to 0 and poly areas set to one
rc
rc[]<-0
rc[poly] <- 1

