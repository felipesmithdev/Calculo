peso = float(input('Qual o seu peso em KG ?'))
altura = float(input('Qual a sua altura em metros ?'))
imc = peso / (altura ** 2)
print('O seu imc é de {:.1f}'.format(imc))
if imc < 18.5:
    print('Diagnóstico: abaixo do peso normal')
elif 18.5 <= imc < 25:
    print('Diagnóstico: peso normal')
elif 25 <= imc <30:
    print('Diagnóstico: sobrepeso')
elif 30 <= imc < 40:
    print('Diagnóstico: obeso')
elif imc >= 40:
    print('Diagnóstico: obesidade mórbida')
    