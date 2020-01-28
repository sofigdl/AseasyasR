library(RCurl)
x<-read.csv("C:/Users/chofi/Documents/2019/Maestria/Programming_Geostatistic/Fun/MB2 - Stats - Tabellenblatt1.csv")
x;summary(x)

library(reshape2)
x2<-melt(data=x)
library(ggplot2)
ggplot(x2, aes(x=variable,y=value))+geom_boxplot()

x.cs<-data.frame(variable.names(x), cs=t(cumsum(x)[nrow(x),]))
names(x.cs)<-c("variable", "cumsum")

x2<-melt(data = x)
x3<-merge(x.cs,x2,by="variable", all=T)
ggplot(x3, aes(x=variable, y=value, color=cumsum))+geom_point()

ggplot(x3, aes(x=variable, y=value, color=cumsum, fill=cumsum))+ geom_boxplot(alpha=.5)+scale_fill_gradient(low = "yellow", high="red")
geom_point(alpha=.7, size=1.5, position = position_jitter(width=.25, height = .5))

install.packages("gender")
library(gender)
install.packages("genderdata", repos = "http://packages.ropensci.org", type = "source")
install.packages("genderdata")
library(genderdata)

x.g<-gender(names(x))
colnames(x.g)[1]<-"variable"
x4<-merge(x3, x.g, by.x="variable", all=T)
a<-ggplot(x4, aes(x=variable, y=value, color))