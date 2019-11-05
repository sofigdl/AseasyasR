install.packages("datapasta") #copy&paste information
#Pestañita de addins y buscar paste
prueba<-data.frame(stringsAsFactors=FALSE,
                   No. = c("33-01", "33-02", "33-03", "33-04", "33-05",
                           "33-06", "33-07", "33-08", "33-09"),
                   X = c(14.41069, 14.41061, 14.41062, 14.4106, 14.4106,
                         14.41059, 14.41056, 14.41054, 14.41053),
                   Y = c(-90.53508, -90.53507, -90.53504, -90.53501,
                         -90.53498, -90.53497, -90.53498, -90.53499,
                         -90.53501),
                   Circunferencia.cm = c(134L, 128L, 88L, 121L, 186L, 32L, 38L, 45L, 37L)
)
summary(prueba)