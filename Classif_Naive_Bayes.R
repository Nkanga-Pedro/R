credito=read.csv(file.choose(),sep = ',',header = T)
head(credito)
dim(credito)
View(credito)
# construir um modelo Naive
# Gerir amostra para 1:70% e 0:30%
amostra=sample(2,14,replace = T,prob = c(0.7,0.3))
# Treinar com os dados e teste
credito_treinar=credito[amostra==1,]
credito_teste=credito[amostra==2,]
dim(credito_teste)
dim(credito_treinar)
# Criar um modelo (Naive-Bayes)
modelo=naiveBayes(CreditHist ~ .,credito_treinar)
# predir
predicao=predict(modelo,credito_teste)
# comprar a predicao com valor reais
confusao=table(credito_teste$CreditHist,predicao)
# medir a taxe de acerto e erro na predicao
taxaacerto=(confusao[1]+confusao[4])/sum(confusao)
taxaerro=(confusao[2]+confusao[3])/sum(confusao)

# Assimular um cliente para predir
novocredito=read.csv(file.choose(),sep = ',',header = T)
head(novocredito)
dim(novocredito)
predict(modelo,novocredito)

