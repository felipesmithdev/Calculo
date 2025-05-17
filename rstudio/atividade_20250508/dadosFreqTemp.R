library(readr)
dados_csv <- read_csv("DadosFreqTemp.csv")
head(dados_csv)

dados <- as.numeric(sample(dados_csv$Core1.Temp, replace = TRUE, size = 2000))

variacaoDados <- dados - mean(dados)

variacaoDados <- variacaoDados ^ 2

variancia <- mean(variacaoDados)

var(dados)

variancia

desvio <- sqrt(variancia)

sd(dados)

desvio


# primeira amostra
cpuCore1_amostra <- sample(dados, replace = TRUE, size = 200)

variacaoDados2 <- cpuCore1_amostra - mean(cpuCore1_amostra)

variacaoDados2 <- variacaoDados2 ^ 2

variancia2 <- mean(variacaoDados2)

var(cpuCore1_amostra)

variancia2

desvio2 <- sqrt(variancia2)

sd(cpuCore1_amostra)

desvio2


# segunda amostra 
cpuCore1_amostra2 <- sample(dados, replace = TRUE, size = 200)

variacaoDados3 <- cpuCore1_amostra2 - mean(cpuCore1_amostra2)

variacaoDados3 <- variacaoDados3 ^ 2

variancia3 <- mean(variacaoDados3)

var(cpuCore1_amostra2)

variancia3

desvio3 <- sqrt(variancia3)

sd(cpuCore1_amostra2)

desvio3


# terceira amostra
cpuCore1_amostra3 <- sample(dados, replace = TRUE, size = 200)

variacaoDados4 <- cpuCore1_amostra3 - mean(cpuCore1_amostra3)

variacaoDados4 <- variacaoDados4 ^ 2

variancia4 <- mean(variacaoDados4)

var(cpuCore1_amostra3)

variancia4

desvio4 <- sqrt(variancia4)

sd(cpuCore1_amostra3)

desvio4


# quarta amostra
cpuCore1_amostra4 <- sample(dados, replace = TRUE, size = 200)

variacaoDados5 <- cpuCore1_amostra4 - mean(cpuCore1_amostra4)

variacaoDados5 <- variacaoDados5 ^ 2

variancia5 <- mean(variacaoDados5)

var(cpuCore1_amostra4)

variancia5

desvio5 <- sqrt(variancia5)

sd(cpuCore1_amostra4)

desvio5


resultado <- data.frame(
  funcoes = c("mean", "var", "variancia", "desvio", "sd"),
  popCPU = c(mean(dados), var(dados), variancia, desvio, sd(dados)),
  amostra1 = c(mean(cpuCore1_amostra), var(cpuCore1_amostra), variancia2, desvio2, sd(cpuCore1_amostra)),
  amostra2 = c(mean(cpuCore1_amostra2), var(cpuCore1_amostra2), variancia3, desvio3, sd(cpuCore1_amostra2)),
  amostra3 = c(mean(cpuCore1_amostra3), var(cpuCore1_amostra3), variancia4, desvio4, sd(cpuCore1_amostra3)),
  amostra4 = c(mean(cpuCore1_amostra4), var(cpuCore1_amostra4), variancia5, desvio5, sd(cpuCore1_amostra4))
)

resultado





