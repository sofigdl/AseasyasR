#Map Google Location with R

##Import data

library(jsonlite)
setwd("C:/Users/chofi/Documents/2019/Maestria/Programming_Geostatistic/Data_Set")
system.time(x<-fromJSON("Historialdeubicaciones.json"))

#Extracting the locations dataframe
loc=x$locations

#Converting time column from posix milliseconds into a readable time scale

loc$time=as.POSIXct(as.numeric(x$locations$timestampMs)/1000, origin = "1970-01-01")

#converting longitude and latitude from E7 to GPS coordinate
loc$lat = loc$latitudeE7/1e7
loc$lon = loc$longitudeE7/1e7

head(loc)

#Explore basic statistics

nrow(loc)
min(loc$time)
max(loc$time)

#calculate the number of data points per day, month, year
install.packages("zoo")
library(lubridate)
library(zoo)
library(raster)
loc$date<- as.Date(loc$time, '%Y/%m/%d')
loc$year<- year(loc$date)
loc$month_year<-as.yearmon(loc$date)

points_p_day <- data.frame(table(loc$date), group="day")
points_p_month <- data.frame(table(loc$month_year), group ="month")
points_p_year <- data.frame(table(loc$year), group = "year")

nrow(points_p_day)
nrow(point_p_month)
nrow(points_p_year)

library(ggplot2)
library(ggmap)

my_theme_google<- function(base_size =12, base_family ="sans"){
  theme_grey(base_size = base_size, base_family = base_family)+
    theme(
      axis.text = element_text(size = 12),
      axis.title = element_text(size = 14),
      panel.grid.major = element_line(color = "grey"),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill ="aliceblue"),
      strip.background = element_rect(fill = "lightgrey", color="grey", size = 1),
      strip.text = element_text(face= "bold", size=12, color="navy"),
      legend.position = "left",
      legend.background = element_blank(),
            panel.border = element_rect(color ="grey", fill = NA, size = 0.5)
    )
}

points<- rbind(points_p_day[,-1], points_p_month[, -1], points_p_year[,-1])

ggplot(points, aes(x=group, y= Freq)) +
  geom_point(position = position_jitter(width = 0.2), alpha =0.3)+
  geom_boxplot(aes(color=group), size =1, outlier.colour = NA) +
  facet_grid(group ~ ., scales = "free")+ my_theme_google() +
  theme(
    legend.position = "none",
    strip.placement = "outside",
    strip.background = element_blank(),
    strip.text = element_blank(),
    axis.text.x = element_text(angle = 0, vjust = 0.5, hjust = 0.5)
  ) +
  labs(
    x = "",
    y = "Number of data points",
    title = "How many data points did Google collect about me?",
    subtitle = "Number of data points per day, month and year",
    caption = "\nGoogle collected between 0 and 4000 data points per day
    (median ~500), between 0 and 25,000 per month (median ~15,000) and 
    between 80,000 and 220,000 per year (median ~140,000)."
  )

#Plot in map Europe

europe <- c(left = -20, bottom = 35, right = 20, top = 55)
#get_stamenmap(europe, zoom = 5, maptype = "toner-lite") %>% ggmap() 

eur<-get_stamenmap(europe, zoom=5)

?register_google

ggmap(eur) + geom_point(data = loc, aes(x = lon, y = lat), alpha = 0.5, color = "pink") + 
  theme(legend.position = "right") + 
  labs(
    x = "Longitude", 
    y = "Latitude", 
    title = "Location history data points in Europe",
    caption = "\nA simple point plot shows recorded positions.")

#Plot in map Germany

Germany <- c(left = 5.5, bottom = 47, right = 16, top = 55)
Germany1 <- c(left = 5.5, bottom = 47.5, right = 16, top = 51)
#get_stamenmap(Germany, zoom = 5, maptype = "toner-lite") %>% ggmap() 

ger<-get_stamenmap(Germany1, zoom=5)

