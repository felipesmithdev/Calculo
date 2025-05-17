# Cálculo de médias: calcular a média de uso de CPU, RAM, e Disco ao longo de todas as capturas.
mensagem <- sprintf(
  "
Média de uso do disco: %f GB
  \nMédia do percentual do disco: %.2f %%
  \nMédia do percentual da CPU: %.2f %%
  \nMédia da frequência da CPU: %.0f MHz
  \nMédia de uso da memória RAM: %.0f MB
  \nMédia do percentual da memória RAM: %.2f %%
  \nMédia do percentual da bateria: %.2f %%
  \nMédia da velocidade de download da internet: %.1f Mbps
  ",
  mean(integracao$discoUso / 1024**3),
  mean(integracao$porcentagemDisco),
  mean(integracao$porcentagemCpu),
  mean(integracao$frequenciaCpu),
  mean(integracao$ramUso / 1024**2),
  mean(integracao$porcentagemRam),
  mean(integracao$porcentagemBateria),
  mean(integracao$velocidadeInternet / 1024**2)
)

cat(mensagem)

# Soma total de recursos utilizados: somar o uso total de CPU, RAM e Disco para entender a utilização global do sistema ao longo do período de captura.

soma <- sprintf("
Soma de uso da CPU: %.2f %%
                \nSoma de uso da RAM: %.0f MB
                \nSoma de uso do Disco: %.0f GB",
                sum(integracao$porcentagemCpu),
                sum(integracao$ramUso) / 1024 ** 2,
                sum(integracao$discoUso) / 1024 ** 3)
cat(soma)

# Comparação de desempenho entre CPUs de maquinas
set.seed(123)
df_aleatorio <- integracao[sample(nrow(integracao)), ]

maquina1 <- df_aleatorio[1:1000,]
maquina2 <- df_aleatorio[1001:2000,]

plot(maquina1$porcentagemCpu[1:100],
     main="Comparação de desempenho entre CPU's",
     ylab="Uso",
     xlab="Leitura",
     col="red",
     lwd=2,
     type="l")

lines(maquina2$porcentagemCpu[1:100],
      col="blue",
      lwd=2,
      type="l")

legend("topright", 
       legend=c("Máquina 1", "Máquina 2"),
       col=c("red", "blue"), lty=1)

# Distribuição dos dados: obter a distribuição de CPU, RAM, e Disco para identificar como os recursos são distribuídos durante o período de captura.
hist(integracao$porcentagemCpu,
     main="Distribuição de dados CPU",
     xlab="Uso",
     ylab="Leituras",
     col="red",
     border=FALSE)

hist(integracao$porcentagemRam,
     main="Distribuição de dados RAM",
     xlab="Uso",
     ylab="Leituras",
     col="blue",
     border=FALSE)

hist(integracao$porcentagemDisco,
     main="Distribuição de dados Disco",
     xlab="Uso",
     ylab="Leituras",
     col="green",
     border=FALSE)

# Gráficos simples: gerar gráficos de barras ou de linha para visualizar o uso médio de CPU, RAM e Disco ao longo do tempo.
# Ao longo do tempo
plot(integracao$porcentagemCpu,
     type="l",
     main="Uso médio da CPU",
     xlab="X",
     ylab="Y",
     col="blue",
     lwd=2)

plot(integracao$porcentagemRam,
     type="l",
     main="Uso médio da RAM",
     xlab="X",
     ylab="Y",
     col="red",
     lwd=2)

plot(integracao$porcentagemDisco,
     type="l",
     main="Uso médio do Disco",
     xlab="X",
     ylab="Y",
     col="green",
     lwd=2)

# Simplificado para melhor visualização
cpuSample <- sample(integracao$porcentagemCpu, 100)
plot(cpuSample,
     type="l",
     main="Uso da CPU",
     xlab="Leituras",
     ylab="Uso da CPU",
     col="blue",
     )

legend("topright",
       legend="Uso da CPU",
       col="blue",
       lwd=2,
       cex=0.45)

