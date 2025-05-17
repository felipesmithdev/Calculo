peso=c(60,55,70,45,80,35,65,50,75,40,85,30,60,55,70,45,80)
genero=c('m','f','m','f','m','f','m','f','m','f','m','f','m','f','m','f','m')
idade=c(25,40,55,35,60,20,45,30,50,25,65,18,40,35,55,40,60)
altura=c(175,165,180,160,185,155,170,165,180,160,185,155,175,165,180,160,185)
dfoo = data.frame(peso, genero, idade, altura)

plot(dfoo$altura ~ dfoo$peso)

modelo1 <- lm(dfoo$altura ~dfoo$peso)
modelo1

cor(dfoo$altura, dfoo$peso)

abline(133.468 , 0.631)

library(ggplot2)

ggplot(mapping = aes(dfoo$peso, dfoo$altura)) +
  geom_point() + 
  geom_smooth(method = "lm")

retas <- ggplot(mapping = aes(dfoo$peso, dfoo$altura)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm") +
  geom_hline(yintercept = mean(dfoo$altura))


media_altura = mean(dfoo$altura)
media_altura

retas + geom_segment(aes(x = dfoo$peso, y = dfoo$altura, xend = dfoo$peso, yend =
                           mean(dfoo$altura)), color="red")

retas + geom_segment(aes(x = dfoo$peso, y = dfoo$altura, xend = dfoo$peso, yend =
                           predict(lm(dfoo$altura ~ dfoo$peso))), color="red")

SQt <- sum((mean(dfoo$altura) - dfoo$altura)** 2)

SQres <- sum((predict(lm(dfoo$altura ~ dfoo$peso)) - dfoo$altura)**2) 

R2 <- (SQt - SQres) / SQt
R2

summary(modelo1)
