C=read.csv("CONTROL.csv")
str(C)

#Control
library(drc)
plot (Control~ RateM, cex=2.0, cex.axis=1.0, cex.lab=1.4, cexlab=1.7, lwd=3, font.axis=2, pch=1, data = C,las=1,
      xlab = expression(paste("Herbicide (g ai ha "^"-1",")")),
      ylab = expression(paste("Control (%)")), type="none",
      xlim=c(0,850), ylim=c(0,100), main="21 DAT - Waterhemp 8-10 cm")

MC<-drm(Control~ RateM, Herbicide, fct=l3 (fixed =c(NA,100,NA)),data=C)
plot(MC, add=T, col=c(1,2), lty=c(1,2), cex=1.4, legend=F, 
     cex.axis=1.0, cexlab=1.7, lwd=3, font.axis=5, pch=c(16,1), bp=0.01, xlim=c(0,850))
legend ("bottomright", legend= c ("Mesotrione", "Malathion+Mesotrione"),col=c(1, 2), cex=1, lty=c(1,2),lwd=3,pch=c(16,1))

summary(MC)
EDcomp(MC, c(50,50))
ED(MC, c(70,80))

#Biomass
library(drc)
plot (BM~ RateM, cex=2.0, cex.axis=1.0, cex.lab=1.4, cexlab=1.7, lwd=3, font.axis=2, pch=1, data = C,las=1,
      xlab = expression(paste("Herbicide (g ai ha "^"-1",")")),
      ylab = expression(paste("Biomass Reduction (%)")), type="none",
      xlim=c(0,850), ylim=c(0,100), main="21 DAT - Waterhemp 8-10 cm")

MB<-drm(BM~ RateM, Herbicide, fct=l3 (fixed =c(NA,100,NA)),data=C)
plot(MB, add=T, col=c(1,2), lty=c(1,2), cex=1.4, legend=F,  
     cex.axis=1.0, cexlab=1.7, lwd=3, font.axis=5, pch=c(16,1), bp=0.01, xlim=c(0,850))

legend ("bottomright", legend= c ("Mesotrione", "Malathion+Mesotrione"),col=c(1, 2), cex=1, lty=c(1,2),lwd=3,pch=c(16,1))

summary(MB)
ED(MB, c(70,80))
EDcomp(MB, c(70,70))
