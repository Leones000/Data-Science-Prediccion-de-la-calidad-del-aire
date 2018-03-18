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
