import csv
with open ('1996.csv', newline='') as csvfile:
    s=csv.reader(csvfile,delimiter='',)
    for row in s:
        print(','.join(row))