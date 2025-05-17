user_Thor = {'mysql', 'CPU', 'RAM', 'SSD1', 'Google'}
user_Thanos = {'LoL', 'RAM', 'CPU',  'HD', 'Google'}
user_CA = {'mysql', 'LoL', 'RAM', 'CPU', 'Firefox'}
user_TS = {'mysql', 'CPU', 'RAM', 'SSD1', 'Google'}


#Exercício1: Utilizando o comando union em Python, faça com que os quatro conjuntos,
#user_Thor, user_Thanos, user_CA, user_TS estejam em uma operação de união. Qual é o
#resultado em python?
inventario1 = user_Thor | user_CA
inventario2 = user_Thor | user_CA | user_Thanos | user_TS
print(inventario2)

#Exercício2: Faça o mesmo para todos os 4 conjuntos, considerando seus elementos em comum.
#Utilize o operados & e depois o comando intersection
inventario3 = user_Thor.intersection(user_Thanos)
inventario4 = user_Thor & user_CA & user_Thanos & user_TS
print(inventario3, inventario4)

#Exercício3: Faça o mesmo para todos os 4 conjuntos, considerando seus elementos na
#diferença. Utilize o operados -.

inventario5 = user_Thor - user_Thanos
inventario6 = user_Thor - user_CA - user_Thanos - user_TS
print(inventario5, inventario6)


#Exercício4: Faça o mesmo para todos os 4 conjuntos, considerando seus elementos na
#pertinência. Utilize o operados in e not in.

print('LoL' in user_Thor)
print('Firefox' in user_CA)
print('CPU' in user_Thanos)

#not in
print('CPU' not in user_Thor)
print('LoL' not in user_TS)
print('mysql' not in user_CA)

print("Issubset: " , user_Thor.issubset(user_CA))
print("<= : " , user_Thor <= user_CA)
print(">= : ", user_Thanos >= user_Thor)

#Exercicio 5

energia_1 = {'agua', 'luz', 'internet', 'computador', 'ar'}
energia_2 = {'telefone', 'luz', 'agua', 'gás', 'televisão'}
energia_3 = {'rádio', 'luz', 'agua', 'ventilador', 'televisão'}
energia_4 = {'agua', 'luz', 'internet', 'computador', 'ar'}


agrupamento_energia = energia_1 == energia_2
agrupamento_energia2 = energia_1 == energia_4
print('Igualdade1: ', agrupamento_energia)
print('Igualdade2: ', agrupamento_energia2)

diferenca_simetrica1 = energia_1.symmetric_difference(energia_2)
diferenca_simetrica2 = energia_1.symmetric_difference(energia_4)
print('Diferença Simétrica1: ', diferenca_simetrica1)
print('Diferença Simétrica2: ', diferenca_simetrica2)








