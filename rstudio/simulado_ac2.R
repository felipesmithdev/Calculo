
# PREPARATÓRIO AC2  
# 1

data <- matrix(1:9, nrow = 3, ncol = 3)
data

# 2
Mymat0A <- matrix(c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14), nrow=3, ncol=5, byrow =TRUE)
Mymat0A

Mymat0B <- matrix(c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14), nrow=3, ncol=5, byrow =FALSE) 
Mymat0B


# 3

m6 <- matrix(c(2,3,5,6), nrow = 2, ncol = 2, byrow = FALSE)
m6

m7 <- matrix(c(5,3,8,2), nrow = 2, ncol = 2, byrow = FALSE)
m7

m8 <- matrix(c(2,4,6,2,0,1), nrow = 2, ncol = 3, byrow = FALSE)
m8

m9 <- matrix(c(1,0.5,0.3,
               0.5,1,0.9,
               0.3,0.9,1), nrow = 3, ncol = 3, byrow = TRUE) # usei byrow true porque desenhei a matrix no código
m9


# 4

a <- 3 + 5*8/2^2
b <- (3 + 5) *8/(2^2)
cat("A : ", a, " B: ", b)
# houve diferença por conta das prioridades "(funções dentro de parênteses)"


# 5 / expressao 30 - 6^2 / 2*3

potencia <- 6**2
divisao <- potencia / 2
multiplicacao <- divisao * 3
resultado <- 30 - multiplicacao
resultado # -24
teste <- 30 - 6^2 / 2*3 # -24


# 6

x <- 3
y <- 4
x <- (x + 2) * y # priorizei a soma do x + 2, caso eu não fizesse isso o valor de x seria 11
x # 20

# 7

x <- 6
class(x)
# a classe de x(6) é numeric


# 8

x <- c(2,4,5,6)
y <- c(-3,-2,0,7)
cbind(x,y)

# o comando cbind une os objetos por colunas, criando uma matriz ou dataframe

# 9

vetorA <- c("qW",2,"w",3, TRUE, FALSE)
vetorA
# Os vetores aceitam valores de várias classes, mas transformam tudo em um tipo comum, como nesse
# caso para String
vetorA <- as.numeric(vetorA)
vetorB <- c(1,2,3,4,5,6)
vetorB <- as.character(vetorB)
vetorB


# 10

x <- c(4, 6, 8, 9, 12, 3, 2)

x[x < 9] <- 0

x

# 11

x <- 1:12

matrix(x, nrow = 3)
matrix(x, ncol = 4)
matrix(x, ncol = 4, byrow = TRUE)

# todas essas criam uma matriz com 3 linhas e 4 colunas

# 12

x <- matrix(1:12, ncol = 4)

x[2,3]
x[1,]
x[c(1,3), 3] # pegando os valores da linha 1 e 3, na coluna 3
x[1, c(2,3)] # pegando os valores da linha 1 nas colunas 2 e 3


# 13

time <- c(10,30,35,99,185,204)
status <- c(3,3,2,3,1,1)
sex <- c(1,1,1,0,1,1)
age <- c(76,56,41,71,52,28)
year <- c(1972,1968,1977,1968,1965,1971)
thickness <- c(6.76,0.65,1.34,2.90,12.08,4.84)
ulcer <- c(1,0,0,0,1,1)

dt_frame <- data.frame(time, status, sex, age, year, thickness, ulcer)

dt_frame

dt_frame[3,] = c(NA, NA, NA, NA, NA, NA, NA)

dt_frame$age[1:6]

dt_frame[[4]][1:6]
dt_frame[1:6,4]
dt_frame[["age"]][1:6]

names(dt_frame)



# 14

time <- c(10,30,35,99,185,204)
status <- c(3,3,2,3,1,1)
sex <- c("masculino","masculino","masculino","feminino","feminino","masculino")
age <- c(76,56,41,71,52,28)
year <- c(1972,1968,1977,1968,1965,1971)
thickness <- c(6.76,0.65,1.34,2.90,12.08,4.84)
ulcer <- c(1,0,0,0,1,1)

dt_frame <- data.frame(time, status, sex, age, year, thickness, ulcer)

dt_frame[dt_frame$age <= 50 & dt_frame$sex == "masculino",]
