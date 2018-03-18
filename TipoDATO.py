class newData:
    def __init__(self, param="", arrayTime=[]):
        self.param = param;
        self.arrayTime = arrayTime;

class Data:
    def __init__(self, date="", key="", arrayParam=[]):
        self.date = date
        self.key = key
        self.arrayParam = arrayParam #este arreglo es un arreglo de newData ( tiempos )