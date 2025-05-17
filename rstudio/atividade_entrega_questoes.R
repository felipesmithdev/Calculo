#atividade de cálculo
# 1) A linguagem R tem uma especificidade de aplicações:
# Justifique por que é aplicada para
# a) Aplicações estatísticas. Dê um exemplo prático
# b) Criação de visualizações gráficas. Dê um exemplo prático
# c) Implementação de modelos matemáticos. Dê um exemplo de modelagem matemática na prática. 

# A linguagem R possui pacotes que facilitam na criação de gráficos e dashboads, visualize como exemplo essa criação a seguir:

a <- 10000
b <- 40000

set.seed(1234)

c <- rbinom(a,1,0.2)

hist(c,
     main = "Grafico C",
     ylab = "Eixo do Y",
     xlab = "Eixo do X",
     col = "blue")

d <- factor(c, levels = c(0,1),
            labels = c("True",
                       "False"),
            ordered = TRUE)

plot(d)

# Nesse caso, fiz uma simulação de gráficos usando o histograma e o plot, de forma simples rápida, para demonstrar a facilidade de criação

matriz <- matrix(seq(10, 90, by = 10), nrow = 3, ncol = 3)
matriz

# um exemplo de modelo matemático

# 2) Em um contexto de cursos superior de bacharelado, um sistema está sendo criado para
# se tornar inteligente e apontar o desempenho dos alunos. Uma prova de conceito (POC)
# é realizada à partir do trecho de código e dos seguintes requisitos a seguir. Apresente
# os resultados dos alunos aprovados em forma gráfica obedecendo ao código e
# requisitos. Faça insights. 

set.seed(20)
notas <- data.frame(Matricula = sample(x = 011475:012990, size = 30, replace = FALSE),
                    ac1 = sample(x = 1:10, size = 30, replace = TRUE),
                    ac2 = sample(x = 1:10, size = 30, replace = TRUE),
                    prova_final= sample(x = 1:10, size = 30, replace = TRUE))
notas

# pegando a média das notas com seus valores ajustados
media <- (notas$ac1 * 0.40) + (notas$ac2 * 0.40) + (notas$prova_final * 0.20)

# adicionando a média na correspondência com as notas calculadas
notas$media <- media

plot(media)

# histograma apontando como X a média das notas e Y a quantidade de alunos
hist(media, 
     main = "Médias",
     ylab = 'Alunos',
     xlab = "Média",
     col = "green")

# filtrando pra que os aprovados estejam com a nota igual ou superior a 7
aprovados <- subset(notas, media >= 7)

# exibindo os alunos aprovados
grafico_final <- hist(aprovados$media,
     ylab = "Frequência",
     xlab = "Média",
     main = "Aprovados")

# 3) Dados dois quadros, análise e utilize o quadro 2 para criar colunas novas no quadro 1. E plote uma
# representação gráfica de barras do faturamento de cada vendedor. Faça insights

quadro1 <- data.frame(vendedor = sample(c("Ana", "Flavia", "Pedro", "Marina"), size = 8, replace = TRUE),
                      dia = sample(c(1:2), size = 8, replace = TRUE),
                      produto = sample(c("Saia","Casaco", "Vestido", "Meia", "calçaFlaire", "calçaSkinny", "Manta"), size = 8, replace = TRUE),
                      quantidade = sample(c(0:5), size = 8, replace = TRUE))

quadro1

quadro2 <- data.frame(produto = sample(c("Calça", "Vestido", "Blusa", "Manta", "Saia", "Casaco", "Meia"), size = 7, replace = FALSE),
                      preco_unitario = c(240.00, 320.00, 98.00, 69.20, 145.00, 289.00, 39.00),
                      custo_unitario = c(210.00, 160.00, 60.00, 39.00, 89.00, 144.00, 15.00))

quadro2

# aqui estou verificando se existe algum registro com "calça" no meio para conseguir adicionar uma nova coluna associando o valor
quadro1$produto <- ifelse(grepl("Calça", quadro1$produto, ignore.case = TRUE), "Calça", quadro1$produto)

# agora irei juntar todos os registros dos quadros 1 e 2, pelo produto
quadro_final <- merge(quadro1, quadro2, by = "produto", all.x = TRUE)