ggmap(ger) + geom_point(data = loc, aes(x = lon, y = lat), alpha = 0.5, color = "lightgreen") + 
  theme(legend.position = "right") + 
  labs(
    x = "Longitude", 
    y = "Latitude", 
    title = "Location history data points in Germany",
    caption = "\nA simple point plot shows recorded positions.")

#Plot in map North hemisphere

N_hem <- c(left = -97, bottom = 8, right = 16, top = 55)
#<- c(left = 5.5, bottom = 47.5, right = 16, top = 51)
#get_stamenmap(Germany, zoom = 5, maptype = "toner-lite") %>% ggmap() 

nhem<-get_stamenmap(N_hem, zoom=3)

ggmap(nhem) + geom_point(data = loc, aes(x = lon, y = lat), alpha = 0.5, color = "red") + 
  theme(legend.position = "right") + 
  labs(
    x = "Longitude", 
    y = "Latitude", 
    title = "Location history data points in the Northern Hemisphere",
    caption = "\nA point plot shows recorded positions.")

#######################################################################3

#Points in Guatemala
guatemala <- c(left = -93, bottom = 13.3, right = -87, top = 18.5)
guat_city<- c(left = -90.8, bottom = 14.5, right = -90.25, top = 14.75)
gtm <-get_stamenmap(guatemala, zoom=8)
get_stamenmap(guat_city, zoom = 5, maptype = "toner-lite") %>% ggmap()

options(stringsAsFactors = T)

ggmap(gtm) + 
  stat_summary_2d(geom = "tile", bins = 100, data = loc, aes(x = lon, y = lat, z = accuracy), alpha = 0.5) + 
  scale_fill_gradient(low = "blue", high = "red", guide = guide_legend(title = "Accuracy")) +
  labs(
    x = "Longitude", 
    y = "Latitude", 
    title = "Location history data points around Guatemala",
    subtitle = "Color scale shows accuracy (low: Purple, high: Pink)",
    caption = "\nThis bin plot shows recorded positions 
    and their accuracy in and around Guatemala City")

##############################################################################3
#Speed
loc_2 <- loc[which(!is.na(loc$velocity)), ]

ggmap(gtm) + geom_point(data = loc_2, aes(x = lon, y = lat, color = velocity), alpha = 0.3) + 
  theme(legend.position = "right") + 
  labs(x = "Longitude", y = "Latitude", 
       title = "Location history data points in Guatemala",
       subtitle = "Color scale shows velocity measured for location",
       caption = "\nI almost always use the car in Guatemala. Usually, I don't move so fast.") +
  scale_colour_gradient(low = "blue", high = "red", guide = guide_legend(title = "Velocity"))

##############################################################################
#What distance did I travel?
 
loc3<- with(loc, subset(loc, loc$time > as.POSIXct('2016-11-01 0:00:01'))) 
loc3<- with(loc, subset(loc3, loc$time < as.POSIXct('2019-11-22 23:59:59')))

#Shifting vectors for latitude and longitude to include end position

shift.vec <- function(vec, shift){
  if (length(vec)<= abs(shift)){
    rep(NA, lenght(vec))
  } else {
    if (shift >= 0){
      c(rep(NA, shift), vec[1:(lenght(vec)-shift)])
    } else {
      c(vec[(abs(shift)+1): length(vec)], rep(NA, abs(shift)))
    }
  }
}

loc3$lat.p1 <-shift.vec(loc3$lat, -1)
loc3$lon.p1<- shift.vec(loc3$lon, -1)

#Calculating the distances between points

library(raster)
loc3$dist.to.prev <- apply(loc3, 1, FUN = function(row){
  pointDistance(c(as.numeric(as.character(row["lat.p1"])),
                  as.numeric(as.character(row["lon.p1"]))),
                c(as.numeric(as.character(row["lat"])), 
                  as.numeric(as.character(row["lon"]))),
                lonlat = TRUE)
})

round(sum(as.numeric(as.character(loc3$dist.to.prev)), na.rm = TRUE)*0.001, digits = 2)

