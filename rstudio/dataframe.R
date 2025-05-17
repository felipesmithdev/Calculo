# primeiro dataframe

dataframe01 <- data.frame(
  Nome = c("Bob", "Tom", "Mel"),
  Idade = c(10, 20, 30),
  Altura = c(1.4, 1.6, 1.8)
)

dataframe01
dataframe01$Nome
dataframe01$Idade <- dataframe01$Idade + 10
# sprintf("%s")
dataframe01[1,]
class(dataframe01)

print("Informe sua idade")
idade <- scan()
idade

nomeDigitado <- readline()
nomeDigitado

pedirNome <- function(){
  print("Informe sua idade")
  idade <- scan()
  idade
}
pedirNome()

dataframe01[2:3]

dataframe01$QtdPets <- 10
dataframe01
