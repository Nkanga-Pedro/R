fornecedor<-c('asus','hp','lenovo','dell','microsoft','apple')
quantidade<-c(30,67,12,90,46,23)
venda_jan<-c(2,4,6,7,3,4)
venda_fev<-c(12,8,6,34,12,12)
venda_mar<-c(10,10,11,13,14,11)

balanco<-list(fornecedor,quantidade,venda_jan,venda_fev,venda_mar)
unlist(balanco)

resumo<-cbind(fornecedor,quantidade,venda_jan,venda_fev,venda_mar)

dados<-as.data.frame(resumo)
data.frame(resumo)
dados$fornecedor[1]
dados[[2]]
View(dados)
length(resumo)
summary(resumo)
name(resumo)
str(resumo)
media<-as.numeric(dados[[2]])
mean(media)
median(media)
