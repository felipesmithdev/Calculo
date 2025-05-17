## 1
p <- 189000
# Universo
n <- 18900
#Amostra
set.seed(1234)
#Setou a seed
atendimento_temp <- rbinom(n, 1, 0.32)
#dessa amostra assumimos que 32% foi atendido

plot(table(atendimento_temp))


atendimento <- factor(atendimento_temp, levels=c(0,1), labels=c("Não", "Sim"),
                      ordered = TRUE)
#mostrando que 32% dos conveniados foram atendidos com problemas respiratorios
plot(atendimento)

atendidos_n <- round(n * 0.32, 0)
#pegamos o numero de 32%, que foram os atendidos da amostra


atendidos_7_17 <- abs(round(rnorm(atendidos_n * 0.3, 12, 5), 0))
# 30% de 6048 
#Assumimos que 30% desses atendidos estão na faixa de 7 a 17 anos

hist_7_17 <- hist(atendidos_7_17,
                  ylab = "Frequencia",
                  xlab = "Idade (Anos)", main = "Histograma Infantil"
)

summary(atendidos_7_17)
#média com 12 anos em torno de 280 pessoas

atendidos_55_82 <-  abs(round(rnorm(atendidos_n * 0.7, 68, 13.5), 0))
## Consideramos que 70% dos atendidos eram idosos
hist_55_82 <- hist(atendidos_55_82, ylab="Frequencia", xlab="Idade (Anos)", main = "Histograma Idosos")
#FAIXA ETARIA COM MAIOR NÚMERO DE ATENDIMENTOS MÉDICOS
summary(atendidos_55_82)
# Fazendo o histograma, descobrimos que a média de idade com maior número de atendimentos
#É 68 anos em torno de 600 pessoas

## 2

mesclagem_atendimentos <- c(atendidos_7_17, atendidos_55_82)

plot(table(mesclagem_atendimentos))


## 3
#média de 60 anos

summary(mesclagem_atendimentos)

#isso nos mostra um maior volume de atendimentos para idosos e um pico levemente
# mais alto para atendimento infantil



problemas_cronicos_7_17_temp <- rbinom(atendidos_n * 0.3, 1, 0.2)

problemas_cronicos_55_82_temp <- rbinom(atendidos_n * 0.7, 1, 0.7)

# Um dos fatores que pesam na hora de priorizar atendimentos são os agravantes
#Como doenças cronicas.


problemas_cronicos_7_17 <- factor(problemas_cronicos_7_17_temp, levels=c(0,1),
                                  labels=c("Não", "Sim"), ordered=TRUE)

problemas_cronicos_55_82 <- factor(problemas_cronicos_55_82_temp, levels=c(0,1),
                                  labels=c("Não", "Sim"), ordered=TRUE)

plot(problemas_cronicos_7_17)
plot(problemas_cronicos_55_82)
atendidos_7_17

df_7_17 <- data.frame(
  id= c(1:(atendidos_n * 0.3)),
        idade=atendidos_7_17,
        problema=problemas_cronicos_7_17)


df_55_82 <- data.frame(
  id = c(1:(atendidos_n * 0.7)),
  idade=atendidos_55_82,
  problema=problemas_cronicos_55_82
  
)

# Chegamos a conclusão de que os atendimento para idosos tendem a ser priorizados

# Pesquisa fala que 70% dos idosos tem doenças cronicas
# Nos temos uma amostra de 18900, sendo que apenas 32% desses foram atendidos
# Ou seja 6048. Aplicando o que foi pesquisado cerca de 4233 pessoas eram idosas
# Chegamos a conclusão que de a cada 6 atendimentos, 4 devem ser para idosos

prioridade_atendimento_infantil <- rep(1,atendidos_n * 0.3 ) 

prioridade_atendimento_idoso <- rep(2, atendidos_n * 0.7)

mesclagem_prioridade <- c(prioridade_atendimento_idoso, prioridade_atendimento_infantil)

plot(table(mesclagem_prioridade))

prioridade_factor <- factor(mesclagem_prioridade, levels = c(1,2),labels = c("Infantil", "Idoso"))
plot(prioridade_factor)
#Grafico que mostra a prioridade de atendimento




