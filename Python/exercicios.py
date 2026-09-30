'''
#decimal to bin
decimal = int(input("type int num:\n"))

def DecToBin(num):
    bin = ""
    if num == 0:
        return 0
    else:
        while num > 0:
            rest_div = num % 2
            bin = str(rest_div) + bin
            num = num // 2
        return bin

print(DecToBin(decimal))

#change number
n = 12
m = 32

print(f"{n}, {m}")
def Changenum(a, b):
    c = a
    a = b
    b = c
    return a, b

print(Changenum(n, m))

#vogais
palavra = str(input("type the word: "))
vowels = "aeiou"
count = 0

for i in palavra:
    if i in vowels:
        count += 1
        print(count)
print(f"there are {count} vowels")
'''
'''
dias = 0
horario = int(input("type seconds: "))

horas = horario // 3600
minutos = (horario - (horas * 3600)) // 60
segundos = ((horario - (horas * 3600)) - minutos * 60)

if horas > 24:
    dias = horas // 24
    horas = horas - 24

print(f"{dias}:{horas}:{minutos}:{segundos}")

#Verify palindromo
array = [4,5,1,2,3,8,9,8,3,2,1,5,4]
rever_array = []
palindromo = True

for i in range(len(array)):
    rever_array.append(array[len(array) -1 - i])

if len(array) % 2 == 0:
    for i in range(len(array)//2):
        if array[i] == rever_array[i]:
            print("sim")
        else:
            print("não")
            palindromo = False

print(f"palindromo = {palindromo}")
'''
#separate vector
vec = [2,3,4,6,7,8,9,0]
vec_par = []
vec_impar = []

for i in range(len(vec)):
    print(i) #índice -> len(vec)
    print(vec[i]) #valor -> vec[i]
    if i % 2 == 0:
        vec_par.append(vec[i])
    else:
        vec_impar.append(vec[i])

print(vec)
print(vec_impar)
print(vec_par)
'''
media = []

val = int(input("type how many numbers? "))
for i in range(val):
    media.append(input("type the number "))

print(media)
'''