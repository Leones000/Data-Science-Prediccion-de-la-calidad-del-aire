# Prediccion de la Calidad del Aire

#### Este trabajo fue desarrollado como proyecto participante durante el desarrollo del hackaton codeGDL 2018

## Equipo:
Franco Ariel Ramirez Villa

Aida Crystal Rodriguez Soto

Alfonso Gomez Martinez

Diego Gustavo Ramirez Guerrero

## Introduccion
No es una noticia nueva que la contaminación existe, que está en aumento y que se le debe dar una solución a la brevedad. Diferentes gases están presentes todos los días en el aire que respiramos, tales como monóxido y dioxido de carbono, monóxido de nitrógeno, dioxido de azufre, metano, entre otros. No obstante, el efecto que causa en las personas el escuchar "el SO2 del aire aumentó en x% este año" no es más que uno de aceptación y resignación; nos acostumbramos a que la tendencia sea de mal en peor y ésto nos nubla a no darnos cuenta de que sí, la cosa va mal y si no hacemos algo pronto, no lo podremos hacer después. Cuando nos dimos cuenta de la interpretación a las palabras de alerta, decidimos implementar otra metodología. ¿Y si la gente pudiera ver el aumento del que todos hablan, pero de forma gráfica? Lograr que lo dramático de la inclinación de la pendiente que anuncia el aumento a través de los años de alguno de los gases nocivos de una mejor explicación de lo mal que pinta la situación. Una buena visualización de los datos cuenta siempre la mejor de las historias. Con este lema en mente creamos el presente documento.

##Lectura de datos
Con ayuda del software R importamos los archivos que se nos facilitaron. Para ésta acción, decidimos cambiar el tipo de archivo a csv (dividido por comas), ya que el software se mostraba amigable con éste tipo de formato que se le enviaba. Además, creamos un nuevo archivo que agrupó toda la información en conjunto. De esta forma, pudimos tener todos los datos con los que contabamos en una sola variable.

## LIMPIEZA DE LOS DATOS

Para realizar el análisis de datos, decidimos agrupar los datos tomando como parametro la partícula, así que tomamos una particula y la analizamos a cierta hora del día durante todo el año en una zona determinada.
Nos pareció una forma practica de modelar los datos, ya que así podemos obtener datos relevantes como:
-¿Qué zona es la más contaminada?
-¿En qué momento del día hay mas ppm de cierto tipo de partícula?

Una vez que organizamos de esa manera los datos, tuvimos que asumir que habian datos que no eran exactos ya que se veian muy fuera del 'promedio' de los demás y simplemente los tomamos como anomalias. Esas anomalias, decicimos retirarlas para que no afecten a las predicciones.

Para eliminarlas utilizamos el metodo MAD: Median Absolute Deviation, que obtiene la desviación absoluta con respecto a la media. Y podemos asumir que los valores que sean mayores o menores a la media más o menos a la MAD, se consideran atipicos respectivamente. Además excluimos aquellos casos que contenian valores nulos, negativos y con valor a cero.

##  PROMEDIOS POR HORAS (SO2, CO, NO2, NOX)
Con el siguiente código en R se obtuvieron los promedios de cada hora tomando a todos y cada uno de los factores de contaminación, esto para evaluar en que horas se elevan los niveles en promedio con respecto a otros, para asi graficar mas adelante en los niveles mas significativos del muestreo.

``` R
library(readr)
CSV <- read_csv("/Users/francoarielramirezvilla/Desktop/R/alldata.csv")
aux <- subset(CSV, (PARAMETRO=="CO" | PARAMETRO=="SO2"|PARAMETRO=="NO2"|PARAMETRO=="NOX") & HORA01!="NA", select = c("HORA01"))
v<-c(aux)
arithmetic.mean <- function(x) {sum(x)/length(x)}
print(arithmetic.mean(v[[1]]))
```

Hora1=0.2616018 | Hora2=0.2470172 | Hora3=0.2474075 | Hora4=0.2226969 | Hora5=0.2266908 | Hora6=0.2702171
--- | --- | --- | --- | --- | ---
Hora7=0.3691449 | Hora8=0.6164668 | Hora9=0.675253 | Hora10=x | Hora11=x | Hora12=x 
Hora13=0.2849705 | Hora14=0.2575102 | Hora15=0.258061 | Hora16=x | Hora17=x | Hora18=x
Hora19=x | Hora20=0.3932199 | Hora21=0.4444491 | Hora22=0.4394486 | Hora23=x | Hora24=x


