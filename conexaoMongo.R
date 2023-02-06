install.packages('mongolite')
library(mongolite)

conexao=mongo(collection='posts',db='dbmidia',url='mongodb://localhost')
dados=conexao$find()
class(dados)
dados=conexao$find('{"nome":"nkanga"}')