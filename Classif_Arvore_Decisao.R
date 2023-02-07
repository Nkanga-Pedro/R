credito=read.csv(file.choose(),sep = ',',header = T)
head(credito)
dim(credito)
View(credito)
# construir um modelo Arvore de Decisao
# Gerir amostra para 1:70% e 0:30%
amostra=sample(2,14,replace = T,prob = c(0.7,0.3))
# Treinar com os dados e teste
credito_treinar=credito[amostra==1,]
credito_teste=credito[amostra==2,]
dim(credito_teste)
dim(credito_treinar)
# Criar um modelo de Arvore de Decisao
#arvore=rpart(CreditHist ~ .,credito_treinar,method = 'CreditHist')
x=rpart(CreditHist ~.,credito_treinar)
# Apresentar dados em arvore
print(x)
# Apresentar com ligacao sem dados
plot(x)
# Apresentacao com ligacao e dados
text(x,user.n=T,all=T,cex=.8)
# Previsao
teste=predict(x,newdata=credito_teste)
# Mostrar a previsao
cred=cbind(credito_teste,teste)
fix(cred)
# atribuindo uma coluna do resultado
cred['Resultado']=ifelse(cred$bad>=0.5,'bad','good')
fix(cred)
confusao=table(cred$CreditHist,cred$Resultado)
# medir a taxe de acerto e erro na predicao
taxaacerto=(confusao[1]+confusao[4])/sum(confusao)
taxaerro=(confusao[2]+confusao[3])/sum(confusao)

# Assimular um cliente para predir
novocredito=read.csv(file.choose(),sep = ',',header = T)
head(novocredito)
dim(novocredito)
predict(modelo,novocredito)

