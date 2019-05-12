setwd("/Users/scp93/Desktop/AulaR/Aula1/")

# ----------  Cap 6.1 ---------- 
# --criar um vetor
x = c(4, 5, 9, 1, 9, 2, 10, 4, 6, 1, 6)

# -- tamanho do vetor
n = length(x)

# --calcula a media
sum(x)/n

# funcao
mean(x)


# --calcula variancia
xbar = mean(x)
y = (x-xbar)^2
sum(y)/(n-1)

# funcao
var(x)

# -- calcula a amplitude
max(x)-min(x)

# funcao
range(x)
diff(range(x))

# -- Exemplo - Titanic
dados = read.csv("dados_titanic.csv", sep = ",")
View(dados)

# media da idade 
mean(dados$Age)

# variancia da idade
var(dados$Age)

# amplitude da idade
range(dados$Age)
diff(range(dados$Age))

# resumo
summary(dados$Age)

#  ---------- Cap 6.2  ---------- 
# -- diagrama de ramo e folhas
set.seed(1)
x = rbinom(40, 120, 0.5)

stem(x)

# -- exemplo titanic
stem(dados$Age[1:50])


#  ---------- Cap 6.3  ---------- 
# -- Distribuicao de frequencia

# dados
set.seed(1)
x = 1:10

# tamanho da amostra
n = length(x)

# numero de classe
k = floor(sqrt(n))

# criacao dos intervalos de classe
classe = seq(from= min(x), to = max(x)+.1, length.out = k+1)

# cria tabela de frequencia
cortes = cut(x, breaks = classe, right = F)
table(cortes)

# -- Exemplo 
n = length(dados$Age)

k = floor(sqrt(n))

classe = seq(from= min(dados$Age), to = max(dados$Age)+.1, length.out = k+1)

cortes = cut(dados$Age, breaks = classe, right = F)
# frequencia absoluta
cbind(table(cortes))

# frequencia relativa
cbind(table(cortes))/n

# -- Histograma

# histograma para frequencia
hist(x)

# histograma para frequencia relativa
hist(x, probability = T)

# Exemplo
hist(dados$Age)
hist(dados$Age, probability = T)

