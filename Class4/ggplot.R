install.packages("ggplot2")
library(ggplot2)
x<-data.frame(x=1,y=1, label=" ggplot2 introduction\ n@ EAGLE")
#ggplot(dataset, aes(x=xValue, y=yValue))+geom_histogram
ggplot(data=x, aes(x=x,y=y)) +geom_text(aes(label=label), size=15)

#Create some data for plottong examples
x1<- rnorm(1000,0,1)
x2<- rnorm(1000,5.10)
x3<- rep(c("catA","catB", "catB", "catC", "catC"),200)[1:1000]
x4<- factor(rep(c("yes","no"),500))
df<-data.frame(a=x1, b=x2,c=x3, d=x4)

library(ggplot2)
ggplot(df, aes(a,b))
ggplot(df, aes(a, b)) + geom_point()
ggplot(df, aes(a,b, color=c))+geom_point(alpha=.5)
ggplot(df, aes(a,b, color=c))+geom_point(alpha=.5)+ labs(title="first plot", x="x axis\n and a new line")

ggplot(df, aes(a))+geom_histogram(color="white")

ggplot(df, aes(a))+ geom_density()
ggplot(df)+ geom_histogram(aes(a, ..density..), fill="blue", colour="darkgrey")+geom_density(aes(a, ..density..), fill="blue", colour="yellow")+geom_rug(aes(a))
ggplot(df, aes(c, color=c)) +geom_point(stat = "count", size=4)
ggplot(df)+geom_bar(aes(c))+coord_flip()
ggplot(df, aes(d, fill=c)) + geom_bar(position="dodge")
ggplot(df, aes(d, fill=c)) + geom_bar(position="dodge")+scale_fill_grey()
ggplot(df, aes(d, a))+geom_boxplot()
ggplot(df, aes(d,a))+geom_boxplot()+ geom_jitter()
ggplot(df, aes(d,a))+geom_boxplot()+ geom_jitter(alpha=.5, width=.3, color="blue")
ggplot(df, aes(a,b))+geom_boxplot(aes(group=cut_width(a,0.5)), outlier.alpha = 0.1)+ 
  geom_jitter(alpha=.5, width=0.02, size=.7, color="blue")
ggplot(df, aes(c))+ geom_bar() + facet_grid(d~.)
ggplot(df, aes(a,b))+ geom_point(size=1) + geom_density2d()
ggplot(df, aes(a,b))+geom_hex( bins=30)
ggplot(df, aes(a,b))+geom_point()+geom_smooth(method = lm)
gg1<-ggplot()+geom_point(data=df, aes(a,b,colour=c))
gg1 + theme_bw()
gg1 + theme_linedraw()+geom_bin2d() 
