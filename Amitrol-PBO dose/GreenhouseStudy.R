
library(drc)

Dose=read.csv("Dose.csv")
str(Dose)



plot (Control~ RateM, cex=2.0, cex.axis=1.0, cex.lab=1.4, cexlab=1.7, lwd=3, font.axis=2, pch=1, data = Dose,las=1,
      xlab = expression(paste("Amitrole (g ai ha "^"-1",")")),
      ylab = expression(paste("Control and Biomass Reduction (%)")), type="none",
      xlim=c(0,1100), ylim=c(0,100), main="21 DAT - Waterhemp 8-10 cm")

Amitrol1<-drm(Control~ RateM, fct=l3 (fixed =c(NA,100,NA)),data=Dose, subset = Herbicide == "Amitrole")
Amitrol2<-drm(DMR~ RateM, fct=l3 (fixed =c(NA,100,NA)),data=Dose, subset = Herbicide == "Amitrole")
plot(Amitrol1, add=T, col=1, type="confidence", lty=1, cex=1.4, cex.axis=1.0, cexlab=1.7, lwd=5, font.axis=5, pch=16, bp=0.01, xlim=c(0,1100))
plot(Amitrol2, add=T, col=2, type="confidence", lty=2, cex=1.4, cex.axis=1.0, cexlab=1.7, lwd=5, font.axis=5, pch=1, bp=0.01, xlim=c(0,1100))
legend ("bottomright", legend= c("Control", "Biomass Reduction"), col=c(1,2), cex=1, lty=c(16,1),lwd=3,pch=c(16,1))




ED(Amitrol1, c(10, 30, 40, 50, 90))
ED(Amitrol2, c(10, 30, 40, 50, 90))


#############################################################################################

plot (DMR~ RateM, cex=2.0, cex.axis=1.0, cex.lab=1.4, cexlab=1.7, lwd=3, font.axis=2, pch=1, data = Dose,las=1,
      xlab = expression(paste("PBO (g ai ha "^"-1",")")),
      ylab = expression(paste("Control and Biomass Reduction (%)")), type="none",
      xlim=c(0,1100), ylim=c(0,100), main="21 DAT - Waterhemp 8-10 cm")

PBO1<-drm(Control~ RateM, fct=l3 (fixed =c(NA,100,NA)),data=Dose, subset = Herbicide == "PBO")
PBO2<-drm(DMR~ RateM, fct=l3 (fixed =c(NA,100,NA)),data=Dose, subset = Herbicide == "PBO")
plot(PBO1, add=T, type="points", col=1, lty=1, cex=1.4, cex.axis=1.0, cexlab=1.7, lwd=5, font.axis=5, pch=16, bp=0.01, xlim=c(0,1100))
plot(PBO2, add=T, col=2, lty=2, cex=1.4, cex.axis=1.0, cexlab=1.7, lwd=5, font.axis=5, pch=1, bp=0.01, xlim=c(0,1100))
legend ("bottomright", legend= c("Control", "Biomass Reduction"), col=c(1,2), cex=1, lty=c(16,1),lwd=3,pch=c(16,1))

modelFit(PBO1)
modelFit(PBO2)
