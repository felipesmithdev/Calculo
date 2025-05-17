validar = True
while validar:
    perguntar = int(input("Deseja calcular o imc ? \n(digite 1 para sim ou 2 para não)\n"))
    if perguntar == 1:
        peso = float(input('Quanto você pesa em Kg? '))
        altura = float(input('Quanto você mede em altura? (m) '))
        imc = peso/(altura ** 2)
        print('O seu IMC é de {:.2f} '.format(imc))
    else:
        validar = False
        print("Até mais companheiro, volte sempre!")
