setwd("/Users/scp93/Desktop/AulaR/Aula2/")
library(readr)


# ---------- cap 6.4 ----------
# -- Ex1
# carregando dados do titanic
titanic = read_csv("dados_titanic.csv")
View(titanic)

# boxplot da idade do passageiros
boxplot(titanic$Age)

# boxplot da idade do passageiros por sexo
boxplot(titanic$Age ~ titanic$Sex)

# boxplot da idade do passageiros por classe
boxplot(titanic$Age ~ titanic$Pclass)

# boxplot da idade do passageiros por sobrevivente
boxplot(titanic$Age ~ titanic$Survived)

# boxplot da idade do passageiros por portao de embarque
boxplot(titanic$Age ~ titanic$Embarked)

# -- Ex2
# carregando dados da black friday
BF = read_csv("BlackFriday.csv")
View(BF)

# boxplot do valor comprado (U$)
boxplot(BF$Purchase)

# boxplot do valor comprado (U$) por estado civil
boxplot(BF$Purchase ~ BF$Marital_Status)

# boxplot do valor comprado (U$) por cidade
boxplot(BF$Purchase ~ BF$City_Category)

# boxplot do valor comprado (U$) por faixa etaria
boxplot(BF$Purchase ~ BF$Age)

# boxplot do valor comprado (U$) por sexo
boxplot(BF$Purchase ~ BF$Gender)

# -- Ex3
sampa = read_csv("beerSP.csv")
View(sampa)

# boxplot do consumo de cvja em sampa em 2015
boxplot(sampa$consumo)

# boxplot do consumo de cvja por fds
boxplot(sampa$consumo ~ sampa$fds)

# boxplot do consumo de cvja em dias chuvosos
chuva = as.numeric(sampa$prec>0)
boxplot(sampa$consumo ~ chuva)

# ---------- cap 6.4 ----------
# -- Ex1
# temp media
plot(x = sampa$data, y = sampa$tem_med, type = "l")
# temp min
plot(x = sampa$data, y = sampa$temp_min, type = "l")
# temp max
plot(x = sampa$data, y = sampa$temp_max, type = "l")
# consumo 
plot(x = sampa$data, y = sampa$consumo, type = "l")

# temperaturas geral
# temp media
plot(x = sampa$data, y = sampa$tem_med, ylim = c(5, 40), type = "l")
# add temp media
lines(x = sampa$data, y = sampa$temp_min, type = "l", col=4)
# add temp media
lines(x = sampa$data, y = sampa$temp_max, type = "l", col=2)

# -- Ex2
# carrega pacote de dados
# percentual de engarrafamento medido de 7 as 22hs a cada 30min por 5 dias
transito = read_csv("tansito.csv")
View(transito)

ts.plot(transito$traf)

# ------------ 6.7
# -- Exemplo 6.6
# entrando com os dados
x = c( 183, 220, 192, 185, 190, 176, 192, 205, 210, 201)
hist(x)

# organizando os dados
x.org = sort(x)

# calculando pj=(j-0.5)/n
# tamanho de x
n = length(x)

# ordem de x(j)
j = order(x.org)

# calculando pj
pj = (j - 0.5)/n

# criando grafico
plot(x.org, pj)

# Calculando zj
zj = qnorm(pj)

# criando grafico
plot(zj, x.org)

# outra forma de criar o gráfico
install.packages("car")
car::qqPlot(x)

# -- Ex1 (titanic)
hist(titanic$Age)
car::qqPlot(titanic$Age)

# -- Ex2(BF)
hist(BF$Purchase)
x = sample(BF$Purchase, 0.1*length(BF$Purchase))
hist(x)
car::qqPlot(x)

# -- Ex3(Sampa)
# consumo de bebida
hist(sampa$consumo)
car::qqPlot(sampa$consumo)

# temp media
hist(sampa$tem_med)
car::qqPlot(sampa$tem_med)

# temp min
hist(sampa$temp_min)
car::qqPlot(sampa$temp_min)

# temp max
hist(sampa$temp_max)
car::qqPlot(sampa$temp_max)

# -- Ex4 (tansito)
hist(transito$traf)
car::qqPlot(transito$traf)
