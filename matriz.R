# Matriz
# criar uma matriz apartir do vetor
produto<-c('desktop','gamer','rato','teclado','tv','monitor','cadeira')
quantidade<-c(20,10,38,12,14,35,70)
matrizC<-cbind(produto,quantidade)
matrizR<-rbind(produto,quantidade)

# Matriz
matrix(1:20,nrow = 4,ncol = 5)
matriz<-matrix(1:20,nrow = 4,ncol = 5,byrow = T)
dim(matriz)
nrow(matriz)
ncol(matriz)
# acessar a matriz
valor<-as.numeric(matrizC[,2])
sum(valor[1:5])
mean(valor)
valor/2
# curiosidade
x<-matrix(1:40,nrow=3,ncol=5)
image(x)
persp(x)
contour(x)