# adicionando a coluna total, onde eu pego o produto e multiplico a quantidade pelo valor
quadro_final$total <- quadro_final$preco_unitario * quadro_final$quantidade
quadro_final
quadro_final$faturamento <- quadro_final$total - (quadro_final$custo_unitario * quadro_final$quantidade) 

# aggregate funciona como um método que agrupa valores de um grupo específico, como por exemplo: 
# aggregate("o que quero somar" ~ "agrupado por: ", data = "dataframe com os dados", sum (some))
lucro_vendedor <- aggregate(total ~ vendedor, data = quadro_final, sum)
lucro_sob_venda <- aggregate(faturamento ~ vendedor, data = quadro_final, sum)

print(lucro_sob_venda)


# utilizei o barplot para fazer o comparativo entre os vendedores e tirar insights de possíveis técnicas que estão usando
# foi necessário o barplot porque os valores são comparativos, o hist aceita apenas valores numéricos, ou seja, não poderia ter os nomes dos vendedores
barplot(lucro_vendedor$total,
        names.arg = lucro_vendedor$vendedor,
        col = "pink",
        main = "Total Vendido por Vendedor",
        xlab = "Vendedor",
        ylab = "Total venda")

# agora o barplot do faturamento ( valor de venda - custo)
barplot(lucro_sob_venda$faturamento,
        names.arg = lucro_sob_venda$vendedor,
        col = "pink",
        main = "Total Vendido por Vendedor",
        xlab = "Vendedor",
        ylab = "Total venda")



# 4) O IMC (índice de massa corpórea) indica o grau de obesidade de uma pessoa. Este índice é obtido pelo peso
# (em kg) dividido pelo quadrado da altura (em metros). A Tabela 1 apresenta as faixas deste índice:

set.seed(36)
dados <- data.frame(Nome = c("Ana", "Maria", "Henrique", "Paula", "Felipe",
                             "Carlos", "Cristiane"), Altura = sample(x = (150:190), size = 7, replace = TRUE)/100,
                    Peso = sample(x = 48:100, size = 7, replace = TRUE))

# adicionando a coluna de imc ou avaliação
dados$imc <- round(dados$Peso / (dados$Altura ** 2),1)

# adicionando uma validação para separar de maneira ajeitada
dados$avaliacao <- ifelse(dados$imc < 20, "abaixo da normal",
                          ifelse(dados$imc < 25, "normal",
                                 ifelse(dados$imc < 30, "sobrepeso",
                                        ifelse(dados$imc < 35, "obesidade leve",
                                               ifelse(dados$imc < 40, "obesidade moderada", "obesidade mórbida")))))
dados$Avaliacao

# adicionando a recomendação
dados$recomendacao <- ifelse(dados$avaliacao == "abaixo da normal", "suplementação",
                             ifelse(dados$Avaliacao != "normal", "dieta", NA))

# conferindo todos os valores do dataframe
str(dados)


#5) Crie o seguinte código em R:
# Dados dois valores, retorna o maior entre eles. Obs.: Insira mensagens de aviso para o usuário caso o
# valor que ele insira não seja numérico.

pedirNumeros <- function(){
  n1 <- readline(prompt = "Digite o primeiro valor: ")
  n2 <- readline(prompt = "Digite o segundo valor: ")
  
  # verificando se os campos são numeros
  if(!is.na(as.numeric(n1)) && !is.na(as.numeric(n2))){
    
    # as.numeric para transformar os valores em numeros, caso sejam capturados como string
    num1 <- as.numeric(n1)
    num2 <- as.numeric(n2)
    
    if (num1 > num2){
      cat("O maior numero é: ", num1, "\n")
    } else if (num2 > num1){
      cat("O maior numero é: ", num2, "\n")
    } else {
      cat("Os numeros são iguais.", "\n")
    }
    
  } else {
    cat("Digite valores numéricos")
  }
}
pedirNumeros()



# 6) Utilizando seed =10, crie um vetor de valores numéricos com o seguinte código:
# set.seed(seed)
# vetorNumerico <- sample(x = 1:25, size = 800, replace = TRUE)
# Calcule a frequência em que cada número aparece.

