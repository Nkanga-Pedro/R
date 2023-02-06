aparencia<-c('ensolado','ensolado','nublado','chuvoso','chuvoso','chuvoso','nublado','ensolarado','ensolarado','chuvoso','ensolarado','nublado','nublado','chuvoso')
temperatura<-c('quente','quente','quente','amena','frio','frio','frio','amena','frio','amena','amena','amena','quente','amena')
unidade<-c('alta','alta','alta','alta','normal','normal','normal','alta','normal','normal','normal','alta','normal','alta')
ventoso<-c('falso','verdadeiro','falso','falso','falso','verdadeiro','verdadeiro','falso','falso','falso','verdadeiro','verdadeiro','falso','verdadeiro')
jogar<-c('nao','nao','sim','sim','sim','nao','sim','nao','sim','sim','sim','sim','sim','nao')

resumo=cbind(aparencia,temperatura,unidade,ventoso,jogar)
dados<-as.data.frame(resumo)
data.frame(resumo)
dados$temperatura[2]
dados[[2]]
View(dados)
length(dados)
summary(dados)
head(dados)
dim(dados)

amostra=sample(2,14,replace = T,prob = c(0.7,0.3))
dados_treinar=dados[amostra==1,]
dados_teste=dados[amostra==2,]
dim(dados_teste)
dim(dados_treinar)

library(e1071)
modelo=naiveBayes(jogar ~ .,dados_treinar)
predicao=predict(modelo,dados_teste)

confusao=table(dados_teste$jogar,predicao)

taxaacerto=(confusao[1]+confusao[4])/sum(confusao)
taxaerro=(confusao[2]+confusao[3])/sum(confusao)

aparenciaT<-c('ensolado')
temperaturaT<-c('amena')
unidadeT<-c('alta')
ventosoT<-c('falso')
jogarT<-c('nao')
novo_dados=c(aparenciaT,temperaturaT,unidadeT,ventosoT,jogarT)
dadosT<-as.data.frame(novo_dados)
data.frame(dadosT)

head(dadosT)
dim(dadosT)
predict(modelo,dadosT)
