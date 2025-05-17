? break

nomes <- c('tom', 'bob', 'mel', 'ana', 'ian')

for (nome in nomes) {
  if(nome == 'mel'){
    print("Achei a mel")
  }
  print(nome)
}


for (nome in nomes) {
  if(nome == "mel"){
    break
  }
  print(nome)
}

for (nome in nomes) {
  if(nome == "mel"){
    next
  }
  print(nome)
}

contador <- 0
repeat{
  print(nomes)
  if(contador == 6){
    break
  }
  contador <- contador + 1
}

contador2 <- 0
while (contador2 <= 6) {
  print('oi r')
  contador2 <- contador2 + 1
}

matriz01 <- matrix(nrow = 30, ncol = 30)
matriz01

1:dim(matriz01)[1]
1:dim(matriz01)[2]

for (linha in 1:dim(matriz01)[1]) {
  for (coluna in 1:dim(matriz01)[2]) {
   matriz01[linha, coluna] = linha * coluna
  }
}

matriz01

matriz01[1:5, 1:5]

plot(matriz01)
barplot(matriz01)


barplot(matriz01, horiz = TRUE, main = 'nome da matriz empilhada')

soma <- sum(matriz01[30,])
soma
menor <- sum(matriz01[10,])
menor