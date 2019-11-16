install.packages("RCurl")
library(RCurl) #download from GitHub
df<-read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")
names(df)
head(df)

a<-ggplot(df, aes(x=L8.ndvi, y=L8.savi))
a<-a+geom_point()
b<-ggplot(df, aes(x=L8.ndvi, y=L8.savi, colour=SRTM))+geom_point()
b<-b+geom_smooth()
b<-b+ facet_wrap(~LCname)
b
ggplot()+geom_point(data=df, aes(LCname, L8.savi))
ggplot()+geom_point(data=df, aes(LCname, L8.savi, colour=SRTM))
c<-ggplot(df, aes(x=LCname, y=L8.savi))+geom_boxplot(alpha=.5)
c+geom_point(aes(colour=SRTM), alpha=.7, size=1.5, position = position_jitter(width = .25, height=0))
c
ggplot(df, aes(x=LCname, y=L8.savi))+geom_jitter()
ggplot(df, aes(x=LCname, y=L8.savi, colour=SRTM))+geom_jitter()
ggplot(df, aes(x=LCname, y=L8.savi, colour=SRTM))+geom_violin()

q<-ggplot(df, aes(x=TimeScan.NDVIavg, fill=LCname))+ geom_density(alpha=0.3)
q+ transition_states(df$LCname) +
  ease_aes('linear')+
  enter_fade() +
  exit_fade()