set.seed(10)
vetorNumerico <- sample(x = 1:25, size = 800, replace = TRUE)

# table retorna exatamente quantas vezes o número foi reproduzido
frequencia <- table(vetorNumerico)

print(frequencia)  

# gerandi um gráfico de barra pra ficar mais facil a visualização
barplot(frequencia,
        col = "green",
        main = "Frequencia numeros",
        xlab = "Numero",
        ylab = "Frequencia")


# 7) Utilizando seed =10, crie um vetor de valores numéricos com o seguinte código:
# Conte quantos números pares e quantos números ímpares existem nestes dados

set.seed(10)
vetorNumerico <- sample(x = 1:25, size = 800, replace = TRUE)

# separando os números que são divisíveis por 2 e tem como resto 0
n_pares <- vetorNumerico[vetorNumerico %% 2 == 0]

# separando os que não são
n_impares <- vetorNumerico[vetorNumerico %% 2 != 0]

qtd_pares <- length(n_pares)
qtd_impares <- length(n_impares)

cat("Quantidade de pares: ", qtd_pares, "\n")
cat("Quantidade de ímpares: ", qtd_impares, "\n")


#8) Utilizando seed =10, crie um vetor de valores numéricos com o seguinte código:
# Plote um gráfico de barras que mostre a frequência em que cada número aparece nestes dados e pinte
# as barras conforme a categoria (par ou ímpar)

set.seed(10)
vetorNumerico <- sample(x = 1:25, size = 800, replace = TRUE)

frequencia <- table(vetorNumerico)

numeros <- as.numeric(names(frequencia))
categoria <- ifelse(numeros %% 2 == 0, "Par", "Impar")

cores <- ifelse(categoria == "Par", "blue", "green")

barplot(frequencia,
        col = cores,
        main = "Frequencia dos numeros",
        xlab = "Numero",
        ylab = "Frequência",
        names.arg = numeros)


#9) Utilizando seed =10, crie um vetor de valores numéricos com o seguinte código:
# Crie um data.frame chamado dados com uma coluna de nome “Numeros” que recebe os valores de
# vetorNumerico e outra coluna de nome “Categoria” que informa se o número é par ou ímpar

set.seed(10)
vetorNumerico <- sample(x = 1:25, size = 800, replace = TRUE)
frequencia <- table(vetorNumerico)
numeros <- as.numeric(names(frequencia))
categoria <- ifelse(numeros %% 2 == 0, "Par", "Impar")

dados <- data.frame(
  Nome = c(numeros),
  Categoria = c(categoria)
)
dados

# 10) Para estudar o comportamento das vendas, um administrador coleta informações sobre o número de
# itens vendidos nos últimos 30 dias. Simule a coleta destes dados, onde as vendas variem entre 28 e 52
# unidades. Use set.seed(50), de forma que possamos reproduzir os resultados dos chamados de Geradores
# de Números Aleatórios. Estes são, na verdade, Pseudo-Aleatórios porque são totalmente algorítmicos:
# dada a mesma semente, você obtém a mesma sequência.

set.seed(50)

vendas <- data.frame(Qtd = sample(x = 28:52, size = 30, replace = TRUE),
                     DiaMes = seq(from=as.Date("2021-09-01"), to=as.Date("2021-09-30"), by="day"),
                     DiaSemana = weekdays(seq(from=as.Date("2021-09-01"), to=as.Date("2021-09-30"),
                                              by="day")))
vendas

# a) Plote um gráfico de dispersão da quantidade de vendas por dia.

# esse gráfico é bom para analisar o crescimento ou queda nas vendas, cada ponto representa a quantidade de itens vendidos no mês
plot(vendas$DiaMes, vendas$Qtd, main = "Frequência da Qtd de vendas",xlab = "Dia", ylab =
       "Qtd vendas")

table(vendas$Qtd)

hist(vendas$Qtd,
     ylab = "Frequência",
     xlab = "Quantidade",
     main = "Frequência da quantidade de vendas")

# b) Qual foi a variação das vendas no mês de análise?

