Data=read.csv("ANOVA.csv")
str(Data)

fit<-aov(Y~TRT, data=Data)
summary(fit)

fit1<-aov(Y~fresh, data=Data)
summary(fit1)


