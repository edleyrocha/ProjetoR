
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
deputados <- read_delim("D:/GIT/ProjetoR/R/deputados/dados/deputados.csv",";", escape_double = FALSE, trim_ws = TRUE);
View(deputados);

# Lista Estados
unique(deputados$sgUF);
# Lista Partidos
unique(deputados$sgPartido);
# Lista Deputados
unique(deputados$txNomeParlamentar);