# aqui iremos pegar a variação da menor venda para a maior venda, se o intervalo for grande significa que tem muita variação
varmes <- max(vendas$Qtd) - min(vendas$Qtd)
varmes


# c) Qual é a média de quantidade de vendas?

# aqui vamos pegar a média das vendas, isso é ótimo para avaliação de desempenho, no caso a média de vendas diárias foi
# 41 itens por dia (dado recebido ao executar os comandos abaixo)
medven<- round(mean(vendas$Qtd))
medven

# d) Construa o histograma da frequência de vendas. Coloque o título e os rótulos nos eixos e determine
# uma cor para o histograma.

# esse histograma mostra quantas vezes uma faixa de quantidade foi vendida ao longo do mês, no nosso caso, a concentração de quantidade
# está relacionada entre 38 e 44, o que pode resultar em um padrão de vendas estável

hist(vendas$Qtd,
     ylab = "Frequência",
     xlab = "Quantidade",
     main = "Frequência da quantidade de vendas",
     col = "navyblue",
     border = "white")

# Você deverá analisar e justificar os itens a,b,c e d. 


# 11) Gere as seguintes sequências e atribua a uma variável:

x1 <- seq(1:4)
x2 <- seq(from = 2, by = 3, length.out = 4)
# ou seq(2,11, by = 3), recebe o mesmo resultado
x3 <- LETTERS[1:4]
x4 <- letters[1:4]
x5 <- LETTERS[seq(1,7, by = 2)]
x6 <- seq(10, 7) # ou x6 <- 10:7
x7 <- seq(from = 10, to = 4, by = -2)
x8 <- rep(c(2,5,8), each = 4)
x9 <- c(x1, x2, x3, x4, x5, x6, x7, x8, x9)


# 12) Atribua a data de hoje para a variável x e a data do seu nascimento para a variável y e verifique a sua
# idade em dias. Verifique se sua idade está correta em anos.

x <- Sys.Date()
y <- as.Date("2004-09-11")

idade_em_dias <- x - y
idade_em_dias
# também podemos pegar esse valor convertido para anos
idade_em_anos <- as.numeric(idade_em_dias) / 365.25
# agora vamos arredondar para um valor inteiro
idade_em_anos <- floor(as.numeric(idade_em_anos))
idade_em_anos


# 13) Crie uma tabela que contenha a data de nascimento de 100 pessoas, sendo que as pessoas serão
# identificadas pelo RG (fictício e deve ser um número contendo 10 algarismos). Em seguida, adicione uma
# coluna que informe se a pessoa poderá ou não votar em 01 de outubro de 2022. Por fim, adicione mais
# uma coluna informando o tipo de voto (facultativo, obrigatório ou NA para os casos em que a pessoa não
# completou idade para votar). Obs: As datas de nascimento devem estar dentro do intervalo: 1954-01-01
# a 2010-01-01. Considere: voto facultativos para: os eleitores maiores de 16 anos e menores de 18 anos;
# e os maiores de 70 anos.

set.seed(1234)
rg <- sample(1000000000 : 9999999999, 100, replace = FALSE)
data_nasc <- sample(seq(as.Date("1954-01-01"), as.Date("2010-01-01"), by = "day"), 100, replace = TRUE)

tabela <- data.frame(rg = rg,
                     nascimento = data_nasc)

data_voto <- as.Date("2022-10-01")

# criando uma coluna de idade, para ficar mais fácil calcular
tabela$idade <- as.numeric(floor((data_voto - tabela$nascimento) / 365.25))
tabela

# estrutura de decisão pra uma nova coluna referente a se pode votar ou não
tabela$pode_votar <- ifelse(tabela$idade >= 16, "SIM", "NÃO")

# declarando o tipo de voto de acordo com a idade
tabela$tipo_voto <- ifelse(tabela$idade < 16, "NA",
                           ifelse((tabela$idade >= 16 & tabela$idade < 18) | tabela$idade >= 70,
                                  "Facultativo", "Obrigatório"))
tabela


# 14) Dados dois quadros, análise e utilize o quadro 2 para criar colunas novas no quadro 1. E plote uma
# representação gráfica de barras do faturamento de cada vendedor. Faça insights

