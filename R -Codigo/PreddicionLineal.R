library(readr)
CSV <- read_csv("/Users/francoarielramirezvilla/Desktop/R/alldata.csv")

aux <-   subset(CSV,  (PARAMETRO=="NOX" & CLAVE_EST == "AGU") & HORA01!="NA", select = c("HORA21"))

limpiar <- function(aux){
  v1 <- aux[1]
  var<-c()
  for (i in 1:length(v1[[1]])) {
    if(v1[[1]]>0){
      var<-append(var,v1[[1]][i])
    }
  }
  var<-sort(var)
  mediana <- median(unlist(var))
  m <- mad(unlist(var))
  l_i <- mediana - m
  l_f <- mediana + m
  res <- c()
  
  for (i in 1:length(var)) {
    if(var[i]>=l_i & var[i]<=l_f){
      res<-append(res,var[i])
    }
  }
  return(res)
}
res<-limpiar(aux)

arithmetic.mean <- function(a) {(sum(a))/(length(a))}

difs <- c()
print(length(aux[[1]]))
for (i in 1:aux[[1]]) {
  append(difs,aux[[1]][i]-aux[[1]][i-1])
  i=i+100
}

promedio<-arithmetic.mean(difs)

vecP <- c(0:12)

for (i in range(1,12)) {
  vecP[i]<-difs[length(difs)-1]+promedio
  append(difs,vecP[i])
}

plot(vecP)

