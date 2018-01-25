
############### SCRIPT DATA MANAGMENT PARA ELECCIONES 2007 Y 2011 #################
SALTA<- read.csv("https://github.com/TuQmano/evoteSALTA_UTDT/blob/master/data.csv")
View(SALTA)
SALTA$X=NULL

###CIRCUITOS QUE ESTAN EN 2011 pero no en 2007. BORRAR
SALTA <- SALTA[!SALTA$Circuito == "20A", ]
SALTA <- SALTA[!SALTA$Circuito == "33C", ]
SALTA <- SALTA[!SALTA$Circuito == "46I", ]
SALTA <- SALTA[!SALTA$Circuito == "51C", ]



###CIRCUITOS QUE ESTABAN EN 2007 PERO FUERON INTEGRADOS EN OTRO EN 2011

SALTA$Circuito[SALTA$Circuito =="94B" & SALTA$Year== "2007"] <-"93A"
SALTA$Circuito[SALTA$Circuito =="24F" & SALTA$Year== "2007"] <-"24E"
SALTA$Circuito[SALTA$Circuito =="14A" & SALTA$Year== "2007"] <-"13A"
SALTA$Circuito[SALTA$Circuito =="96A" & SALTA$Year== "2007"] <-"95A"


#### UNA ESCUELA DIVIDE SUS MESAS ENTRE DOS CIRCUITOS EN 2011 ! -> COLEGIO NUMERO 5147 Dr. Salvador Mazza
#### RECODIFICAR MESAS ASIGNADAS AL CIRCUITO 1F COMO 3D
SALTA$Circuito[SALTA$Mesa =="1573" & SALTA$Year== "2011"] <-"3D"
SALTA$Circuito[SALTA$Mesa =="1574" & SALTA$Year== "2011"] <-"3D"
SALTA$Circuito[SALTA$Mesa =="1575" & SALTA$Year== "2011"] <-"3D"
SALTA$Circuito[SALTA$Mesa =="1576" & SALTA$Year== "2011"] <-"3D"
SALTA$Circuito[SALTA$Mesa =="1577" & SALTA$Year== "2011"] <-"3D"


#RESHAPE (de long a wide -> poner como una nueva variable cada cargo electivo)
library(reshape2)
SALTA <- dcast(SALTA,  Municipio + Mesa +  Lista + VE + Year + Circuito ~ Cargo, value.var = "Votos", sum)
View(SALTA)

                    ####      



########## CREAR VARs RECODED ############### 
#(nueva como factor y sumar a data.frame)

#MUNICIPIO
MunicipioF <- c(0:0)
SALTA <- cbind(SALTA, MunicipioF)
rm(MunicipioF)

