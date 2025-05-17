#Calculando IMC

peso <- 75
altura <- 1.80
IMC <- peso/(altura*altura)
IMC

# universo

n <- 20000
p <- 200000

set.seed(1234)

#idade
idade <- abs(round(rnorm(n, 35, 7),0))
idade

summary(idade)

hist(idade,
     ylab = "Frequência",
     xlab = "Idade (anos)")


#altura
altura <- abs(round(rnorm(n, 1.50, 0.1), 2))
summary(altura)

hist(altura,
     ylab = "Frequência",
     xlab = "Altura")


#peso
peso <- abs(round(rnorm(n, 55, 4), 2))
summary(peso)
hist(peso,
     main = "Histograma do peso",
     ylab = "Frequência",
     xlab = "Peso")
