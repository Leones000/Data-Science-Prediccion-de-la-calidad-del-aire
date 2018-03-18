# Objetivo
Analizar e interpretar la información brindada para desarrollar un modelo predictivo, detectar problemas (existentes o por venir) y poder ofrecer una solución viable. 
# Introducción
No es una noticia nueva que la contaminación existe, que está en aumento y que se le debe dar una solución a la brevedad. Diferentes gases están presentes todos los días en el aire que respiramos, tales como monóxido y dioxido de carbono, monóxido de nitrógeno, dioxido de azufre, metano, entre otros.
No obstante, el efecto que causa en las personas el escuchar "el SO2 del aire aumentó en x% este año" no es más que uno de aceptación y resignación; nos acostumbramos a que la tendencia sea de mal en peor y ésto nos nubla a no darnos cuenta de que sí, la cosa va mal y si no hacemos algo pronto, no lo podremos hacer después.
Cuando nos dimos cuenta de la interpretación a las palabras de alerta, decidimos implementar otra metodología. ¿Y si la gente pudiera ver el aumento del que todos hablan, pero de forma gráfica? Lograr que lo dramático de la inclinación de la pendiente que anuncia el aumento a través de los años de alguno de los gases nocivos de una mejor explicación de lo mal que pinta la situación. 
Una buena visualización de los datos cuenta siempre la mejor de las historias.
Con este lema en mente creamos el presente documento.
# Lectura de datos
Con ayuda del software R importamos los archivos que se nos facilitaron. Para ésta acción, decidimos cambiar el tipo de archivo a csv (dividido por comas), ya que el software se mostraba amigable con éste tipo de formato que se le enviaba. Además, creamos un nuevo archivo que agrupó toda la información en conjunto. De esta forma, pudimos tener todos los datos con los que contabamos en una sola variable.
# Limpieza de los datos
Nos encontramos con cuatro casos a considerar, los cuáles denominamos: ceros, negativos, NA y atípicos. Detallaremos uno a uno. 
## Ceros 
La decisión para éste caso fue complicada, ya que debíamos definir lo que significaba cuando un sensor mandaba un cero, y así determinar si era o no buena idea el considerarlos en nuestro modelo.
Al observar que en algunos días (por ejemplo) la medición de algunos sensores era 0 durante todo el día, salvo a llegar a la hora 19 y en delante, sin motivo aparente de que sucediera así. Éste tipo de comportamiento nos dio pie a optar por no contemplar ete tipo de datos, pensando en que estos ceros fueron producto de mediciones erróneas o un fallo en sensor.
## Negativos
La información que se espera recibir de los sensores es la cantidad de partículas por millón de determinado gas en el ambiente. Entonces ¿será lógico pensar que existan en el ambiente una cantidad negativa de partículas de cualquier gas? En definitiva no. En base a éste argumento, dejamos de lado todo dato que tuviese una cantidad negativa.
## NA
Nos encontramos con muchas casillas de datos que simplemente no se rellenaron con nada; el sensor no arrojó un dato para esa hora del día. Uno de los motivos que se nos ocurre para que ésto haya sucedido, es que los sensores hayan entrado en una etapa de mantenimiento o simplemente hayan dejado de funcionar.
De cualquier modo, son datos que hemos decidido no considerar para no afectar el resultado de nuestro modelo.
## Atípicos
Consideramos un dato atípico cuando su resultado luce disparado (ya sea de forma positiva o negativa) con respecto a los demás datos de su misma naturaleza.
El criterio que utilizamos para esta depuración fue calcular la derivada media absoluta y la mediana de cada grupo de datos obtenidos de cada hora, para cada zona y cada parámetro. Donde nuestro margen de aceptación será toda x que cumpla (M-MAD)<x<(M+MAD) donde M es la mediana y MAD la derivada media absoluta.
Optamos por el criterio anterior por su buena implementación en estadística robusta y nos permite excluir la mayor cantidad de valores atípicos.
# Modelo de predicción
Después de analzar las gráficas pudimos notar un comportamiento con tendencia lineal; ésto dio pauta a decidir utlizar el método de regresión lineal para poder otorgar una predicción aceptada a lo que pudiese ocurrir con el paso del tiempo.