#MUNICIPIO#
SALTA$MunicipioF[ SALTA$Municipio == "AGUARAY"] <- 1
SALTA$MunicipioF[ SALTA$Municipio == "ANGASTACO"] <- 2
SALTA$MunicipioF[ SALTA$Municipio == "ANIMANA"] <- 3
SALTA$MunicipioF[ SALTA$Municipio == "APOLINARIO SARAVIA"] <- 4
SALTA$MunicipioF[ SALTA$Municipio == "CACHI"] <- 5
SALTA$MunicipioF[ SALTA$Municipio == "CAFAYATE"] <- 6
SALTA$MunicipioF[ SALTA$Municipio == "CAMPO QUIJANO"] <- 7
SALTA$MunicipioF[ SALTA$Municipio == "CAMPO SANTO"] <- 8
SALTA$MunicipioF[ SALTA$Municipio == "CERRILLOS"] <- 9
SALTA$MunicipioF[ SALTA$Municipio == "CHICOANA"] <- 10
SALTA$MunicipioF[ SALTA$Municipio == "COLONIA SANTA ROSA"] <- 11
SALTA$MunicipioF[ SALTA$Municipio == "CORONEL MOLDES"] <- 12
SALTA$MunicipioF[ SALTA$Municipio == "EL BORDO"] <- 13
SALTA$MunicipioF[ SALTA$Municipio == "EL CARRIL"] <- 14
SALTA$MunicipioF[ SALTA$Municipio == "EL GALPON"] <- 15
SALTA$MunicipioF[ SALTA$Municipio == "EL JARDIN"] <- 16
SALTA$MunicipioF[ SALTA$Municipio == "EL POTRERO"] <- 17
SALTA$MunicipioF[ SALTA$Municipio == "EL QUEBRACHAL"] <- 18
SALTA$MunicipioF[ SALTA$Municipio == "EL TALA"] <- 19
SALTA$MunicipioF[ SALTA$Municipio == "EMBARCACION"] <- 20
SALTA$MunicipioF[ SALTA$Municipio == "GENERAL BALLIVIAN"] <- 21
SALTA$MunicipioF[ SALTA$Municipio == "GENERAL GUEMES"] <- 22
SALTA$MunicipioF[ SALTA$Municipio == "GENERAL MOSCONI"] <- 23
SALTA$MunicipioF[ SALTA$Municipio == "GENERAL PIZARRO"] <- 24
SALTA$MunicipioF[ SALTA$Municipio == "GUACHIPAS"] <- 25
SALTA$MunicipioF[ SALTA$Municipio == "HIPOLITO YRIGOYEN"] <- 26
SALTA$MunicipioF[ SALTA$Municipio == "IRUYA"] <- 27
SALTA$MunicipioF[ SALTA$Municipio == "ISLA DE CANAS"] <- 28
SALTA$MunicipioF[ SALTA$Municipio == "JOAQUIN V. GONZALEZ"] <- 29
SALTA$MunicipioF[ SALTA$Municipio == "LA CALDERA"] <- 30
SALTA$MunicipioF[ SALTA$Municipio == "LA CANDELARIA"] <- 31
SALTA$MunicipioF[ SALTA$Municipio == "LA MERCED"] <- 32
SALTA$MunicipioF[ SALTA$Municipio == "LA POMA"] <- 33
SALTA$MunicipioF[ SALTA$Municipio == "LA VINA"] <- 34
SALTA$MunicipioF[ SALTA$Municipio == "LAS LAJITAS"] <- 35
SALTA$MunicipioF[ SALTA$Municipio == "LOS TOLDOS"] <- 36
SALTA$MunicipioF[ SALTA$Municipio == "MOLINOS"] <- 37
SALTA$MunicipioF[ SALTA$Municipio == "NAZARENO"] <- 38
SALTA$MunicipioF[ SALTA$Municipio == "PAYOGASTA"] <- 39
SALTA$MunicipioF[ SALTA$Municipio == "PICHANAL"] <- 40
SALTA$MunicipioF[ SALTA$Municipio == "PROF. SALVADOR MAZA"] <- 41
SALTA$MunicipioF[ SALTA$Municipio == "PROF. SALVADOR MAZZA"] <- 41   ##### UNO DE LOS DOS YEARS SALVADOR MAZA ESTABA MAL ESCRITO!!!!!
SALTA$MunicipioF[ SALTA$Municipio == "RIO PIEDRAS"] <- 42
SALTA$MunicipioF[ SALTA$Municipio == "RIVADAVIA BANDA NORTE"] <- 43
SALTA$MunicipioF[ SALTA$Municipio == "RIVADAVIA BANDA SUR"] <- 44
SALTA$MunicipioF[ SALTA$Municipio == "ROSARIO DE LA FRONTERA"] <- 45
SALTA$MunicipioF[ SALTA$Municipio == "ROSARIO DE LERMA"] <- 46
SALTA$MunicipioF[ SALTA$Municipio == "S. ANTONIO DE LOS COBRES"] <- 47
SALTA$MunicipioF[ SALTA$Municipio == "S. RAMON DE LA NUEVA ORAN"] <- 48
SALTA$MunicipioF[ SALTA$Municipio == "SALTA"] <- 49
SALTA$MunicipioF[ SALTA$Municipio == "SAN CARLOS"] <- 50
SALTA$MunicipioF[ SALTA$Municipio == "SAN JOSE DE METAN"] <- 51
SALTA$MunicipioF[ SALTA$Municipio == "SAN LORENZO"] <- 52
SALTA$MunicipioF[ SALTA$Municipio == "SANTA VICTORIA ESTE"] <- 53
SALTA$MunicipioF[ SALTA$Municipio == "SANTA VICTORIA OESTE"] <- 54
SALTA$MunicipioF[ SALTA$Municipio == "SECLANTAS"] <- 55
SALTA$MunicipioF[ SALTA$Municipio == "TARTAGAL"] <- 56
SALTA$MunicipioF[ SALTA$Municipio == "TOLAR GRANDE"] <- 57
SALTA$MunicipioF[ SALTA$Municipio == "URUNDEL"] <- 58
SALTA$MunicipioF[ SALTA$Municipio == "VAQUEROS"] <- 59


                                #PARTIDOS#
