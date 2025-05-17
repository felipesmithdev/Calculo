pop_sol_ced <- 10000
set.seed(999)
n <- 6048

bom.n <- rbinom(n,1,0.85)
bom.n

table(bom.n)

str(bom.n)

mean(bom.n)

class_pg <- factor(bom.n,
                   levels = c(0,1),
                   labels = c("mau", "bom"),
                   ordered = TRUE
                   )

str(class_pg)

class_pg

summary(class_pg)

table(class_pg)

data.default <- data.frame(class_pg)

data.default

tail(data.default)
head(data.default)

data.default <- data.frame(table(class_pg))
data.default

colnames(data.default)[2] <- "Freq_absoluta"
data.default

data.default <- data.frame(id=1:2, data.default)
data.default


Freq_relativa <- round(data.default$Freq_absoluta/sum(data.default$Freq_absoluta) * 100, 2)

# nao houve a coluna indesejada
data.default

Freq_relativa

Freq_relativa <- data.frame(id=1:2, Freq_relativa)
Freq_relativa

table_padrao <- data.frame(merge(data.default, Freq_relativa))

table_padrao

barplot(table_padrao$Freq_relativa, xlab = "Tipo de Tomador Crédito", ylab = "Frequência_Relativa", col = c("seagreen", "yellowgreen"))

class_pg

prop.table(table(class_pg))


barplot(prop.table(table(class_pg)), xlab = "Tipo de tomador de crédito", ylab = "Frequência Absoluta", col = c("red", "blue"))
