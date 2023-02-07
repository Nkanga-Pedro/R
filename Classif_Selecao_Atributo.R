credito=read.csv(file.choose(),sep = ',',header = T)
head(credito)
dim(credito)
View(credito)
# construir um modelo por selecao de atributo
# Gerir amostra para 1:70% e 0:30%
amostra=sample(2,14,replace = T,prob = c(0.7,0.3))
# Treinar com os dados e teste
credito_treinar=credito[amostra==1,]
credito_teste=credito[amostra==2,]
dim(credito_teste)
dim(credito_treinar)
# Criar um modelo (Selecao de atributo)
modelo1=c(CreditHist ~ .,credito_treinar)
# predir
predicao1=predict(modelo1,credito_teste)
# comprar a predicao com valor reais
confusao=table(credito_teste$CreditHist,predicao)
# medir a taxe de acerto e erro na predicao
taxaacerto=(confusao[1]+confusao[4])/sum(confusao)
taxaerro=(confusao[2]+confusao[3])/sum(confusao)

# Selecionar atributo relevante com a biblioteca :FSelector
randomForest::importance(class ~.,credit0)
# selecionar atributo de maior relevancia
# Criar um modelo (Selecao de atributo)
modelo=svm(class ~ A1+A2+A3+A4+An,data = credito_treinar)
# predir
predicao=predict(modelo,credito_teste)
# comprar a predicao com valor reais
confusao=table(credito_teste$class,predicao)
# medir a taxe de acerto e erro na predicao
taxaacerto=(confusao[1]+confusao[4])/sum(confusao)
taxaerro=(confusao[2]+confusao[3])/sum(confusao)