#LISTA
ListaF <- c(0:0)
SALTA <- cbind(SALTA, ListaF)
rm(ListaF)


##########Partidos 2007#########

#0 VOTOS EN BLANCO
# 1 FRENTE JUSTICIALISTA PARA LA VICTORIA (FREJUVI)  (WAYAR - Oficialismo)
# 2 ENCUENTRO POPULAR AMPLIO
# 3 CONCERTACION SALTEN
# 4 PARTIDO HUMANISTA
# 5 PROPUESTA SALTENA
# 6 PARTIDO NUEVA GENERACION 
# 7 MOVIMIENTO SOCIALISTA DE LOS TRABANADORES (MST)
# 8 PARTIDO OBRERO
# 9 MOVIMIENTO POPULAR SALTE??O 
# 10 FRENTE PARA LA VICTORIA - P. RENOVADOR (URTUBEY - Challenger)


#Listas2007
SALTA$ListaF[ SALTA$Lista =="VOTOS EN BLANCO" & SALTA$Year == 2007] <-9999
SALTA$ListaF[ SALTA$Lista =="CONCERTACION SALTENA" & SALTA$Year == 2007] <-3
SALTA$ListaF[ SALTA$Lista =="CORRIENTE PATRIA LIBRE" & SALTA$Year == 2007] <-10
SALTA$ListaF[ SALTA$Lista =="ENCUENTRO POPULAR AMPLIO" & SALTA$Year == 2007] <-2
SALTA$ListaF[ SALTA$Lista =="F.PARA LA VICTORIA-P.RENOVADOR" & SALTA$Year == 2007] <-10
SALTA$ListaF[ SALTA$Lista =="FRENTE GRANDE" & SALTA$Year == 2007] <-10
SALTA$ListaF[ SALTA$Lista =="MOV. SOC. DE LOS TRABAJADORES" & SALTA$Year == 2007] <-7
SALTA$ListaF[ SALTA$Lista =="MOVIMIENTO POPULAR SALTENO" & SALTA$Year == 2007] <-9
SALTA$ListaF[ SALTA$Lista =="MOVIMIENTO REGIONAL DEL PUEBLO" & SALTA$Year == 2007] <-10
SALTA$ListaF[ SALTA$Lista =="PARTIDO CONSERVADOR POPULAR" & SALTA$Year == 2007] <-1
SALTA$ListaF[ SALTA$Lista =="PARTIDO DEL OBRERO" & SALTA$Year == 2007] <-8
SALTA$ListaF[ SALTA$Lista =="PARTIDO DEMOCRATA CRISTIANO" & SALTA$Year == 2007] <-1
SALTA$ListaF[ SALTA$Lista =="PARTIDO HUMANISTA" & SALTA$Year == 2007] <-4
SALTA$ListaF[ SALTA$Lista =="PARTIDO NUEVA GENERACION" & SALTA$Year == 2007] <-6
SALTA$ListaF[ SALTA$Lista =="PJ - FRE.JU.VI." & SALTA$Year == 2007] <-1
SALTA$ListaF[ SALTA$Lista =="PROPUESTA SALTENA" & SALTA$Year == 2007] <-5
SALTA$ListaF[ SALTA$Lista =="UNION VICTORIA POPULAR" & SALTA$Year == 2007] <-1
SALTA$ListaF[ SALTA$Lista =="VECINOS UNIDOS" & SALTA$Year == 2007] <-10




