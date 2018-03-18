import csv
from Data import *;

class newData:
    def __init__(self, param="", arrayTime=[]):
        self.param = param;
        self.arrayTime = arrayTime;

class Data:
    def __init__(self, date="", key="", arrayParam=[]):
        self.date = date
        self.key = key
        self.arrayParam = arrayParam #este arreglo es un arreglo de newData ( tiempos )

DATA = []

data=Data()
newdata=newData()

with open('1996.csv',newline='') as csvfile:
    s=csv.reader(csvfile,delimiter=' ',)
    for row in s:
        existe = -1

        x=','.join(row)
        #print(x)
        cadena = str(x).split(',')

        data.date=cadena[0]
        data.key=cadena[1]
        arr = []
        arr2 = []
        for i in range(3,len(cadena)):
            arr.append(cadena[i])
        newdata.param=cadena[2]
        newdata.arrayTime=arr
        arr2.append(newdata)
        data.arrayParam=arr2

        for i in range(0, len(DATA)):
            print(DATA[i].date ,data.date)
            print(data.key , DATA[i].key)
            if DATA[i].date == data.date and data.key == DATA[i].key:
                #print("entre",i)
                existe=i
                break

        if existe != -1:
            DATA[existe].arrayParam.append(data.arrayParam)
        else: DATA.append(data)

for i in DATA:
    print(i.date)

print(DATA[0].date)
print(DATA[0].key)
print(DATA[0].arrayParam[0].param)
print(DATA[0].arrayParam[0].arrayTime[1])