ramSample <- sample(integracao$porcentagemRam, 100)
plot(ramSample,
     type="l",
     main="Uso da Ram",
     xlab="Leituras",
     ylab="Uso da Ram",
     col="red",
     lwd=2
)

legend("topright",
       legend="Uso da Ram",
       col="red",
       lwd=2,
       cex=0.45)

discoSample <- sample(integracao$porcentagemDisco, 100)
plot(discoSample,
     type="l",
     main="Uso do Disco",
     xlab="Leituras",
     ylab="Uso do Disco",
     col="green",
     lwd=2
)

legend("topright",
       legend="Uso do Disco",
       col="green",
       lwd=2,
       cex=0.45)

# Análise de picos: identificar os picos de uso de CPU, RAM e Disco, ou seja, quando esses recursos atingem os maiores valores em cada máquina.
max(integracao$porcentagemCpu)
max(integracao$porcentagemRam)
max(integracao$porcentagemDisco)

# Pico da CPU
plot(integracao$porcentagemCpu,
     type="l",
     main="Pico de uso da CPU",
     xlab="Leituras",
     ylab="Uso da CPU",
     col="black")

picos_cpu <- which(integracao$porcentagemCpu >= max(integracao$porcentagemCpu))

points(picos_cpu,
       integracao$porcentagemCpu[picos_cpu],
       col="red",
       pch=16)

legend("topright",
       legend="Pico de Uso",
       col="red",
       pch=16,
       cex=0.8)

# Pico da RAM
plot(integracao$porcentagemRam,
     type="l",
     main="Pico de uso da RAM",
     xlab="Leituras",
     ylab="Uso da RAM",
     col="black")

picos_ram <- which(integracao$porcentagemRam >= max(integracao$porcentagemRam))

points(picos_ram,
       integracao$porcentagemRam[picos_ram],
       col="red",
       pch=16)

legend("topleft",
       legend="Pico de Uso",
       col="red",
       pch=16,
       cex=0.8)

# Pico do Disco
plot(integracao$porcentagemDisco,
     type="l",
     main="Pico de uso do Disco",
     xlab="Leituras",
     ylab="Uso do Disco",
     col="black")

picos_disco <- which(integracao$porcentagemDisco >= max(integracao$porcentagemDisco))

points(picos_disco,
       integracao$porcentagemDisco[picos_disco],
       col="red",
       pch=16)

legend("topright",
       legend="Pico de Uso",
       col="red",
       pch=16,
       cex=0.8)

# Comparação de uso entre diferentes períodos: comparar o uso de recursos em diferentes períodos do dia, por exemplo, comparando o uso de CPU pela manhã e à tarde, se os dados tiverem timestamp adequado.
set.seed(123)
df_aleatorio <- integracao[sample(nrow(integracao)), ]

manha <- df_aleatorio[1:100,]
tarde <- df_aleatorio[101:200,]
noite <- df_aleatorio[201:300,]
madrugada <- df_aleatorio[301:400,]

plot(manha$porcentagemCpu,
     type="l",
     col="red",
     lwd=2,
     main="Uso da CPU ao longo do dia",
     xlab="Leituras",
     ylab="Uso da CPU",
     ylim=c(min(manha$porcentagemCpu,
                tarde$porcentagemCpu,
                noite$porcentagemCpu,
                madrugada$porcentagemCpu),
            max(manha$porcentagemCpu,
                tarde$porcentagemCpu,
                noite$porcentagemCpu,
                madrugada$porcentagemCpu)))

lines(tarde$porcentagemCpu,
      col="blue",
      lwd=2)

lines(noite$porcentagemCpu,
      col="green",
      lwd=2)

lines(madrugada$porcentagemCpu,
      col="orange",
      lwd=2)

legend("topright",
       cex=0.5,
       legend=c("Manhã", "Tarde", "Noite", "Madrugada"),
       col=c("red", "blue", "green", "orange"), lty=1)