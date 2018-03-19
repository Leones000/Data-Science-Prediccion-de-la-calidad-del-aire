library(readr)
CSV <- read_csv("/Users/francoarielramirezvilla/Desktop/R/alldata.csv")

aux <-   subset(CSV, (PARAMETRO=="CO") & HORA01!="NA", select = c("HORA02"))
aux1 <- subset(CSV, (PARAMETRO=="SO2") & HORA01!="NA", select = c("HORA02"))
aux2 <- subset(CSV, (PARAMETRO=="NO2") & HORA01!="NA", select = c("HORA02"))
aux3 <- subset(CSV, (PARAMETRO=="NOX") & HORA01!="NA", select = c("HORA02"))
print(aux)
print(aux1)
print(aux2)
print(aux3)
#Limpieza de datos
#AUX

limpiar <- function(aux){
    v1 <- c(aux[1])
    var<-c()
    #print(v1)
    print(length(v1[[1]]))
    for (i in 1:length(v1[[1]])) {
        if(v1[[1]][i]>0){
            var<-append(var,v1[[1]][i])
        }
    }
    var<-sort(var)
    #print(var)
    mediana <- median(unlist(var))
    m <- mad(unlist(var))
    l_i <- mediana - m
    l_f <- mediana + m
    #print(mediana)
    #print(m)
    res <- c()
    #print(length(v[[1]]))
    #print(length(var))
    
    for (i in 1:length(var)) {
        if(var[i]>=l_i & var[i]<=l_f){
            res<-append(res,var[i])
        }
    }
    #print(res)
    return(res)
}
res<-limpiar(aux)
res1<-limpiar(aux1)
res2<-limpiar(aux2)
res3<-limpiar(aux3)
#print(res3)
arithmetic.mean <- function(a,b,c,d) {(sum(a)+sum(b)+sum(c)+sum(d))/(length(a)+length(b)+length(c)+length(d))}
print("HOLAAAAA")
print(length(res))
print(length(res1))
print(length(res2))
print(length(res3))
print(arithmetic.mean(res,res1,res2,res3))







# AQUI SE OBTIENEN 24 PROMEDIOS, UNO PARA CADA HORA, DONDE PARTICIPAN LOS 4 COMPONENTES MAS INFLOYENTES EN LA CONTAMINACION DEL AIRE
library(readr)
CSV <- read_csv("/Users/francoarielramirezvilla/Desktop/R/alldata.csv")
aux <- subset(CSV, (PARAMETRO=="CO" | PARAMETRO=="SO2"|PARAMETRO=="NO2"|PARAMETRO=="NOX") & HORA01!="NA", select = c("HORA01"))
v<-c(aux)
arithmetic.mean <- function(a,b,c,d) {(sum(a)+sum(b)+sum(c)+sum(d))/(length(a)+length(b)+length(c)+length(d))}
print(arithmetic.mean(v[[1]]))
