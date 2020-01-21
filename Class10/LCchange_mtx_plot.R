install.packages("datapasta")
library(datapasta)
library(dplyr)
?datapasta
change.mtx<-data.frame(
  check.names = FALSE,
       `2006` = c(1L,1L,1L,1L,1L,1L,2L,2L,2L,2L,
                  2L,2L,3L,3L,3L,3L,3L,3L,4L,4L,4L,4L,4L,4L,5L,5L,
                  5L,5L,5L,5L,6L,6L,6L,6L,6L,6L),
       `2016` = c(1L,2L,3L,4L,5L,6L,1L,2L,3L,4L,
                  5L,6L,1L,2L,3L,4L,5L,6L,1L,2L,3L,4L,5L,6L,1L,2L,
                  3L,4L,5L,6L,1L,2L,3L,4L,5L,6L),
    Frecuency = c(3591L,97L,290L,3L,2L,8L,24L,2001L,
                  52L,8L,2L,2L,160L,441L,4204L,12L,5L,20L,0L,1L,1L,
                  140L,1L,0L,0L,1L,7L,0L,237L,3L,0L,2L,10L,0L,3L,
                  41L)
  )

plotTable <- change.mtx %>%
  mutate(goodbad = ifelse(change.mtx$`2006` == change.mtx$`2016`, "no.change", "change")) %>%
  group_by(`2006`) %>%
  mutate(prop = Frecuency/(sum(Frecuency)))
sum(change.mtx$Frecuency)
plotTable
# fill alpha relative to sensitivity/specificity by proportional outcomes within reference groups (see dplyr code above as well as original confusion matrix for comparison)
ggplot(data = plotTable, mapping = aes(x = `2006`, y = `2016`, fill = goodbad, alpha = prop)) +
  geom_tile() +
  geom_text(aes(label = Frecuency), vjust = .5, fontface  = "bold", alpha = 1) +
  #scale_fill_manual(values = c(no.change = "darkgreen", change = "orange")) +
  theme_light()+
  ggtitle("Matrix for Land cover change classification")
