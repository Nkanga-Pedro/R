# Loop For

fornecedor<-c('asus','hp','lenovo','dell','microsoft','apple')
quantidade<-c(30,67,12,90,46,23)
venda_jan<-c(2,4,6,7,3,4)
venda_fev<-c(12,8,6,34,12,12)
venda_mar<-c(10,10,11,13,14,11)

balanco<-list(fornecedor,quantidade,venda_jan,venda_fev,venda_mar)
unlist(balanco)

resumo<-cbind(fornecedor,quantidade,venda_jan,venda_fev,venda_mar)

dados<-as.data.frame(resumo)
valor<-data.frame(resumo)

dados[1]

i<-1
for(i in 1:nrow(dados)){
  cat('A empresa',dados$fornecedor[i],' possui',dados$quantidade[i],' de maquinas','\n')
}
i<-1
while(i<nrow(dados)){
  cat('A empresa',dados$fornecedor[i],' possui',dados$quantidade[i],' de maquinas','\n')
  i<-i+1
}

if(i<=1){
  print('teste positivo')
}
if(i>1){
  print('teste negativo')
}

i<-1
while(i<=5){
  print('Entrar o valor')
  valor<-scan()
  i<-i+1
}



