peso = float(input('Quanto você pesa em Kg? '))
altura = float(input('Quanto você mede em altura? (m) '))
imc = peso/(altura ** 2)

print('O seu IMC é de {:.1f} '.format(imc))