
def mad(a):
    a.sort()
    if(len(a)%2==1):
        med1=a[int((len(a)/2))]
    else:
        med1=(a[int((len(a)/2))-1]+a[int((len(a)/2))])/2
    print(med1)
    for i in range(len(a)):
        a[i] = abs(a[i]-med1)
    a.sort()
    if (len(a) % 2 == 1):
        med2 = a[int((len(a) / 2))]
    else:
        med2 = (a[int(len(a) / 2) - 1] + a[int((len(a) / 2))]) / 2
    return med2
a = [2,4,14,5,6,7,21,25]
print(mad(a))



#2,4,5,6,7,14,21,25