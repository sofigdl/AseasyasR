log(i)
i%>% log()

round(x,6)

i%>% round(6)

flights %>%
  group_by(year, month, day)%>%
  select(arr_delay, dep_delay) %>%
  summarise(
    arr=mean(arr_delay, na.rm = TRUE),
    dep= mean (dep_delay, na.rm=TRUE)
  ) %>%
  filter(arr>30| dep>30)

df<-read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")
df

spdf.obj<-df #create a copy
names(spdf.obj) #check the names
library(sp) 

coordinates(spdf.obj) <- ~x+y #define x and y as coordinates

library(rgdal)
proj4string(spdf.obj) <-CRS("+init=epsg:32632") #assign coordinates system

plot(spdf.obj) #Check if it works
class(spdf.obj)

library(rgdal)
library(sp)
library(dplyr)
spdf.obj<-df #create a copy
spdf.obj %>%
  class() %>%
  plot() 
  

library(magrittr)


x <- command(df)
x2 <- command(x)

x <- command(command(df))

x %>% 
  command() %>%
  command() 
