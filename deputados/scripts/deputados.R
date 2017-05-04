
# 1 - Definindo diretório de trabalho -----------------------------------------

#GET Diretorio para Atual (LOCAL)
getwd();

#SET Diretorio para Novo com Base de Dados
setwd("D:/GIT/ProjetoR/R/deputados");


###Modo 1 (outros)
# getwd();
# dirAtual <- getwd();
# setwd(dirAtual);

###Modo 2 (Outros)
# dirAtual <- ("D:/GIT/ProjetoR/R/deputados");
# setwd(dirAtual);
  
  
  
# 2 - Importar Base de Dados DEPUTADOS ----------------------------------------

library(readr);
deputados <- read_delim("D:/GIT/deputados.csv",";", escape_double = FALSE, trim_ws = TRUE);
View(deputados);


library(readr)
deputados <- read_delim("D:/GIT/deputados.csv", ";", escape_double = FALSE, trim_ws = TRUE)
View(deputados)

library(readr)
deputados <- read_csv("D:/GIT/deputados.csv")
View(deputados)



# Lista Estados
unique(deputados$sgUF)
# Lista Partidos
unique(deputados$sgPartido)
# Lista Deputados
unique(deputados$txNomeParlamentar)
unique(deputados$txNomeParlamentar, deputados$sgPartido)
# correcao das casa decimais
deputados$vlrLiquido <-  sub(",",".",deputados$vlrLiquido)
deputados$vlrLiquido <- as.double(deputados$vlrLiquido)
#view valores
deputados$vlrLiquido
#LISTA tipo de dados
is(deputados$vlrLiquido)
deputados$vlrLiquido
max(deputados$vlrLiquido)
min(deputados$vlrLiquido)




