from TipoDATO import *
import pickle

file_x = open(r'ObjetoDATA.txt','rb')
DATA = pickle.load(file_x)
file_x.close()

for i in DATA:
    print(i.date)

