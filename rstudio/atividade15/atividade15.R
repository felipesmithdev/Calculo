library(readr)
library(ggplot2)

teste_regressao <- read_csv("Documentos/faculdade/segundo semestre/calculo/r/atividade15/winequality-white.csv")
View(teste_regressao)

df_teste <- read_delim("Documentos/faculdade/segundo semestre/calculo/r/atividade15/winequality-white.csv", delim = ";", col_names = c("fixed_acidity", "volatile_acidity", "citric_acid", "residual_sugar", "chlorides", "free_sulfur_dioxide", "total_sulfur_dioxide", "density", "ph", "sulphates", "alcohol", "quality"))
df_teste <- df_teste[df_teste$fixed_acidity != "fixed acidity", ]



 # DENSIDADE X TEOR ALCOOLICO
densidade <- as.numeric(df_teste$density)
densidade

alcool <- as.numeric(df_teste$alcohol)

plot(densidade ~ alcool)

modelo1 <- lm(densidade ~ alcool)
modelo1

cor(densidade, alcool)

abline(1.013963, -0.001896)

ggplot(mapping = aes(alcool, densidade)) +
  geom_point() + 
  geom_smooth(method = "lm")

retas <- ggplot(mapping = aes(alcool, densidade)) +
  geom_point() + 
  geom_smooth(se = FALSE, method = "lm") +
  geom_hline(yintercept = mean(densidade))

retas

retas + geom_segment(aes(x = alcool, y = densidade, xend = alcool, yend =
                           mean(densidade)), color="red")

retas + geom_segment(aes(x = alcool, y = densidade, xend = alcool, yend =
                           predict(lm(densidade ~ alcool))), color="blue")

mean(densidade)

SQt <- sum((mean(densidade) - densidade)** 2)

SQres <- sum((predict(lm(densidade ~ alcool)) - densidade)**2) 

R2 <- (SQt - SQres) / SQt
R2

# chegando a conclusão que a reta y = 1.013963 + -0.001896 é 60% melhor.

summary(modelo1)
 

# DENSIDADE X ACIDEZ VOLATIL
acido_volatil <- as.numeric(df_teste$volatile_acidity)

cor(densidade, acido_volatil)
plot(densidade, acido_volatil)

# DENSIDADE É POUCO CORRELACIONADA COM ACIDEZ VOLATIL


# QUALIDADE X ALCOOL

qualidade <- as.numeric(df_teste$quality)

# Ver correlação
cor(alcool, qualidade)

modelo2 <- lm(alcool ~ qualidade )
modelo2

plot(alcool, qualidade)
abline(6.9567, 0.6052)

 # não ficou bom a representação desse gráfico, como são dados comparativos
 # vamos utilizar graficos de barras

medias <- tapply(alcool, qualidade, mean, na.rm = TRUE)

barplot(medias,
        col = "pink",
        main = "Nota de qualidade por teor Aloólico",
        xlab = "Qualidade",
        ylab = "Teor alcoólico (média) em %")
