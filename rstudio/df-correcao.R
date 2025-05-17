n <- 20000
p <- 200000

set.seed(1234)

idade <- abs(round(rnorm(n,37,7),0))
idade

hist(idade,
     main = "Histograma de Idade",
     ylab = "Frequência",
     xlab = "Idade (anos)")

str(idade)
plot(idade)
plot(table(idade))

peso <- abs(round(rnorm(n,55,4),2))

altura <- abs(round(rnorm(n,1.50,0.20),2))
altura

IMC <- round(peso/(altura*altura),2)
IMC

salario <- abs(round(rnorm(n,3000,450),2))
salario

carro_pop <- rep(c(0:3), p)
carro_pop

set.seed(1)
carro <- sample(carro_pop, n)
carro

datasets:: #variavel de dados aleatorios ficticios prontos sobre temas especificos
  mtcars #exemplo

rm(carro_pop)

filho_pop <- rep(c(0:2), p)
filho_pop

set.seed(2)
filho <- sample(filho_pop, n)
filho

escolaridade_pop <- rep(c(0:6), p)

escolaridade_temp <- sample(escolaridade_pop, n)

escolaridade <- factor(escolaridade_temp,
                       levels = c(0:6),
                       labels = c(
                         'Analfabeto',
                         '1º Grau',
                         '2º Grau',
                         '3º Grau',
                         'Mestrado',
                         'Doutorado',
                         'Pós-Doutorado'
                       ),
                       ordered = TRUE)

escolaridade

rm(escolaridade_pop)
rm(escolaridade_temp)

levels(escolaridade)
as.numeric(escolaridade)

fumante_temp <- rbinom(n, 1, 0.4)
fumante_temp

fumante <- factor(fumante_temp,
                  levels = c(0,1),
                  labels = c('Não', 'Sim'),
                  ordered = TRUE
)

fumante
#rm(fumante)

profissao_pop <- rep(c(1:3), p)
profissao_temp <- sample(profissao_pop, n)
profissao <- factor(profissao_temp,
                    levels = c(1,2,3),
                    labels = c('Humanas',
                               'Exatas',
                               'Biológicas'),
                    ordered = FALSE)

profissao
rm(profissao_pop)
rm(profissao_temp)

sexo_pop <- rep(c(1,2), p)
sexo_temp <- sample(sexo_pop, n)
sexo <- factor(sexo_temp,
               levels = c(1,2),
               labels = c('Masculino',
                          'Feminino'),
               ordered = FALSE)
sexo
plot(sexo)
rm(sexo_temp)
rm(fumante_temp)
rm(sexo_pop)
rm(filho_pop)
#~/calculo/df-correcao.R

df <- data.frame(
  id = c(1:n),
  idade,
  altura,
  peso,
  IMC,
  salario,
  carro,
  filho,
  escolaridade,
  fumante,
  sexo,
  profissao
)

df
write.table(df,
            col.names = TRUE,
            file = "teste02.csv",
            sep = ",",
            fileEncoding = "UTF-8")

