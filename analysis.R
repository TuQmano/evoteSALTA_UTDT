###### SCRIPT FINAL TESIS########### SPLIT VOTE
###### Importar dBase####
Salta<- read.csv("~/Dropbox/TESIS/SaltaWideRecoded.csv")  #### ESTE ARCHIVO SE TIENE QUE HABER CREADRO CON EL SCRIPT data_managment.R
Salta$X=NULL

###CONSTRUCCION DE LA VARIABLE DEPENDIENTE#####
### DIFERENCIA ENTRE CATEGORIAS 
Salta$DiffCategoria <- Salta$GOBERNADOR - Salta$LEGISLADOR
#Diferencia en valor absoluto
Salta$DiffABS <- abs(Salta$DiffCategoria)


### SUMATORIA DE DIFERENCIAS (Collapse para pasar de mesas a circuitos, eliminando var "listas")

library("plyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")
Salta <- ddply(Salta, c("VE", "Year", "Circuito", "Municipio"), summarize, DiffABS = sum (DiffABS))
colnames(Salta) <- c("VE", "Year", "Circuito", "Municipio","VDsum") 
#VDsum es la VD collapsed por circuito


#### HACER INPUT DE TOTALES DE VOTOS POR CATEGORIA (en otro script)
  #file.edit("~/Dropbox/TESIS/Codigo y data FINAL/SCRIPT TOTALES.R")
  
###
###
###
###
###
###
###
###
###
####


#VDsum dividido 2
Salta$VDdos <- Salta$VDsum/2

#MAX para determinar "votos validos" entre las dos categorias
MAX <- Salta$pmax <- do.call(pmax,Salta[c("TotalGob","TotalLeg")])
rm(MAX)

#Hacer VD  ((Diferencia GOB - LEGIS/2 ) /Votos MAX de lista en esas categorias)
VD <- Salta$VDdos/Salta$pmax   

#VD final "Share SplitVote por circuito"
Salta <- cbind(Salta, VD)

#PLOT  Kernel Density (con atributos de estilo) de la VD para cada circuito <- (|VotosGOB - VotosLEG| /2)/TotalValidos

d <- density(Salta$VD)
plot(d)
plot(d, main="Kernel Density of VD (Split Vote)")
polygon(d, col="red", border="blue")


#############################################
##########          MODELOS    ##############
#############################################


#####  MODELO 1 - DIFF IN DIFF PROVINCIA - PARA EL UNIVERSO "PROVINCIA DE SALTA"#####  MODELO 1 ##############
# Compute the four data points needed in the DID calculation:
 

a = sapply(subset(Salta, Year == 0 & VE == 0, select=VD), mean)
b = sapply(subset(Salta, Year == 0 & VE == 1, select=VD), mean)
c = sapply(subset(Salta, Year == 1 & VE == 0, select=VD), mean)
d = sapply(subset(Salta, Year == 1 & VE == 1, select=VD), mean)
DiD_PROVINCIA <- (d-c)-(b-a)


###MODELO 1  - Toda la provincia####REGRESION

INTERACCION= Salta$Year*Salta$VE
reg=lm(Salta$VD ~ Year + VE + INTERACCION, data = Salta)
summary(reg)  


##GENERAR TABLA HTML (para copiar y pegar en WORD)
library(xtable)
regModel1Table <- xtable(reg)
print.xtable(regModel1Table, type="html", file="TableModel1.html")

#RESIDUALS ANALYSIS
reg.stdres = rstandard(reg)
qqnorm(reg.stdres, ylab = "Standarized Residuals", xlab = "Normal Scores", main="PROVINCIA - Split vote (VD) = a + bX (eVote) + cY(year) + cZ(X*Y)")
qqline(reg.stdres)

boxplot(residuals(reg)) 
OutliersSALTACompleto <- boxplot(residuals(reg))
OutliersSALTACompleto$out

