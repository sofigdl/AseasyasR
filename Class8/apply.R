m<-matrix(data = cbind(rnorm(30,0), rnorm(30, 2), rnorm(30,5)), nrow=10, ncol=3)
m

mean(m[,1])

m.mean<-vector()

m.mean<-for (i in 1:ncol(m)) {
m.mean[i]<-mean(m[,1])  
}
m.mean

apply(m,1,mean)
apply(m,2,function(x) length(x[x<0]))
apply(m, 2, function(x) mean(x[x>0]))

sapply(1:3, function(x) x^2)
lapply(1:3, function(x) x^2)
