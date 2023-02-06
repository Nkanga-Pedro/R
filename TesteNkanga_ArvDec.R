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
# construir um modelo Arvore de Decisao
# Gerir amostra para 1:70% e 0:30%
amostra=sample(2,14,replace = T,prob = c(0.7,0.3))
# Treinar com os dados e teste
dados_treinar=dados[amostra==1,]
dados_teste=dados[amostra==2,]
dim(dados_teste)
dim(dados_treinar)
# Criar um modelo de Arvore de Decisao
library(rpart)
MAD=rpart(formula =dados$jogar ~dados$aparencia+dados$temperatura+dados$unidade+dados$ventoso,data=dados_treinar)
# Apresentar dados em arvore
print(MAD)
# Apresentar com ligacao sem dados
library(plotly)
# Apresentacao com ligacao e dados
text(MAD,user.n=T,all=T,cex=.8)
# Previsao
Teste=predict(MAD,newdata=dados_teste)
View(Teste)
plot(Teste)
# Mostrar a previsao
Jo=cbind(dados,Teste)
fix(Jo)
# atribuindo uma coluna do resultado
Jo['Resultado']=ifelse(Jo$sim>=0.5,'sim','nao')
fix(Jo)
confusao=table(Jo$jogar,Jo$Resultado)
# medir a taxe de acerto e erro na predicao
taxaacerto=(confusao[1]+confusao[4])/sum(confusao)
taxaerro=(confusao[2]+confusao[3])/sum(confusao)

# Assimular um cliente para predir
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