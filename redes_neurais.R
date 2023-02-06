# criar um clone de iris
myiris=iris
myiris=cbind(myiris,myiris$Species=='setosa')
head(myiris)
tail(myiris)
myiris=cbind(myiris,myiris$Species=='virginica')
# mudar o nome
names(myiris)[6]='setosa'
names(myiris)[7]='versicolor'
names(myiris)[5]='virginica'
summary(myiris)
# divir conj. em tste
amostra=sample(2,150,replace = T,prob = c(0.7,0.3))
myiristreino=myiris[amostra==1,]
myiristeste=myiris[amostra==2,]
# verificar
dim(myiristreino)
dim(myiristeste)
# criar modelo
modelo=neuralnet(setosa+versicolor+virginica~Sepal.Length+Petal.Length,myiristreino,hidden = c(5,4))
print(modelo)
plot(modelo)