lista_usrs = ['Bob', 'Tom', 'Ian'] #Mutável, possui ordem, pode ter duplicados
tupla_users = ('Bob', 'Tom', 'Ian') #Imutável, possui ordem, pode ter duplicados
conjunto_users = {'Bob', 'Tom', 'Ian'} #Conjunto é mutável, os elementos não. Não possui ordem e não permite elementos duplicados
dic = {"nome": 'Bob'}

# Vamos focar nos conjuntos

frutas_user_01 = {'Uva','Maçã', 'Morango', 'Uva'}
frutas_user_02 = {'Uva', 'Laranja', 'Mleão'}
frutas_user_03 = {'Maçã', 'Morango', 'Abacaxi', 'Uva'}
frutas_user_04 = set(['Amora', 'Kiwi'])

print("Frutas user 01: ", frutas_user_01)
print("Frutas user 02: ", frutas_user_02)
print("Frutas user 03: ", frutas_user_03)

#União
# uniao_frutas_ser01_02 = frutas_user_01 | frutas_user_02
uniao_frutas_ser01_02 = frutas_user_01.union(frutas_user_02)
print("União frutas user o1 e o2: ", uniao_frutas_ser01_02)

#Interseccao
# interseccao_frutas_user_01_02 = frutas_user_01 & frutas_user_02
interseccao_frutas_user_01_02 = frutas_user_01.intersection(frutas_user_02)
print("Intersecção frutas usuaŕio 01 e 02: ", interseccao_frutas_user_01_02)