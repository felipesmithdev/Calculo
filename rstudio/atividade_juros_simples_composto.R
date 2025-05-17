library(ggplot2)
library(plyr)


principal <- 1200

juros_simples <- function(principal) {
  
  meses <- 0
  taxa <- 0
  
  while (meses < 1 | meses > 12) {
    cat("Informe o número de parcelas: ")
    meses <- as.numeric(readline())
  }
  
  if(meses >= 1 & meses <= 3){
    taxa <- 0.01
  } else if(meses >= 4 & meses <= 6){
    taxa <- 0.02
  } else {
    taxa <- 0.03
  }
  
  montante <- principal * (1 + taxa * meses)
  valor_parcela <- montante / meses
  juros_pago <- montante - principal
  
  cat("Valor total a pagar: R$", round(montante, 2), "\n")
  cat("Valor de cada parcela: R$", round(valor_parcela, 2), "\n")
  cat("Total pago a mais: R$", round(juros_pago, 2), "\n")
  
  tempo <- 1:meses
  valores <- rep(valor_parcela, meses)
  valor_acumulado <- cumsum(valores)
  
  tabela <- data.frame(
    mes = tempo,
    valorAcumulado = round(valor_acumulado, 2),
    parcelaMes = round(valores, 2)
  )
  
  print(tabela)
  
  # grafico
  ggplot(tabela, aes(x = mes, y = valorAcumulado)) +
    geom_line(color = 'blue', linewidth = 1.7) +
    labs(title = 'Evolução',
         x = 'mes',
         y = 'valor acumulado') +
    theme_minimal()
}
 
juros_simples(principal)


# SEGUNDA PARTE 

calcula_juros_simples <- function(capital, taxa, tempo){
  montante <- capital * (1 + taxa * tempo)
  return(montante)
}

# a fim de teste
calcula_juros_simples(1200, 0.1, 2)

calcula_juros_composto <- function(capital, taxa, tempo){
  montante <- capital * (1 + taxa) ** tempo
  return(montante)
}

# testando
calcula_juros_composto(1200, 0.1, 2)




# SIMULAR E COMPARAR CENARIOS

simular_comparar_cenarios <- function(principal){
  
  cat("Informe os dados do primeiro cenário: ", "\n")
  parcelas1 <- as.numeric(readline(prompt = "Número de parcelas: "))
  taxa1 <- as.numeric(readline(prompt = "Informe a taxa: "))
  
  cat("\nInforme os dados do segundo cenário:", "\n")
  parcelas2 <- as.numeric(readline(prompt = "Número de parcelas: "))
  taxa2 <- as.numeric(readline(prompt = "Informe a taxa: "))
  
  cat("Deseja comparar juros simples ou composto ?")
  escolha <- as.numeric(readline(prompt = "Digite 1 para simples ou 2 para composto: "))
  
  if(escolha == 1){
    montante1 <- calcula_juros_simples(principal, taxa1, parcelas1)
    montante2 <- calcula_juros_simples(principal, taxa2, parcelas2)
  } else if(escolha == 2){
    montante1 <- calcula_juros_composto(principal, taxa1, parcelas1)
    montante2 <- calcula_juros_composto(principal, taxa2, parcelas2)
  }
  
  valor_parcela1 <- montante1 / parcelas1
  valor_parcela2 <- montante2 / parcelas2
  
  juros1 <- montante1 - principal
  juros2 <- montante2 - principal
  
  
  tabela1 <- data.frame(
    mes = 1:parcelas1,
    parcela = round(rep(valor_parcela1, parcelas1), 2),
    acumulado = round(cumsum(rep(valor_parcela1, parcelas1)), 2)
  )
  
  tabela2 <- data.frame(
    mes = 1:parcelas2,
    parcela = round(rep(valor_parcela2, parcelas2), 2),
    acumulado = round(cumsum(rep(valor_parcela2, parcelas2)), 2)
  )
  
  # salvando em csv
  nome1 <- readline(prompt = "Nome do primeiro csv: ")
  nome2 <- readline(prompt = "Nome do segundo csv: ")
  
  # paste0 é para concatenar o nome com o .csv
  write.csv(tabela1, paste0(nome1, ".csv"), row.names = FALSE)
  write.csv(tabela2, paste0(nome2, ".csv"), row.names = FALSE)
  
  cat("csv salvo com sucesso", "\n")
  
  # exibir o comparativo
  comparacao <- data.frame(
    cenario = c("Cenario1", "Cenario2"),
    parcelas = c(parcelas1, parcelas2),
    taxa = c(taxa1, taxa2),
    montante = round(c(montante1, montante2), 2),
    juros = round(c(juros1, juros2), 2)
  )
  
  print(comparacao)
  
  df1 <- data.frame(
    mes = 1:parcelas1,
    acumulado = cumsum(rep(valor_parcela1, parcelas1)),
    cenario = "Cenario1"
  )
  
  df2 <- data.frame(
    mes = 1:parcelas2,
    acumulado = cumsum(rep(valor_parcela2, parcelas2)),
    cenario = "Cenario2"
  )
  
  df_plot <- rbind(df1, df2)
  
  ggplot(df_plot, aes(x = mes, y = acumulado, color = cenario)) +
    geom_line(linewidth = 1.5) +
    labs(title = "Comparativo",
         x = "mes",
         y = "valor acumulado") +
    theme_minimal()
}

# testando a simulaçao
simular_comparar_cenarios(1200)
getwd()