quadro1 <- data.frame(vendedor = rep(c("Ana", "Flavia", "Pedro", "Marina")),
                      dia = rep(c(1,2), each = 4),
                      produto = c("Saia","Casaco", "Vestido", "Meia", "calçaFlaire", "calçaSkinny", "CalçaSkinny", "Manta"),
                      quantidade = c(1, 2, 1, 5, 3, 0, 3, 4))

quadro1

quadro2 <- data.frame(produto = c("Calça", "Vestido", "Blusa", "Manta", "Saia", "Casaco", "Meia"),
                      preco_unitario = c(240.00, 320.00, 98.00, 69.20, 145.00, 289.00, 39.00),
                      custo_unitario = c(210.00, 160.00, 60.00, 39.00, 89.00, 144.00, 15.00))
quadro2

quadro1$produto <- ifelse(grepl("Calça", quadro1$produto, ignore.case = TRUE), "Calça", quadro1$produto)

quadro_teste <- merge(quadro1, quadro2, by = "produto", all.x = TRUE)

# calculando o lucro total ((valor - custo) * quantidade) e atribuindo a uma coluna lucro_sob_venda
quadro_teste$lucro_sob_venda <- (quadro_teste$preco_unitario - quadro_teste$custo_unitario) * quadro_teste$quantidade

# aqui está o lucro total de todas as vendas agrupado por cada vendedor
lucro_total <- aggregate(lucro_sob_venda ~ vendedor, data = quadro_teste, sum)


# a) Quantas calças (flaire + skinny) foram vendidas? Qual o Faturamento total em calças?
calcas <- subset(quadro_teste, produto == "Calça")
quantidade_calcas <- sum(calcas$quantidade)
faturamento_calcas <- sum(calcas$lucro_sob_venda)

# b) Qual vendedor obteve maior desempenho de vendas (maior faturamento)? E qual vendedor obteve
# menor desempenho?
faturamento_por_vendedor <- lucro_total
maior <- faturamento_por_vendedor[which.max(faturamento_por_vendedor$lucro_sob_venda),]
menor <- faturamento_por_vendedor[which.min(faturamento_por_vendedor$lucro_sob_venda),]

# c) Qual faturamento gerado pelo vendedor Pedro?
faturamento_pedro <- faturamento_por_vendedor[faturamento_por_vendedor$vendedor == "Pedro",]

# 15) Para estudar o desempenho dos vendedores, o gerente de uma loja de vestuário coleta informações sobre
# o número de peças vendidas por cada vendedor nos últimos 30 dias. Simule a coleta destes dados, conforme
# as instruções:

# a) use set.seed(20)
set.seed(20)

# b) os vendedores são: Ana, Flavia, Pedro e Mariana. Cada vendedor deve apresentar dados referentes às
# suas vendas para os 30 dias; (Dica: use a função rep() e a cada 4 elementos repita a lista de vendedores;
# Faça o vetor dias ter tamanho 30*4)
vendedores <- rep(c("Ana", "Flavia", "Pedro", "Marina"), times = 30)
dias <- rep(1:30, each = 4)

# c) produtos comercializados são: calçaFlaire, calçaSkinny, vestido, blusa, manta, saia, casaco, meia;
# as vendas devem variar entre 0 e 5 unidades diárias;

produtos <- sample(c("calçaFlaire", "calçaSkinny", "vestido", "blusa", "manta", "saia", "casaco", "meia"),
                   size = 120, replace = TRUE)

quantidades <- sample(0:5, size = 120, replace = TRUE)

#agora irei montar o data frame com esses dados aleatórios

vendas <- data.frame(vendedor = vendedores,
                     dia = dias,
                     produto = produtos,
                     quantidade = quantidades)


# 16) Com a pandemia o custo unitário dos produtos subiu 5%. Faça o reajuste necessário no quadro 2, em uma
# nova coluna.

produtos <- c("calça", "vestido", "blusa", "manta", "saia", "casaco", "meia")
preco_unitario <- c(240.00, 320.00, 98.00, 69.00, 145.00, 289.00, 39.00)
custo_unitario <- c(210.00, 160.00, 60.00, 39.00, 89.00, 144.00, 15.00)

