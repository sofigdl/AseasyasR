#Combining movement and raster data

data(buffalo_utm)
data(buffalo_env)

##Extract encironmental data behind buffalo points
env <- extract(buffalo_env, buffalo_utm)

##sample random points
bg<-sampleRandom(buffalo_env,10000)

##Compare background to observed locations
env_df<-data.frame(melt(env), type= "observed")
bg<-data.frame(melt(bg), type="background")
comb_df<-rbind(env_df, bg)

ggplot(comb_df, aes(x=type, y=value, fill=type)) + 
  geom_violin()+
  facet_wrap(~Var2, ncol=5, scales="free")


##mean environmet arounf samples
meanEnv<- extract(buffalo_env, buffalo_utm, buffer=10, fun=mean)

##Fraction of green/dense vegetatuin in sorroundings
greenFraction<-extract(buffalo_env[["mean_NDVI"]], buffalo_utm[["Cilla"]],
                       buffer=300,
                       fun=function(x){
                         sum(x>0.5, na.rm = TRUE)/sum(! is.na(x))
                       })
hist(greenFraction)