## yHat para RESIDUAL ANALYSIS
Residuos1 <- data.frame(Salta, y_hat = fitted(reg), e = residuals(reg))
hist(Residuos1$e)  #HISTOGRAMA

KernelResiduals1 <- density(Residuos1$e)
plot(KernelResiduals1) #Kernel - DENSIDAD

#kernel density de VD
dModel1 <- density(Salta$VD)
plot(dModel1)
plot(dModel1, main="Kernel Density of VD (Split Vote) MODEL 1")
polygon(dModel1, col="red", border="blue")



####MODELO 2 -  SUBSET DISTRITOS  DEPARTAMENDO SALTA (Municipios Salta y San Lorenzo)#####
SaltaYSLorenzo <- Salta [Salta$Municipio %in% c(49,52),] 
setwd("~/Desktop")
write.csv (SaltaYSLorenzo, "~/eVote DEPTOSalta.csv")


m = sapply(subset(SaltaYSLorenzo, Year == 0 & VE == 0 , select=VD), mean)
n = sapply(subset(SaltaYSLorenzo, Year == 0 & VE == 1 , select=VD), mean)
o = sapply(subset(SaltaYSLorenzo, Year == 1 & VE == 0 , select=VD), mean)
p = sapply(subset(SaltaYSLorenzo, Year == 1 & VE == 1 , select=VD), mean)

DiD3_DEPTO_SALTA <- (p-o)-(n-m)

INTERACCION3= SaltaYSLorenzo$Year * SaltaYSLorenzo$VE
reg3=lm(SaltaYSLorenzo$VD ~ Year + VE + INTERACCION3, data = SaltaYSLorenzo )
summary(reg3)  


##GENERAR TABLA HTML (para copiar y pegar en WORD)
library(xtable)
regModel3Table <- xtable(reg3)
print.xtable(regModel3Table, type="html", file="TableModel3.html")


#RESIDUALS ANALYSIS2
reg.stdres = rstandard(reg3)
qqnorm(reg.stdres, ylab = "Standarized Residuals", xlab = "Normal Scores", main="Split vote (VD) - Capital y S.Lorenzo Completo= a + bX (eVote) + cY(year) + cZ(X*Y)")
qqline(reg.stdres)

boxplot(residuals(reg3)) 

## yHat para RESIDUAL ANALYSIS ???? 
Residuos3 <- data.frame(SaltaYSLorenzo, y_hat = fitted(reg3), e = residuals(reg3))
hist(Residuos2$e)  #HISTOGRAMA

KernelResiduals3 <- density(Residuos3$e)
plot(KernelResiduals3) #Kernel - DENSIDAD

#kernel density de VD
dModel3 <- density(SaltaYSLorenzo$VD)
plot(dModel3)
plot(dModel3, main="Kernel Density of VD (Split Vote) MODEL 3")
polygon(dModel3, col="red", border="blue")



#### MODELO 3 SUBSET CIRCUITOS SELECCIONADOS POR MATCHINGDEPARTAMENDO SALTA (Municipios Salta y San Lorenzo -> es lo que hicieron en paper JOP)#####

CircuitosCapital <- Salta [Salta$Circuito %in% c("2D","5A","2G","3B","2H","5C","3C","2I","5E","3D","5F","3E","2K","5G","1F","3F","2L","5I","3K","2N","2A","5K","2P","5L","4C","2Q","2E","3G","2F","5H","3H","2M","3A"),]

setwd("~/Desktop")
write.csv (CircuitosCapital, "~/eVote Circuitos Capital.csv")


q = sapply(subset(CircuitosCapital, Year == 0 & VE == 0 , select=VD), mean)
r = sapply(subset(CircuitosCapital, Year == 0 & VE == 1 , select=VD), mean)
s = sapply(subset(CircuitosCapital, Year == 1 & VE == 0 , select=VD), mean)
t = sapply(subset(CircuitosCapital, Year == 1 & VE == 1 , select=VD), mean)

