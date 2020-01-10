#library(caret)

# data/code from "2 class example" example courtesy of ?caret::confusionMatrix

#lvs <- c("Forest", "Water")
#truth <- factor(rep(lvs, times = c(86, 258)),
#                levels = rev(lvs))
#pred <- factor(
#  c(
#    rep(lvs, times = c(54, 32)),
#    rep(lvs, times = c(27, 231))),
#  levels = rev(lvs))

#confusionMatrix(pred, truth)

cm_test<-as.data.frame(sc1$validation$performance$table)
cm_test
plotTable <- cm_test %>%
  mutate(goodbad = ifelse(cm_test$Prediction == cm_test$Reference, "good", "bad")) %>%
  group_by(Reference) %>%
  mutate(prop = Freq/(sum(Freq)))
sum(cm_test$Freq)
plotTable
# fill alpha relative to sensitivity/specificity by proportional outcomes within reference groups (see dplyr code above as well as original confusion matrix for comparison)
ggplot(data = plotTable, mapping = aes(x = Reference, y = Prediction, fill = goodbad, alpha = prop)) +
  geom_tile() +
  geom_text(aes(label = Freq), vjust = .5, fontface  = "bold", alpha = 1) +
  scale_fill_manual(values = c(good = "darkgreen", bad = "red")) +
  theme_light()+
  ggtitle("Confusion Matrix for Landcover classification")
