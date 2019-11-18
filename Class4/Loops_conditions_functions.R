#LOOPS, CONDITIONS AND FUNCTIONS

##If-else statements
a<-5
if (a<0)
{
 print("It is a positive number")
}

if (a!=5)
{
  print("number is not equal 5")
} else 
{
    print("number is equal to 5")
}

set.seed(100)
abc<-sample(letters[1:5], 1000, replace = T)
df<-data.frame(v1=abc, v2="blank", stringsAsFactors = F)
head(df)

system.time({
  df$v2<-ifelse(df$v1=="a","apple",
          ifelse(df$v1=="b", "ball",
         ifelse(df$v1=="c", "cat",
          ifelse(df$v1=="d","dog","elephant"))))
})

for (i in 1:nrow(df)){
  val<-df$v1[i]
  df$v2[i]<-switch(val,
                   "a"="apple",
                   "b"="banana",
                   "c"="cat",
                   "d"="dog",
                   "e"="elephant")
}
head(df)

## While statement
J<-0
while (J<1) {
    J<-J+0.1 ; print(J)
}

##Creating a function
function_test<- function(x,y){
  z<-x+y
  return(z)
  }
function_test(4,3)

greet<-function(name){
  "How do you do,name?"
} #No funciona bien
greet("Sofi")

greet<-function(name){
  paste0("How do you do,",name,"?")
}
greet("Sofi")

fun_ndvi<-function(nir,red){(nir-red)/(nir+red)}