###########Partidos 2011#############

#PARTY LABELS A GOBERNADOR
# 0 VOTOS EN BLANCO
# 1 WAYAR GOBERNADOR  (WALTER WAYAR)
# 2 COALICION CIVICA (ARI) (ALBERTO ROLANDO TONDA)
# 3 FRENTE JUSTICIALISTA RENOVADOR DE LA VICOTRIA (JUAN MANUEL URTUBEY)
# 4 FRENTE OLMEDO GOBERNADOR  (ALFREDO OLMEDO)
# 5 MORELLO GOBERNADOR / PROYECTO SUR  (CARLOS FERNANDO MORELLO)
# 6 PARTIDO OBRERO (CLAUDIO DEL PLA)
# 7 UNION CIVICA RADICAL  (DIEGO MARINO)
# 8 MIJD (CARLOS ARIEL FERNANDEZ)


#RECODE TODOS LOS PARTY LABELS SEGUN ADHESIONES A LISTAS CON CANDIDATOS A GOBERNADOR
SALTA$ListaF[ SALTA$Lista == "VOTOS EN BLANCO" & SALTA$Year == 2011] <-9999
SALTA$ListaF[ SALTA$Lista == "AGRUPACION CRECIMIENTO SOLIDARIO" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "AGRUPACION DEMOCRATICA COMUNAL" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "AGRUPACION DEMOCRATICA TARTAGAL (ADETA)" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "AGRUPACION FEDERALISTA POPULAR MOSCONI" & SALTA$Year == 2011] <-1
SALTA$ListaF[ SALTA$Lista == "AGRUPACION FEDERALISTA POPULAR TARTAGAL" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "AGRUPACION VECINAL AUTONOMA" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "AGRUPACION VECINAL INDEPENDENCIA" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "AGRUPACION VECINAL LA SILLETA" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "AGRUPACION VECINAL TODOS POR ROSARIO" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "COALICION CIVICA - AFIRMACION PARA UNA REPUBLICA IGUALITARIA (A.R.I.)" & SALTA$Year == 2011] <-2
SALTA$ListaF[ SALTA$Lista == "COMPROMETIDOS POR LA GENTE" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "CONVOCATORIA CIUDADANA" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "EL FUTURO DE QUIJANO" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "EL PROGRESO DE EL BORDO" & SALTA$Year == 2007] <-3
SALTA$ListaF[ SALTA$Lista == "FRENTE JUSTICIALISTA RENOVADOR DE LA VICTORIA - FREJUREVI" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "FRENTE OLMEDO GOBERNADOR" & SALTA$Year == 2011] <-4
SALTA$ListaF[ SALTA$Lista == "MEMORIA Y MOVILIZACION SOCIAL" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "MORELLO GOBERNADOR" & SALTA$Year == 2011] <-5
SALTA$ListaF[ SALTA$Lista == "MOVIMIENTO EMPRENDEDOR DE TRABAJO Y ACCION SOCIAL (METAS)" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "MOVIMIENTO INDEPENDIENTE DE JUBILADOS Y DESOCUPADOS" & SALTA$Year == 2011] <-8
SALTA$ListaF[ SALTA$Lista == "MOVIMIENTO ORAN PARA TODOS" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "MOVIMIENTO POPULAR UNIDO (MPU)" & SALTA$Year == 2011] <-1
SALTA$ListaF[ SALTA$Lista == "MOVIMIENTO SOCIAL SOLIDARIO" & SALTA$Year == 2011] <-4
SALTA$ListaF[ SALTA$Lista == "PARTIDO CONSERVADOR POPULAR" & SALTA$Year == 2011] <-4
SALTA$ListaF[ SALTA$Lista == "PARTIDO DE LA VICTORIA" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "PARTIDO FRENTE GRANDE" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "PARTIDO JUSTICIALISTA" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "PARTIDO OBRERO" & SALTA$Year == 2011] <-6
SALTA$ListaF[ SALTA$Lista == "PARTIDO RENOVADOR DE SALTA" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "PARTIDO VECINAL DE PROFESOR SALVADOR MAZZA" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "PRIMERO EMBARCACION" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "PROPUESTA SALTENA" & SALTA$Year == 2011] <-4
SALTA$ListaF[ SALTA$Lista == "SALTA SOMOS TODOS" & SALTA$Year == 2011] <-4
SALTA$ListaF[ SALTA$Lista == "UNIDOS POR EL CAMBIO - EL CARRIL (UPC - EL CARRIL)" & SALTA$Year == 2011] <-4
SALTA$ListaF[ SALTA$Lista == "UNIDOS POR PICHANAL" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "UNION CIVICA RADICAL" & SALTA$Year == 2011] <-7
SALTA$ListaF[ SALTA$Lista == "UNION VICTORIA POPULAR" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "UNION Y PARTICIPACION VECINAL" & SALTA$Year == 2011] <-3
SALTA$ListaF[ SALTA$Lista == "WAYAR GOBERNADOR" & SALTA$Year == 2011] <-1