##ÁNALISIS DE DATOS
Unz vez obtenidos los promedio anteriores, determinamos que entre las 24 horas del día donde se registraron datos, habían 3 horas que tenían mayor saturación de componentes químicos contaminantes, dichas horas fueron las 9 am, 3 pm y 9 pm. En base a éstas 3 horas más significativas, graficamos la cantidad de partículas contaminantes en promedio por cada año, y generamos 4 graficas en base a un componente químico específico; para esto, determinamos los componenetes químicos con mayor influencia en la calidad del aire en base a una búsqueda de información, por lo que nuestros compuestos químicos son el CO, No2, So2 y el NoX.
Utilizamos el siguiente código en R para generar nuestras gráficas:

```R
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
```
##GRAFICAS
Gráfica del componente CO en la hora 9, desde 1996 hasta 2011:
![co9](https://user-images.githubusercontent.com/26826159/37568149-dc2e3858-2a96-11e8-9298-38c4419c7a4e.jpg)

Gráfica del componente CO en la hora 15, desde 1996 hasta 2011:
![co15](https://user-images.githubusercontent.com/26826159/37568178-4633a134-2a97-11e8-81ef-76661cfe1236.jpg)

Gráfica del componente CO en la hora 21, desde 1996 hasta 2011:
![co21](https://user-images.githubusercontent.com/26826159/37568181-563836e4-2a97-11e8-84d9-26b3179705b5.jpg)

Gráfica del componente NO2 en la hora 9, desde 1996 hasta 2011:
![no29](https://user-images.githubusercontent.com/26826159/37568202-7aee5202-2a97-11e8-8660-4d10c949a080.jpg)

Gráfica del componente NO2 en la hora 15, desde 1996 hasta 2011:
![no215](https://user-images.githubusercontent.com/26826159/37568212-8f6d1cf4-2a97-11e8-93e4-283ba019f7b1.jpg)

Gráfica del componente NO2 en la hora 21, desde 1996 hasta 2011:
![no221](https://user-images.githubusercontent.com/26826159/37568217-a4b7307c-2a97-11e8-9643-6b39930aabe5.jpg)

Gráfica del componente NOX en la hora 9, desde 1996 hasta 2011:
![nox9](https://user-images.githubusercontent.com/26826159/37568221-c2c1df18-2a97-11e8-9cae-9d4c4d32e8a0.jpg)

Gráfica del componente NOx en la hora 15, desde 1996 hasta 2011:
![nox15](https://user-images.githubusercontent.com/26826159/37568227-d9293972-2a97-11e8-93b9-4f38591da740.jpg)

Gráfica del componente NOx en la hora 21, desde 1996 hasta 2011:
![nox21](https://user-images.githubusercontent.com/26826159/37568232-eb3e76ea-2a97-11e8-9042-b82c42f4542f.jpg)

Gráfica del componente SO2 en la hora 9, desde 1996 hasta 2011:
![so29](https://user-images.githubusercontent.com/26826159/37568241-14af3c6c-2a98-11e8-87d9-155a1bcb93c3.jpg)

Gráfica del componente SO2 en la hora 15, desde 1996 hasta 2011:
![so215](https://user-images.githubusercontent.com/26826159/37568249-26be1dba-2a98-11e8-86ba-8077d0f7b1c7.jpg)

Gráfica del componente SO2 en la hora 21, desde 1996 hasta 2011:
![so21](https://user-images.githubusercontent.com/26826159/37568261-43bea81c-2a98-11e8-9e50-42271d7359b9.jpg)

#Modelo predictivo lineal

´´´R
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
´´´
![acf45d20-c023-4877-ac2b-d62f118c52e7](https://user-images.githubusercontent.com/37254626/37568384-0eedfc58-2a9a-11e8-91f0-d376ff87a41f.jpg)


##CONCLUSIONES
Este proyecto sucitó muchos retos, desde el aprendizaje de un nuevo lenguaje, el tratamiento de datos útiles y los parámetros que a éstos determinan, etc.
Pudimoa notar que las ppm de los gases en el ambiente dependen de una gran cantidad de variables. El conflicto inicia cuando se debe decidir qué variables sí y cuáles no considerar., entrando en un duelo entre precisión y complejidad, ya que más variables (que sí tengan impacto en el modelo) pueden dar mejor detalle de la tendencia en el tiempo del sistema.
Ser capaces de mostrar la data de forma optimizada y visualmente útil es ya una herramienta adquirida para próximas investigaciones y reportes.
