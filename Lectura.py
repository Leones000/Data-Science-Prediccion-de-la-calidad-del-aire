import csv
import pickle
import os
from TipoDATO import *



DATA = []

cont=0
cont2=0

path = '/Users/francoarielramirezvilla/PycharmProjects/PrediccionCalidadAire/Data';
files = []
names = []
for (path, dirs, files) in os.walk(path):
    #print(str(files[cont2]).split('.')[1])
    names.append(files[cont2])
    cont2 += 1
    names=files

for k in names:
    print(k)
    if str(k).split('.')[1] == "csv":
        cont=0
        with open(str(path+'/'+k),newline='') as csvfile:

            s=csv.reader(csvfile,delimiter=' ',)
            for row in s:
                data = Data()
                newdata = newData()

                existe = -1
                cont += 1
                x = ','.join(row)
                cadena = str(x).split(',')
                if cont!=1:
                    data.date = cadena[0]
                    data.key = cadena[1]
                    arr = []
                    arr2 = []
                    for i in range(3, len(cadena)):
                        arr.append(float(cadena[i]))

                    newdata.param = cadena[2]
                    newdata.arrayTime = arr
                    arr2.append(newdata)
                    data.arrayParam = arr2

                    for i in range(0, len(DATA)):
                        if ((str(DATA[i].date) == str(data.date)) and (str(data.key) == str(DATA[i].key))):
                            existe = i
                            break
                    if existe != -1:
                        DATA[existe].arrayParam.append(data.arrayParam)
                    else:
                        DATA.append(data)

for i in DATA:
    print(i.date)

print("AQUI EMPIEZA LO BUENO")
print(DATA[0].date)
print(DATA[0].key)
print(DATA[0].arrayParam[0].param)
print(DATA[0].arrayParam[0].arrayTime[1])

file_x = open(r'ObjetoDATA.txt','wb')
file_x.truncate()
file_x = open(r'ObjetoDATA.txt','wb')
pickle.dump(DATA,file_x)
file_x.close()

