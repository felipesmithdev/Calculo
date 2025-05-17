library(ggplot2)

pop <- 50000

amostra <- 20000

set.seed(1234)

idade <- sample(c(15:50), replace = TRUE, size = amostra)
idade

estadoC <- sample(c('solteira', 'casada'), replace = TRUE, size = amostra, prob = c(0.3, 0.5))
estadoC

n_sofrem <- rbinom(amostra, 1, ifelse(estadoC == "solteira", 0.30, 0.60))

table(n_sofrem)

renda <- sample(c(1400.00, 2300, 3000.00, 5000.00), replace = TRUE, size = amostra, prob = c(0.5, 0.2, 0.2, 0.1))
print(renda)

df_amostra <- data.frame(
  idade = idade,
  estadoC = estadoC,
  renda = renda,
  sofremViolencia = n_sofrem
)

head(df_amostra)

table(idade)


ggplot(df_amostra, aes(x = estadoC, fill = factor(sofremViolencia))) +
  geom_bar(position = "fill") +
  labs(x = "Estado Civil", y = "Proporção", fill = "Sofrem Violência") +
  scale_fill_manual(values = c("0" = "lightblue", "1" = "red"), labels = c("Não", "Sim")) +
  ggtitle("Proporção de Violência por Estado Civil")



ggplot(df_amostra[df_amostra$sofremViolencia == 1, ], aes(x = idade)) +
  geom_histogram(binwidth = 2, fill = "#739BD0", color = "black") +
  labs(title = "Distribuição Etária das Mulheres que Sofrem Violência",
       x = "Idade", y = "Frequência")


modelo_log <- glm(sofremViolencia ~ idade + estadoC + renda, 
                  data = df_amostra, 
                  family = binomial)

summary(modelo_log)