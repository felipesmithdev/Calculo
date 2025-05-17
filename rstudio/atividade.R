p <- 189000
n <- 18900

set.seed(1234)

atendimento_temp <- rbinom(n, 1, 0.32)

plot(table(atendimento_temp))

atendimento <- factor(atendimento_temp, levels = c(0,1),
                      labels = c("NÃO",
                                 "SIM"),
                      ordered = TRUE)
plot(atendimento)

atendidos_n <- round(n * 0.32 ,0)
atendidos_n

atendidos_7_17 <- abs(round( rnorm(atendidos_n * 0.3, 12, 5),0))
plot(atendidos_7_17)

hist_7_17 <- hist(atendidos_7_17,
                  ylab = "Frequẽncia",
                  xlab = "Idade(Anos)"
)

atendidos_55_82 <- abs(round( rnorm(atendidos_n * 0.7, 68, 13.5),0))
atendidos_55_82

hist_55_82 <- hist(atendidos_55_82, 
                   ylab = "Frequência",
                   xlab = "Idade(Anos)")
summary(atendidos_55_82)

mesclagem <- c(atendidos_7_17, atendidos_55_82)
plot(table(mesclagem))

summary(mesclagem)
#isso nos mostra o maior volume de atendimentos para idosos e um pico levemente mais alto para crianças

problemas_cronicos_7_17_temp <- rbinom(atendidos_n * 0.3, 1, 0.2)
problemas_cronicos_55_82_temp <- rbinom(atendidos_n * 0.7, 1, 0.7)

problemas_cronicos_7_17 <- factor(problemas_cronicos_7_17_temp, levels = c(0,1), labels = c("Não",
                                                                                       "Sim"), ordered = TRUE)

problemas_cronicos_55_82 <- factor(problemas_cronicos_55_82_temp, levels = c(0,1), labels = c("Não",
                                                                                              "Sim"), ordered = TRUE)
plot(problemas_cronicos_55_82)
plot(problemas_cronicos_7_17)

df_7_17 <- data.frame(
  id = c(1:(atendidos_n * 0.3)),
  atendidos_7_17,
  problemas_cronicos_7_17)

df_55_82 <- data.frame(
  id = c(1:(atendidos_n * 0.7)),
  atendidos_55_82,
  problemas_cronicos_55_82)