DiD4_SaltaCircuitos <- (t-s)-(r-q)

#REG
INTERACCION4= CircuitosCapital$Year * CircuitosCapital$VE
reg4=lm(CircuitosCapital$VD ~ Year + VE + INTERACCION4, data = CircuitosCapital )
summary(reg4)  


#RESIDUALS ANALYSIS2
reg.stdres = rstandard(reg4)
qqnorm(reg.stdres, ylab = "Standarized Residuals", xlab = "Normal Scores", main="Split vote (VD) - Salta Capital= a + bX (eVote) + cY(year) + cZ(X*Y)")
qqline(reg.stdres)

## yHat para RESIDUAL ANALYSIS ???? 
Residuos4 <- data.frame(CircuitosCapital2, y_hat = fitted(reg4), e = residuals(reg4))
hist(Residuos4$e)  #HISTOGRAMA

KernelResiduals4 <- density(Residuos4$e)
plot(KernelResiduals4) #Kernel - DENSIDAD

###BOXPOLOT Y OUTLIERS
Residuos4Box<- boxplot(residuals(reg4))
Residuos4Box$out


#kernel density de VD
dModel4 <- density(CircuitosCapital2$VD)
plot(dModel4)
plot(dModel4, main="Kernel Density of VD (Split Vote) MODEL 4")
polygon(dModel4, col="red", border="blue")


###MODELO 4  - SUBSET DEPARTAMENTOS QUE UTILIZARON eVote (menos Cafayate y DEPTO CAPITAL )######
Depto_eVOTEInterior <- Salta[Salta$Municipio %in% c(30,48,51,11,26,40,42,58,59),]


a1 = sapply(subset(Depto_eVOTEInterior, Year == 0 & VE == 0 , select=VD), mean)
b1 = sapply(subset(Depto_eVOTEInterior, Year == 0 & VE == 1 , select=VD), mean)
c1 = sapply(subset(Depto_eVOTEInterior, Year == 1 & VE == 0 , select=VD), mean)
d1 = sapply(subset(Depto_eVOTEInterior, Year == 1 & VE == 1 , select=VD), mean)

DiD7_DEPTOS_eVOTE_Interior <- (d1-c1)-(b1-a1)

#REG
INTERACCION6= Depto_eVOTEInterior$Year * Depto_eVOTEInterior$VE
reg6=lm(Depto_eVOTEInterior$VD ~ Year + VE + INTERACCION6, data = Depto_eVOTEInterior )
summary(reg6)  

setwd("~/Desktop")
write.csv (Depto_eVOTEInterior, "~/eVote Interior.csv")

##GENERAR TABLA HTML (para copiar y pegar en WORD)
library(xtable)
regModel6Table <- xtable(reg6)
print.xtable(regModel5Table, type="html", file="TableModel5.html")

#RESIDUALS ANALYSIS
reg.stdres = rstandard(reg6)
qqnorm(reg.stdres, ylab = "Standarized Residuals", xlab = "Normal Scores", main="Split vote (VD) - DEPTOS con eVote INTERIOR= a + bX (eVote) + cY(year) + cZ(X*Y)")
qqline(reg.stdres)


## yHat para RESIDUAL ANALYSIS 
Residuos5 <- data.frame(Depto_eVOTEInterior, y_hat = fitted(reg6), e = residuals(reg6))
hist(Residuos6$e)  #HISTOGRAMA

KernelResiduals6 <- density(Residuos6$e)
plot(KernelResiduals6) #Kernel - DENSIDAD

###BOXPOLOT Y OUTLIERS
Residuos6Box<- boxplot(residuals(reg6))
Residuos6Box$out

dModel6 <- density(Depto_eVOTEInterior$VD)
plot(dModel6)
plot(dModel6, main="Kernel Density of VD (Split Vote) MODEL 6")
polygon(dModel6, col="red", border="blue")
