x88<- brick("C:/Users/chofi/Documents/2019/Maestria/Programming_Geostatistic/Data_set/raster_data/final/p224r63_1988.gri")
x<-brick("C:\Users\chofi/Documents/2019/Maestria/Programming_Geostatistic/GIT/AseasyasR/Class7/crop_p224r63_all_bands.tif")
cm<-cor(getValues(x88), use = "complete.obs")

install.packages("ellipse")
library(ellipse)
plotcorr(cm, col=ifelse(abs(cm)>0.03,"red","grey"))
x88
corrplot()

data(stork)
plot(stork)
summary(stork)

cor(stork$No.storks, stork$No.babies)
cor.test(stork$No.storks, stork$No.babies)
