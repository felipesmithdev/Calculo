library(magrittr)
library(tidyverse)
library(ggthemes)
library(corrplot)
library(GGally)
library(DT)
library(caret)
library(psych)
library(ggplot2)
library(dplyr)

loan <- read.csv("Downloads/15b -loan_data_set.csv" stringsAsFactors = TRUE)
# loan

colnames(loan)
head(loan)

summary(loan)

head(loan)

pairs.panels(loan)

teste <- data.frame(ValoreEmprestimo = loan$LoanAmount, rendaSolicitante = loan$ApplicantIncome, statusEmprestimo = loan$Loan_Status, historicoCredito = loan$Credit_History)

pairs.panels(teste)

loan_sem_na = loan %>%
  select(Loan_Status, LoanAmount, Credit_History, Gender, ApplicantIncome, Loan_Amount_Term)
na.omit(loan)


filtro <- loan[!is.na(loan$Gender) & loan$Gender != "" & loan$LoanAmount < 300, ]

ggplot(filtro, aes(x = Loan_Status, y = LoanAmount, fill = Loan_Status)) +
  geom_boxplot() +
  labs(title = "Distribuição do Valor do Empréstimo por Status",
       x = "Status do Empréstimo",
       y = "Valor do Empréstimo (LoanAmount)") +
  theme_minimal()


table(filtro$Gender)

ggplot(filtro, aes(x = Gender, y = LoanAmount, fill = Gender)) +
  geom_boxplot() +
  labs(title = "Distribuição do Valor do Empréstimo por Gênero",
       x = "Gênero",
       y = "Valor do Empréstimo (LoanAmount)") +
  theme_minimal()


print(factor(filtro$Credit_History))

filtro <- loan[!is.na(loan$LoanAmount) & !is.na(loan$Credit_History) & loan$LoanAmount < 400, ]



ggplot(filtro, aes(x = factor(Credit_History), y = LoanAmount, fill = factor(Credit_History))) +
  geom_boxplot() +
  labs(title = "Distribuição do Valor do Empréstimo por Histórico de Crédito",
       x = "Histórico de Crédito (0 = Ruim, 1 = Bom)",
       y = "Valor do Empréstimo (LoanAmount)") +
  theme_minimal()


teste <- glm(Credit_History ~ ApplicantIncome,  data = loan,
             family = binomial(link = "logit") )

summary(teste)


teste2 <- glm(Credit_History ~ Dependents,  data = loan,
              family = binomial(link = "logit") )

summary(teste2)
# 