peso = float(input('Qual o seu peso em KG ? '))
altura = float(input('Qual a sua altura em metros ? '))
imc = peso / (altura **2)

print('O seu imc é de {:.1f}'.format(imc))
if imc < 18.5:
    print('Diagnóstico: Abaixo do peso normal')
elif imc >= 18.5 and imc < 25:
    print('Diagnóstico: Peso normal')
elif imc >= 25 and imc < 30:
    print('Diagnóstico: Sobrepeso')
elif imc >= 30 and imc < 40:
    print('Diagnóstico: Obeso')
elif imc >= 40:
    print('Diagnóstico: Obesidade mórbida') 