quadro2 <- data.frame(
  produto = produtos,
  precoUnitario = preco_unitario,
  custoUnitario = custo_unitario
)
quadro2

quadro2$precoReajustado <- round(quadro2$precoUnitario * 1.05, 2)

# 17) Crie as seguintes funções:
# Dado um vetor, retorna um novo vetor de somas acumuladas a cada posição.
# Exemplo: Entrada: x <- c(1,3,8,2,1,3) ; Saída: 1, 4, 12, 14, 15, 18.

somar_vetor <- function(x){
  resultado <- numeric(length(x))
  soma <- 0
  
  for (i in 1:length(x)) {
    soma <- soma + x[i]
    resultado[i] <- soma
  }
  
  return(resultado)
}

x <- c(1,3,8,2,1,3)
somar_vetor(x)



# 18) Projetinho: Dada a base de dados de temperatura das cidades do mundo, com o arquivo em csv, aplique
# técnicas de ETL e sumarizações para criar uma nova tabela que apresente a média do último ano de coleta
# das temperaturas de cada cidade. Utilize as ferramentas que você domina. Feito isso, apresente um gráfico
# das cidades que tem as 5 maiores temperatura mundiais.
# Avalie se vc precisa tratar os dados, limpar, excluir, para que surjam novas tabelas, mais reduzidas, de modo
# a facilitar os insights. Mostre com prints de tela todas fases do projetinho. 

library(readr)
city_temperature <- read_csv("Documentos/faculdade/segundo semestre/calculo/r/city_temperature.csv")
View(city_temperature)

city_temperature

# verificando registros que possuem state
com_state <- city_temperature[!is.na(city_temperature$State),]

# contando a quantidade de NA presentes nessa tabela
colSums(is.na(city_temperature))

# verificando a variação dos anos, do menor ao maior
unique(city_temperature$Year)
max(city_temperature$Year)
city_temperature

# verificando os valores presentes, buscando o minimor, medio, max...
summary(city_temperature$AvgTemperature)
plot(table(city_temperature$AvgTemperature))

# removendo registros em que a avgTemperature é NA, isso evita ter registros desnecessários no tratamento
city_temperature <- city_temperature[!is.na(city_temperature$AvgTemperature), ]
# removendo registros que possuem valores fora do possível, é impossível ter variações climáticas menores que -90 graus ou maiores
# que 60 graus
city_temperature <- city_temperature[city_temperature$AvgTemperature > -90 & city_temperature$AvgTemperature < 60, ]


# partindo para a criação da tabela com dados do ultimo ano de coleta, no caso 2020
dados_2020 <- city_temperature[city_temperature$Year == 2020, ]

# agora iremos agrupar os valores pelo país + cidade para evitar que algumas cidades que possuem o mesmo nome
# fiquem na mesma coluna, também vamos calcular a média
media_por_cidade <- aggregate(AvgTemperature ~ Country + City, data = dados_2020, FUN = mean)

# para ver os dados formatados para 2 casas decimais, usaremos o round
media_por_cidade$AvgTemperature <- round(media_por_cidade$AvgTemperature, 3)


# verificando quais são as 5 cidades mais quentes
ranking_mais_quentes <- media_por_cidade[order(-media_por_cidade$AvgTemperature), ][1:5 ,]
print(ranking_mais_quentes)

barplot(ranking_mais_quentes$AvgTemperature,
        names.arg = ranking_mais_quentes$City,
        col = "pink",
        ylab = "Temperatura Média",
        xlab = "Cidade",
        main = "Top 5 cidades mais quentes")


# fazendo o mesmo pra descobrir qual foram as cidades mais quentes de todos registros
table(city_temperature$AvgTemperature)

media_total <- aggregate(AvgTemperature ~ Country + City, data = city_temperature, FUN = mean)
media_total

mais_quente_total <- media_total[order(-media_total$AvgTemperature), ][1:5 ,]

barplot(mais_quente_total$AvgTemperature,
        names.arg = mais_quente_total$City,
        col = "pink",
        ylab = "Temperatura Média",
        xlab = "Cidade",
        main = "Top 5 cidades mais quentes")


# os valores estão parecidos, a diferença entre eles é bem pequena