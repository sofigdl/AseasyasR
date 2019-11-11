###########################################
#Index Data Frame
install.packages("RCurl")
library(RCurl) #download from GitHub
df<-read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")
df
head(df)
names(df)
str(df)
dim(df)


#Select just one column
df["SRTM"]
df[,5]

#Select just sentinel 2 data
s2data<-c(4:13)
df[,s2data]

#select the second last column
df[,length(df)-1]

df[1:5,-(1:10)]
#Select all columns but just first 10 rows
df[1:10,]

#Just select LUCAS_LC and SRTM
df[,c("LUCAS_LC","SRTM")]



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