####ESTA LISTA NO ESTA ADHERIDA A UNA DE GOBER 
#SOLO CANDIDATOS PARA ELECCIONES LOCALES. BORRAR
# SALTA$ListaF[ SALTA$Lista == "UNIDOS POR EL CAMBIO - CHICOANA (UPC - CHICOANA)"] <-34

#Eliminar Variables que no voy a usar de DFrame /// BORRAR COLUMNAS ///
SALTA$Lista = NULL
SALTA$Municipio = NULL
SALTA$Cargo = NULL

colnames(SALTA) <- c("Mesa","VE", "Year", "Circuito", "DIPUTADO", "GOBERNADOR", "SENADOR", "Municipio", "Lista")


#GRABAR BASE DE DATOS TOTAL 2007 y 2011 RECODED
library(foreign)
write.csv (SALTA, "~/Dropbox/TESIS/SaltaWideRecoded.csv")


#CONTINUAR CON SCRIPT SIGUIENTE
#
#
#
#
#
#
#
#
#
#
#
#
#
# 
#SCRIPT PARA VARIABLE GOBERNADOR (votos)

GOBERNADOR <- SALTA

#COLLAPSE VOTOS
#eliminar variables "Mesa" "SENADOR" y "DIPUTADO"

#Elimino variable innecesarias para poder hacer collapse en paso siguiente
GOBERNADOR$Mesa=NULL
GOBERNADOR$DIPUTADO=NULL
GOBERNADOR$SENADOR=NULL

