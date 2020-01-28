install.packages("TeachingDemos")
library(TeachingDemos)
if(interactive()){
put.points.demo()
  
  x<-rnorm(25,5,1)
  y<-x+rnorm(25)
  put.points.demo(x,y)
}

source("http://janhove.github.io/RCode/plot_r.R")
plot_r(r=0.8, n=10)

install.packages("gsheet")
library(gsheet)

x<-gsheet2tbl