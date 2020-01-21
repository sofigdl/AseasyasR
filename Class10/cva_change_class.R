x88<- brick("C:/Users/chofi/Documents/2019/Maestria/Programming_Geostatistic/Data_set/raster_data/final/p224r63_1988.gri")
x11<-brick("C:/Users/chofi/Documents/2019/Maestria/Programming_Geostatistic/Data_set/raster_data/final/p224r63_2011.gri")
cva_88_11<-rasterCVA(x88[[3:4]], x11[[3:4]])

tc_88<-tasseledCap(x88[[c(1:5,7)]], sat="Landsat5TM")
tc_11<-tasseledCap(x11[[c(1:5,7)]], sat="Landsat5TM")

cva_tc_88_11<-rasterCVA(tc_88[[2:3]], tc_11[[2:3]])
cva_tc_88_11
plot(cva_tc_88_11)
jet.colors_angle<-colorRampPalette(c ( "#00007F", "blue", "grey", "lightgrey", "red", "yellow", "#7FFF7F", "#366C36"))
getwd()
jpeg("")