#Collapse de votos (pasar de nivel mesa a circuito)
library("plyr",lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")
GOBERNADOR <- ddply(GOBERNADOR, c("VE","Year","Circuito","Municipio","Lista"), summarize, GOBERNADOR = sum (GOBERNADOR))


#RECODE VARIABLE YEAR
GOBERNADOR$Year[GOBERNADOR$Year == 2007] <- 0
GOBERNADOR$Year[GOBERNADOR$Year == 2011] <- 1


#BORRAR OBSERVACIONES DE DEPARTAMENTOS QUE SOLO VOTARON LEGISLATIVAS
GOBERNADOR <- GOBERNADOR[!(GOBERNADOR$Municipio == 6),] #CAFAYATE
GOBERNADOR <- GOBERNADOR[!(GOBERNADOR$Municipio == 10),] #CHICOANA
GOBERNADOR <- GOBERNADOR[!(GOBERNADOR$Municipio == 39),]  #PAYOGASTA
GOBERNADOR <- GOBERNADOR[!(GOBERNADOR$Municipio == 14),]  #EL CARRIL
GOBERNADOR <- GOBERNADOR[!(GOBERNADOR$Municipio == 5),]  #CACHI


###HACER SUBSETS DE MUNICIPIOS SEGUN QUE CARGOS LEGISLATIVOS ELIGEN####
###
###
###
###
###
###
######SENADOR######

SENADOR <- SALTA

#SUBSET DISTRITOS QUE EN LEGISLATIVAS SOLO VOTARON SENADOR
subsetSENADOR <- SENADOR [SENADOR$Municipio %in% c(4,18,24,35,29,27,28,51,15,42,11,26,40,48,58,43,44,53,17,45),] 

#Elimino variable innecesarias para poder hacer collapse en paso siguiente
subsetSENADOR$Mesa=NULL
subsetSENADOR$DIPUTADO=NULL


#Collapse de votos (pasar de nivel mesa a circuito)
library("plyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")
subsetSENADOR <- ddply(subsetSENADOR, c("VE", "Year", "Circuito", "Municipio", "Lista"), summarize, SENADOR = sum (SENADOR))


#RECODE VARIABLE YEAR
subsetSENADOR$Year[subsetSENADOR$Year == 2007] <- 0
subsetSENADOR$Year[subsetSENADOR$Year == 2011] <- 1

colnames(subsetSENADOR) <- c("VE", "Year", "Circuito", "Municipio", "Lista","LEGISLADOR")
###
###
###
###
###
###
######DIPUTADOS######

DIPUTADO <- SALTA

#SUBSET DISTRITOS QUE EN LEGISLATIVAS SOLO VOTARON DIPUTADOS
subsetDIPUTADO <- DIPUTADO [DIPUTADO$Municipio %in% c(49,52,8,30,59,33,37,55,46,7,2,3,50,25,47,57,13,22),]

#Elimino variable innecesarias para poder hacer collapse en paso siguiente
subsetDIPUTADO$Mesa=NULL
subsetDIPUTADO$SENADOR=NULL
subsetDIPUTADO$GOBERNADOR=NULL

#Collapse de votos (pasar de nivel mesa a circuito)
library("plyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")
subsetDIPUTADO <- ddply(subsetDIPUTADO, c("VE", "Year", "Circuito", "Municipio", "Lista"), summarize, DIPUTADO = sum (DIPUTADO))


#RECODE VARIABLE YEAR
subsetDIPUTADO$Year[subsetDIPUTADO$Year == 2007] <- 0
subsetDIPUTADO$Year[subsetDIPUTADO$Year == 2011] <- 1

colnames(subsetDIPUTADO) <- c("VE", "Year", "Circuito", "Municipio", "Lista","LEGISLADOR")


######DIPUTADO Y SENADOR######
LEGISLADOR <- SALTA

subset.LEGISLADOR<- LEGISLADOR [LEGISLADOR$Municipio %in% c(9,32,16,19,31,34,12,1,20,21,23,41,56,36,38,54),]

LegisDIP <- subset.LEGISLADOR
LegisSEN <- subset.LEGISLADOR


#Elimino variable innecesarias para poder hacer collapse en paso siguiente (PASO 1. CATEGORIA DIPUTADO)
LegisDIP$Mesa=NULL
LegisDIP$GOBERNADOR=NULL
LegisDIP$SENADOR=NULL

#Collapse de votos (pasar de nivel mesa a circuito)
library("plyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")
LegisDIPsum <- ddply(LegisDIP, c("VE", "Year", "Circuito", "Municipio", "Lista"), summarize, DIPUTADO = sum (DIPUTADO))



#Elimino variable innecesarias para poder hacer collapse en paso siguiente (PASO 2. CATEGORIA SENADOR)
LegisSEN$Mesa=NULL
LegisSEN$GOBERNADOR=NULL
LegisSEN$DIPUTADO=NULL

#Collapse de votos (pasar de nivel mesa a circuito)
library("plyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")
LegisSENsum <- ddply(LegisSEN, c("VE", "Year", "Circuito", "Municipio", "Lista"), summarize, SENADOR = sum (SENADOR))


##JUNTAR LAS DOS CATEGORIAS EN UN PROMEDIO 
##(Agregar SENADORES A BASE DE DIPUTADOS LegisDIPsum)
LegisDIPSEN <- cbind(LegisDIPsum, LegisSENsum$SENADOR)
colnames(LegisDIPSEN) <- c("VE", "Year", "Circuito", "Municipio", "Lista","LEGISLADOR", "SENADOR")

PROMEDIOLegis <- (LegisDIPSEN$LEGISLADOR+LegisDIPSEN$SENADOR)/2
LegisDIPSEN <- cbind(LegisDIPSEN, PROMEDIOLegis)

#ELIMINAR VARIABLES DE MAS
LegisDIPSEN$LEGISLADOR=NULL
LegisDIPSEN$SENADOR=NULL

#RENOMBRAR COLUMNAS CON VARIABLE "LEGISLADOR"
colnames(LegisDIPSEN) <- c("VE", "Year", "Circuito", "Municipio", "Lista","LEGISLADOR")

#RECODE VARIABLE YEAR
LegisDIPSEN$Year[LegisDIPsum$Year == 2007] <- 0
LegisDIPSEN$Year[LegisDIPsum$Year == 2011] <- 1

LEGISStandard <- rbind(subsetDIPUTADO, subsetSENADOR, LegisDIPSEN)

##CREAR UNA VARIABLE id para identificar observaciones

GOBERNADOR <- GOBERNADOR[order(GOBERNADOR$Municipio),]
LEGISStandard <- LEGISStandard[order(LEGISStandard$Municipio),]

GOBERNADOR <- GOBERNADOR[c(1:5700),]
LEGISStandard <- LEGISStandard[c(1:5700),]


#ARMAR dBase con dos categorias unicamente
#ya standarizadas las disitntas legisaltivas de cada seccion en una
#sola variable

SaltaGobLegis <- cbind(GOBERNADOR, LEGISStandard$LEGISLADOR)
colnames(SaltaGobLegis) <- c("VE", "Year", "Circuito", "Municipio", "Lista","GOBERNADOR", "LEGISLADOR")


###CALCULAR TOTALES####

###
###
###

###GOBERNADOR
###
###
###
###

####Collapse de votos (pasar de nivel mesa a circuito)
TotalGobCircuito <- SaltaGobLegis

TotalGobCircuito$LEGISLADOR=NULL
TotalGobCircuito$VD=NULL
TotalGobCircuito$Lista=NULL
library("plyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")
TotalGobCircuito <- ddply(TotalGobCircuito, c("VE", "Year", "Circuito", "Municipio"), summarize, GOBERNADOR = sum (GOBERNADOR))

#ESCRIBIR ARCHIVOS NUEVOS CON TOTALES PARA INPUT POSTERIOR
#EXPORTAR CSV 
library(foreign)
setwd("~/Dropbox/")
write.csv (TotalGobCircuito, "~/Dropbox/Tesis/TotalGobCircuito.csv")

###
###
###

###LEGISLADOR
###
###
###
###

TotalLEG <- SaltaGobLegis

TotalLEG$GOBERNADOR=NULL
TotalLEG$VD=NULL
TotalLEG$Lista=NULL

#Collapse de votos (pasar de nivel mesa a circuito)
library("plyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")
TotalLEG <- ddply(TotalLEG, c("VE", "Year", "Circuito", "Municipio"), summarize, LEGISLADOR = sum (LEGISLADOR))

##EXPORTAR CSV TOTAL LEG

library(foreign)
setwd("~/Dropbox/")
write.csv (TotalLEG, "~/Dropbox/Tesis/TotalLegCircuito.csv")


###
###
###

#### EXPORTAR dBase transformada WIDE y RECODED
library(foreign)
setwd("~/Dropbox/Tesis")
write.csv (SaltaGobLegis, "~/Dropbox/TESIS/SaltaWideRecoded.csv")

#DATA FRAME PRINCIPAL  "SaltaGobLegis"  <- package "gdata", funcion Keep
#Sin la condicion "sure" va a imprimir cuales son las variables que se eliminan 
#al poner la condicion con el TRUE
library("gdata")
keep(SaltaGobLegis, sure = TRUE)




############# STOP PARA ARMAR VD E IMPUTAR TOTAL DESDE SCRIPT analysis.R ########


file.edit("https://github.com/TuQmano/evoteSALTA_UTDT/blob/master/analysis.R")


