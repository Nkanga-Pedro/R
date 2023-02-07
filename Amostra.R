# Amostra com exemplo de IRIS
dim(iris)
amostra=sample(c(0,1),150,replace = T,prob = c(0.5,0.5))
amostra
# tamanho de cada lado
length(amostra[amostra==1])
length(amostra[amostra==0])
# Repetir a mesma amostra
set.seed(2345)
sample(c(100),1)

# Amostra especificada
summary(iris)
View(iris)
# baixar sampling
# centralidade e variabilidade
jogadores=c(200,350,239,450,600,750)
mean(jogadores)
median(jogadores)
summary(jogadores)
valor<-quantile(jogadores)
valor[2]






