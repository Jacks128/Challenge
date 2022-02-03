from mimetypes import init


print('---Hola jovenes estudiantes---')

def sumarNum(num1,num2):
    return str(num1/num2)+"TISSS"

#Pido datos
#x = int(input('Num1: '))
#y = int(input('Num2: '))

def contarLetra():
    man_archivo = open('TOKEN.txt')
    contador = 0
    for linea in man_archivo:
        contador = contador + 1
        print('Contador de líneas:', contador)

contarLetra()