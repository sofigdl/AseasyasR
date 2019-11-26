install.packages("ggplot2")
library(ggplot2)
help.search("geom_", package = "ggplot2")
x11()
x<-data.frame(x=1,y=1, label=" ggplot2 introduction\ n@ EAGLE")
#ggplot(dataset, aes(x=xValue, y=yValue))+geom_histogram

ggplot(data=x, aes(x=x,y=y)) +geom_text(aes(label=label), size=15)

#Create some data for plottong examples
x1<- rnorm(1000,0,1)
x2<- rnorm(1000,5.10)
x3<- rep(c("catA","catB", "catB", "catC", "catC"),200)[1:1000]
x4<- factor(rep(c("yes","no"),500))
df<-data.frame(a=x1, b=x2,c=x3, d=x4)

#Scatter plot 
library(ggplot2)
ggplot(df, aes(a,b)) #empty plot
ggplot(df, aes(a, b)) + geom_point() #adding a geom
ggplot(df, aes(a,b, color=c))+geom_point(alpha=.5) #adding color and translucency
ggplot(df, aes(a,b, color=c))+geom_point(alpha=.5)+ labs(title="first plot", x="x axis\n and a new line") #adding title a x axis label

#Histogram
ggplot(df, aes(a))+geom_histogram(color="white")

#density graph
ggplot(df, aes(a))+ geom_density()

#combining them
ggplot(df)+ 
  geom_histogram(aes(a, ..density..), fill="pink", colour="darkgrey")+
  geom_density(aes(a, ..density..), fill="blue", colour="yellow")+
  geom_rug(aes(a))

#plot with count statistics
ggplot(df, aes(c, color=c)) +geom_point(stat = "count", size=4)

#Flipped bar plot
ggplot(df)+geom_bar(aes(c))+coord_flip()

#Barplot group by category
ggplot(df, aes(d, fill=c)) + 
  geom_bar(position="dodge")

ggplot(df, aes(d, fill=c)) + 
  geom_bar(position="dodge")+
  scale_fill_grey() #changing the grey colors

#Boxplot using a categorical variable
ggplot(df, aes(d, a))+geom_boxplot()

ggplot(df, aes(d,a))+geom_boxplot()+ 
  geom_jitter() #adding values with some jitter

ggplot(df, aes(d,a))+geom_boxplot()+ 
  geom_jitter(alpha=.5, width=.3, color="blue") #adding color and translucency

ggplot(df, aes(a,b))+
  geom_boxplot(aes(group=cut_width(a,0.5)), outlier.alpha = 0.1)+ 
  geom_jitter(alpha=.5, width=0.02, size=.7, color="blue") #cutting continous values

#Facet plot
ggplot(df, aes(c))+ 
  geom_bar() + facet_grid(d~.)

#2d density plot
ggplot(df, aes(a,b))+ geom_point(size=1) + geom_density2d()

install.packages("hexbin")

library(hexbin)
#Scatterplot with hexbins
ggplot(df, aes(a,b))+geom_hex( bins=30)

#Adding regression line
ggplot(df, aes(a,b))+geom_point()+geom_smooth(method = lm)
gg1<-ggplot()+geom_point(data=df, aes(a,b,colour=c)) #you can "store" your plot to not copy everything again
gg1 + theme_bw()
gg1 + theme_linedraw()+geom_bin2d() 

#define your theme
ggplot()+
  geom_point(data=df, aes(a,b,colour=c))+
  facet_grid(a~b)+
  ggtitle("my chart")+
  theme(plot.title = element_text(angle = 0, size = 22, colour = "hotpink"))+
  scale_colour_discrete(name="type")

install.packages("hrbrthemes", repos = "https://cinc.rud.is")
library(hrbrthemes)
library(gcookbook)
library(tidyverse)

ggplot(df, aes(a,b)) +
  geom_point(color = ft_cols$yellow) +
  labs(x="Fuel efficiency (mpg)", y="Weight (tons)",
       title="Seminal ggplot2 scatterplot example",
       subtitle="A plot that is only useful for demonstration purposes",
       caption="Brought to you by the letter 'g'") + 
  theme_ft_rc()
