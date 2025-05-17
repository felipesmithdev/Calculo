a <- 2

somar <- function(a,b = 2){
  print(a + b)
}

somar(2)

# Criando um vetor

Bob = 2
Tom = 3
vetor01 = c(Bob, Tom, 42)
vetor01
print("repete")
vetorRepete <- rep(c('Uva', 'Maça'), 2)
vetorRepete

vetorRepete2 <- rep(c('uva', 'maça'), each=3)
vetorRepete2

print('Testando seq: ')

sequencia01 = 1:10
sequencia01

sequencia02 = seq(1, 90, by=2)
sequencia02

sequencia03 = seq(1, 5, length.out = 10)
sequencia03

print('Matriz: ')
matriz01 = matrix(1:9, nrow = 3, ncol = 3)
matriz01
matriz01[1,]
matriz01[,1]
matriz01[1,3]

matriz02 <- matrix(seq(10, 90, by = 10), nrow = 3, ncol = 3)
matriz02

print('Lista:')

lista01 <- list(c(10,20,30))
lista01

lista02 <- list(nomes = c('Tom', 'Bob'), idades = c(10, 20, 30, 40))
lista02
lista02$nomes
lista02$idades

