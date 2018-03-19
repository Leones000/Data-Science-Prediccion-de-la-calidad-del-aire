
# GRAFICADO DE TODOS LOS COMPONENTES DURANTE UN AÑO EN UNA HORA ESPECIFICA
library(readr)
CSV <- read_csv("/Users/francoarielramirezvilla/Desktop/R/alldata.csv")

aux <-   subset(CSV,  (PARAMETRO=="NOX" & CLAVE_EST == "AGU") & HORA01!="NA", select = c("HORA21"))
aux1 <-   subset(CSV, (PARAMETRO=="NOX" & CLAVE_EST == "ATM") & HORA01!="NA", select = c("HORA21"))
aux2 <-   subset(CSV, (PARAMETRO=="NOX" & CLAVE_EST == "CEN") & HORA01!="NA", select = c("HORA21"))
aux3 <-   subset(CSV, (PARAMETRO=="NOX" & CLAVE_EST == "LDO") & HORA01!="NA", select = c("HORA21"))
aux4 <-   subset(CSV, (PARAMETRO=="NOX" & CLAVE_EST == "MIR") & HORA01!="NA", select = c("HORA21"))
aux5 <-   subset(CSV, (PARAMETRO=="NOX" & CLAVE_EST == "OBL") & HORA01!="NA", select = c("HORA21"))
aux6 <-   subset(CSV, (PARAMETRO=="NOX" & CLAVE_EST == "TLA") & HORA01!="NA", select = c("HORA21"))
aux7 <-   subset(CSV, (PARAMETRO=="NOX" & CLAVE_EST == "VAL") & HORA01!="NA", select = c("HORA21"))

#Limpieza de datos

limpiar <- function(aux){
    v1 <- aux[1]
    var<-c()
    #print(v1)
    print(length(v1[[1]]))
    for (i in 1:length(v1[[1]])) {
        if(v1[[1]]>0){
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
res4<-limpiar(aux4)
res5<-limpiar(aux5)
res6<-limpiar(aux6)
res7<-limpiar(aux7)

#print(res3)
arithmetic.mean <- function(a,b,c,d) {(sum(a)+sum(b)+sum(c)+sum(d))/(length(a)+length(b)+length(c)+length(d))}
#print(arithmetic.mean(res,res1,res2,res3))

plot(res,type="o", col="blue", axes=FALSE, ann=FALSE)
box()
title(main="PARAMETER: NOX\n21:00", col.main="red", font.main=4)
lines(res1, type="o", col="red")
axis(1, at=1:16, labels=c("1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011"))
axis(2, las=1, at=.5*0:20)
lines(res2, type="o", col="orange")
lines(res3, type="o", col="black")
lines(res4, type="o", col="green")
lines(res5, type="o", col="gray")
lines(res6, type="o", col="brown")
lines(res7, type="o", col="pink")
title(xlab="Year", col.lab=rgb(0,0.5,0))
title(ylab="Sensors", col.lab=rgb(0,0.5,0))
legend(1, 1000, c("AGU","ATM","CEN","LDO","MIR","OBL","TLA","VAL"), cex=0.8, col=c("blue","red","orange","black","green","gray","brown","pink"), pch=21:22, lty=1:2)
