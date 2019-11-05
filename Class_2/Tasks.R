#TASKS
df_1<-data.frame(plot="location_name_1",measure1=runif(100)*1000, measure2=round(runif(100)*100),value=rnorm(100,2,1),ID=rep(LETTERS,100)[1:100])
df_2<-data.frame(plot="location_name_2", measure1=runif(50)*100, measure2=round(runif(50)*10),value=rnorm(50), ID=rep(LETTERS,50)[1:50])
df<-rbind(df_1,df_2) #combine two data frame row-wise, cbind for columns
df

df[,c('measure1','measure2')]
df[66:70,c('value')]
plot(df)
boxplot(df)
hist(a)
coplot(measure1 ~ measure2 | value, df)

#3d plot
f<-c(seq(1,80, by=2))
install.packages("lattice")
library(lattice)
cloud(a ~ z*f)

#scatterplot
install.packages("scatterplot3d")
library(scatterplot3d)
install.packages("RColorBrewer")
library(RColorBrewer)

# get colors for labeling the points
plotvar <- a # pick a variable to plot
nclr <- 40 # number of colors
plotclr <- brewer.pal(nclr,"PuBu") # get the colors
colornum <- cut(rank(plotvar), nclr, labels=FALSE)
colcode <- plotclr[colornum] # assign color

# scatter plot
plot.angle <- 45
lon=f
lat=z
scatterplot3d(lon, lat, plotvar)
scatterplot3d(lon, lat, plotvar, 
              angle=plot.angle, 
              type="h", 
              color=colcode, 
              pch=20,  
              col.axis="gray", 
              col.grid="gray", 
              cex.symbols=2,)


#Index Data Frame
install.packages("RCurl")
library(RCurl) #download from GitHub
df<-read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")
df
head(df)
s2data<-c(4:13)
df["SRTM"]
df[,s2data]
df[,length(df)-1]
df[1:5,-(1:10)]
df[1:10,]
df[,c("LUCAS_LC","SRTM")]
names(df)

#Plot
#Plot SRTM values above NDVI value
test1<-df[df$TimeScan.NDVIavg>0.4,]
plot(test1[,c("SRTM","TimeScan.NDVIavg")])
test1

#Plot NDVI values for SRTM values less than 300 and landcover equal to 1
test2.1<-df[(df$MOD.evi>df$L7.msavi|df$TimeScan.NDVIslope>=df$L8.evi),]
test2<-df[(df$SRTM<300&df$LUCAS_LC==1),]
test2
plot(test2[,"TimeScan.NDVIavg"])
plot(df[(df$SRTM<300&df$LUCAS_LC==1),"TimeScan.NDVIavg"])

#Create a new data frame with all entries but only for NDVI above 0.5
#test2<-df[,c("TimeScan.NDVIavg")]
df_1<-df[df$TimeScan.NDVIavg>0.5,]
df_1

#Select data whe LC values below 2 or above 3
df[df$LUCAS_LC<2|df$LUCAS_LC>3,]

#Select LUcAS_LC and SRTM where NDVI greater equal than 0.4
df[df$TimeScan.NDVIavg>=0.4 ,c("LUCAS_LC","SRTM")]


#subset(df, (Gender == 'Male' & Color == 'Blue'))