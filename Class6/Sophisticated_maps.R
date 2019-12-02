library(RStoolbox)
ggR(my_raster.2$SRTM, geom_raster = T)+
  scale_fill_gradient(low="lightblue", high="darkblue", name="elevation", na.value=NA)+
  labs(x="", y="")+
  ggtitle("SRTM")+
  theme(plot.title = element_text(hjust = 0.5, face="bold", size=10))+
  theme(legend.title = element_text(size=10, face="bold", size = "bold"))+
  theme(legend.text = element_text(size=6))+
  theme(axis.text = element_text (angle= 45, size = 6))+
  scale_y_continuous(breaks = seq(5527000, 5538000, 4000))+
  xlab("")+
  ylab("")

??my_raster.2
  
p1<-ggR(my_raster.2$SRTM, geom_raster = T)+
  scale_fill_gradient(low="lightblue", high="darkblue", name="elevation", na.value=NA)+ 
  labs(x="", y="")+
  ggtitle("SRTM")+
  theme(plot.title = element_text(hjust = 0.5, face="bold", size=10))+
  theme(legend.title = element_text(size=10, face="bold", size = "bold"))+
  theme(legend.text = element_text(size=6))+
  theme(axis.text = element_text (angle= 45, size = 6))+
  scale_y_continuous(breaks = seq(5527000, 5538000, 4000))+
  xlab("")+
  ylab("")


library(gridExtra)
grid.arrange(p1, p2,p3, p4, ncol =4)