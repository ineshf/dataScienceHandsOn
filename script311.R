
########################33
########################
#ANALISIS y ADECUACION##
##########################
#Ver que algunos de los valores no tiene precios https://www.amazon.es/Kranich-Aspiradora-portatil-aspiradoras-Limpiador/dp/B07P1RX14V/ref=sr_1_68_sspa?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&keywords=aspirador&qid=1558608832&s=gateway&sr=8-68-spons&psc=1
#Es porque no estan en venta auqneu si anunciados
#Vamos analizando colunmna por columna yconviertiendo
#OJOOOO falta cambiar de gramos KG!!!
str(aspiradoras$peso)
#Convertimos a char para procesar
aspiradoras$peso<-as.character(aspiradoras$peso)
# [1] "1,44 Kg" "4,8 Kg"
#Remove kg o g
#aspiradoras$peso<-gsub(" g", "", aspiradoras$peso)
aspiradoras$peso<-gsub(" Kg", "", aspiradoras$peso)
aspiradoras$peso<-gsub(",", ".", aspiradoras$peso)
aspiradoras$peso<-as.numeric(aspiradoras$peso)

#Siguiente columan, 
str(aspiradoras$dimensiones)
#Convertimos a char para procesar
aspiradoras$dimensiones<-as.character(aspiradoras$dimensiones)
aspiradoras$dimensiones<-gsub("cm", "", aspiradoras$dimensiones)
aspiradoras$dimensiones<-gsub(",", ".", aspiradoras$dimensiones)
aspiradoras$dimensiones<-gsub(" ", "", aspiradoras$dimensiones)


library(stringr)
dimensiones<-str_split_fixed(aspiradoras$dimensiones, "x", 3)
class(dimensiones)

dimen<-as.data.frame(dimensiones)
colnames(dimen)<-c("alto", "ancho", "profundidad")
dimen[is.na(dimen)] <- 0
dimen[, ] <- lapply(dimen[, ], as.character)
dimen[, ] <- lapply(dimen[, ], as.numeric)
#Lo añadidmos al dataset de trabajo y eliminamos dimensiones
dimen[is.na(dimen)] <- 0

aspiradoras<-cbind(aspiradoras, dimen)
aspiradoras<-aspiradoras[, -3]

View(aspiradoras)

#Siguiente parametro capacidad
str(aspiradoras$capacidad)
#Convertimos a char para procesar
aspiradoras$capacidad<-as.character(aspiradoras$capacidad)
#aspiradoras$capacidad<-gsub("ml", "", aspiradoras$capacidad)
aspiradoras$capacidad<-gsub("litros", "", aspiradoras$capacidad)
aspiradoras$capacidad<-gsub("L", "", aspiradoras$capacidad)
aspiradoras$capacidad<-as.numeric(aspiradoras$capacidad)
aspiradoras$capacidad[is.na(aspiradoras$capacidad)] <- 0


#Siguiente parametro potencia
str(aspiradoras$potencia)
#Convertimos a char para procesar
aspiradoras$potencia<-as.character(aspiradoras$potencia)
aspiradoras$potencia<-gsub("watt_hours", "", aspiradoras$potencia)
aspiradoras$potencia<-gsub("vatios", "", aspiradoras$potencia)
aspiradoras$potencia<-as.numeric(aspiradoras$potencia)


#Siguiente parametro numero de opiniiones
str(aspiradoras$opiniones)
#Convertimos a char para procesar
aspiradoras$opiniones<-as.character(aspiradoras$opiniones)
aspiradoras$opiniones<-gsub("opiniones de clientes", "", aspiradoras$opiniones)
aspiradoras$opiniones<-gsub("opinión de cliente", "", aspiradoras$opiniones)
aspiradoras$opiniones<-gsub(",", "", aspiradoras$opiniones)
aspiradoras$opiniones<-as.numeric(aspiradoras$opiniones)
aspiradoras$opiniones[is.na(aspiradoras$opiniones)] <- 0

#Siguiente parametro numero de precio
str(aspiradoras$precio)
#Convertimos a char para procesar
aspiradoras$precio<-as.character(aspiradoras$precio)
aspiradoras$precio<-gsub("EUR", "", aspiradoras$precio)
aspiradoras$precio<-gsub(",", ".", aspiradoras$precio)

aspiradoras$precio<-as.numeric(aspiradoras$precio)
aspiradoras$precio[is.na(aspiradoras$precio)] <- 0

write.csv(aspiradoras, "/home/ines/platzi/dataLimpia.csv")

colnames(aspiradoras)
data<-aspiradoras[,-1]
colnames(data)
rownames(data)<-c(1:100)
data<-scale(data)

####KMEANS!!
#Caculamos el numero de clusters
wss <- (nrow(data)-1)*sum(apply(data,2,var))
for (i in 2:12) wss[i] <- sum(kmeans(data, 
                                     centers=i)$withinss)
plot(1:12, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")

#Seleccionamos 6 clusters (tentativa 4)

set.seed(20)

mydataCluster <- kmeans(data, 5, nstart =15 , iter.max = 30)
mydataCluster

#Coste de error total!
mydataCluster$tot.withinss

install.packages("fmsb")
library(fmsb)


