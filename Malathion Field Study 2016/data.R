library(lsmeans)
library(stats)
Data=read.csv("biomass.csv")
str(Data)

Data$TRT=as.factor(Data$TRT)
Data$REP=as.factor(Data$REP)

fit<-aov(Biomass ~ P450*Herbicide, data=Data)
summary(fit)
lsmeans(fit, pairwise ~ P450*Herbicide)

x11()
plot(Biomass~TRT, data=Data)


#Plot residuals
old.par = par(mfrow = c(2, 2))
plot(fit)



#Boxplot 
x11()
boxplot(Biomass~ P450*Herbicide, data=Data)



#See plot 
with(Data, interaction.plot(x.factor=P450, trace.factor=Herbicide,
                           response=Biomass, fun=mean, type="b", legend=T,
                           ylab="Biomass (g)", main="Interaction Plot",
                           col=c(1,2,3,4), lwd=2, pch=c(1,2,3,4)))


#See plot given a factor
coplot(Biomass~ P450 | Herbicide, data=Data, panel=panel.smooth,
       xlab="Total Biomass Reduction data: Biomass vs P450 fb Herbicide, given type of Herbicide")


coplot(Biomass~  Herbicide | P450, data=Data, panel=panel.smooth,
       xlab="Total Biomass Reduction data: Biomass vs P450 fb Herbicide, given type of P450")

lsmeans(fit, pairwise ~ P450*Herbicide)


fit1<-aov(Biomass~ TRT + Error(REP), data=Data)
summary(fit1)

lsmeans(fit1, pairwise ~ TRT)
