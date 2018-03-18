# Prediccion de la Calidad del Aire

#### Este trabajo fue desarrollado como proyecto participante durante el desarrollo del hackaton codeGDL 2018

## Equipo:
Franco Ariel Ramirez Villa

Aida Crystal Rodriguez Soto

Alfonso Gomez Martinez

Diego Ramirez

## Introduccion


## LIMPIEZA DE LOS DATOS

Para realizar el analisis de datos, decidimos agrupar los datos tomando como parametro la particula, así que tomamos una particula y la analizamos a cierta hora del dia durante todo el año en una zona determinada.
Nos pareció una forma practica de modelar los datos, ya que así podemos obtener datos relevantes como:
-Que zona es la mas contaminada.
-En que momento del día hay mas ppm de cierto tipo de particula.

Una vez que organizamos de esa manera los datos, tuvimos que asumir que habia datos que no eran exactos ya que se veian muy fuera del 'promedio' de los demas y simplemente los tomamos como anomalias. Esas anomalias, decicimos retirarlas para que no afecten a las predicciones.

Para eliminarlas utilizamos el metodo MAD: Median Absolute Deviation, que obtiene la desviación absoluta con respecto a la media. Y podemos asumir que los valores que sean mayores a la media mas la MAD, se consideran atipicos. Y los valores menores a la media menos el MAD tambien son atipicos.

##  PROMEDIOS POR HORAS (SO2,CO,NO2,NOX)

``` R
library(readr)
CSV <- read_csv("/Users/francoarielramirezvilla/Desktop/R/alldata.csv")
aux <- subset(CSV, (PARAMETRO=="CO" | PARAMETRO=="SO2"|PARAMETRO=="NO2"|PARAMETRO=="NOX") & HORA01!="NA", select = c("HORA01"))
v<-c(aux)
arithmetic.mean <- function(x) {sum(x)/length(x)}
print(arithmetic.mean(v[[1]]))
```


Hora1=0.2616018
Hora2=0.2470172
Hora3=0.2474075
Hora4=0.2226969
Hora5=0.2266908
Hora6=0.2702171
Hora7=0.3691449
Hora8=0.6164668
Hora9=0.675253
Hora10=
Hora11=
Hora12=
Hora13=0.2849705
Hora14=0.2575102
Hora15=0.258061
Hora16=
Hora17=
Hora18=
Hora19=
Hora20=0.3932199
Hora21=0.4444491
Hora22=0.4394486
Hora23=
Hora24=
