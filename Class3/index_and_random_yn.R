#Indexing using and other useful functions
df_1<-data.frame(plot="location_name_1",measure1=runif(100)*1000, measure2=round(runif(100)*100),value=rnorm(100,2,1),ID=rep(LETTERS,100)[1:100])
df_2<-data.frame(plot="location_name_2", measure1=runif(50)*100, measure2=round(runif(50)*10),value=rnorm(50), ID=rep(LETTERS,50)[1:50])
df<-rbind(df_1,df_2) #combine two data frame row-wise, cbind for columns
df

df[df$value>3.0,]
df[df$value>3.2| df$measure1>50 ,]

df$new_col<-df$measure1*df$measure2
df[1:4,]

# query using keyword
df[grep("a", df$ID, ignore.case = T),]
df[grep("a", df$ID, ignore.case = F),] #0 rows

#Random list of yes or no

x1<-rbinom(10,size =1, prob=0.5)
x2<-factor(x1, labels=c("yes","no"))
summary(x2)
levels(x2)
as.character(x2)

install.packages("car")
library(car)
recode(x2,"'yes'='sure'; 'no'='maybe'")
ifelse(x2=="no","maybe","sure")
