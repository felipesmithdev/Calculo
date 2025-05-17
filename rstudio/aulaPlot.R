#esse dataframe foi gerado a partir de um csv

teste$valorCaptura

p <- 200000
n <- 20000

set.seed(1234)

idade <- abs(round(rnorm(n, 37, 7), 0))
idade

hist(idade,
     main = "Hist de idade",
     ylab = "freq",
     xlab = "idade")

table(idade)

plot(table(idade))
plot(idade)
str(idade)
summary(idade)

#teste <- function(a, b = 5)

altura <- abs(round( rnorm(n, 1.50, 0.20), 2))
altura

peso <- abs(round( rnorm(n, 55, 4),2))
peso

imc <- round((peso / (altura * altura)),2)
imc

salario <- abs(round( rnorm(n, 3000, 400),2))
salario

carro_pop <- rep(c(0: 3) , p)
carro_pop


set.seed(1)
carro <- sample(carro_pop, n)
carro

rm(carro_pop) #removendo da memoria

filho_pop <- rep(c(0:2), p)
filho_pop

set.seed(2)
filho <- sample(filho_pop, n)
filho


rm(filho_pop)

mtcars
datasets::Titanic

table(filho)

table(carro)

escolaridade_pop <- rep(c(0:6), p)
escolaridade_pop

escolaridade_temp <- sample(escolaridade_pop, n)
escolaridade_temp
  
escolaridade <- factor(escolaridade_temp,
                       levels = c(0:6),
                       labels = c(
                         "Analfabeto",
                         "Primeiro grau completo",
                         "Segundo grau completo",
                         "Terceiro grau completo",
                         "Mestrado",
                         "Doutorado",
                         "Pós doutorado"
                       ),
                       ordered = TRUE)
escolaridade

rm(escolaridade_pop)
rm(escolaridade_temp)

levels(escolaridade)
as.numeric(escolaridade)

plot(table(escolaridade))
plot(escolaridade)


fumante_temp <- rbinom(n,1, 0.40)
fumante_temp

fumante <- factor(fumante_temp, levels = c(0,1),
                  labels = c("Não",
                             "Sim"),
                  ordered = TRUE)
fumante


profissao_pop <- rep(c(1:3), p)
profissao_temp <- sample(profissao_pop, n)
profissao <- factor(profissao_temp, levels = c(1,2,3),
                    labels = c("Humanas",
                               "Exatas",
                               "Biológicas"),
                    ordered = FALSE
                    )
profissao

sexo_pop <- rep(c(1:2), p)
sexo_temp <- sample(sexo_pop, n)
sexo <- factor(sexo_temp, levels = c(1,2),
               labels = c("Masculino",
                          "Feminino"),
               ordered = FALSE)
sexo

df <- data.frame(
  id = c(1:n),
  idade,
  altura,
  peso,
  imc,
  salario,
  carro,
  filho,
  escolaridade,
  fumante,
  profissao
)

df

write.table(df,
            col.names = TRUE
            , file = "teste2.csv",
            sep = ",",
            fileEncoding = "UTF-8")

getwd()
