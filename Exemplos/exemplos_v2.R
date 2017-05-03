
# Comandos Básicos - Ajuda ------------------------------------------------

help.start() #- Inicia a página de ajuda no navegador.
help(plot)
?plot
help("[[")
help("if")
help("for")
example(plot)


# Comandos básicos - objetos ----------------------------------------------

x <-2
y <-3
is(x)
is(y)
objects()
rm(x,y)
objects()


# Manipulações Simples - números ------------------------------------------

x <-2
y <-5
z <- 2.5
w <- TRUE
2 -> b

assign("k", 10)

j <- x + y
h <- 2.5 + 3.5
l <- y - x
p <- 2^3


# Manipulações Simples - Vetores ------------------------------------------

x <- c(10.4, 5, 3, 7.5)
rm(x)
assign("x", c(10.4, 5, 3, 7.5))
y <- c(x, -1, x)
z <- c(x, x)

v <- 2*x + z + 1

sum((x-mean(x))^2)/(length(x)-1)
var(x)


# Manipulações Simples - Vetores - Gerando Sequências ---------------------

2*1:15  #sequência de número pares de  2 a 30.
s4 <- seq(length=5, from=-5, by=.2) #=> -5.0 -4.8 -4.6 -4.4 -4.2
rep(1:4, 2) # 1,2,3,4,1,2,3,4
h <- 0:9


# Manipulações Simples - Vetores lógicos ----------------------------------

temp <- x >10
10 != 11
10 != 11 & 10 == 9 #<=>??? 10 != 11 && 10 == 9 
10 != 11 | 10 == 9 # <=> 10 != 11 || 10 == 9
10 != !10 & 10 == 10
x <- c(TRUE,FALSE,TRUE,FALSE)
y <- c(TRUE,TRUE,FALSE, FALSE)
x | y #=> TRUE TRUE TRUE FALSE
x || y #=> TRUE
x & y #=> TRUE FALSE FALSE FALSE
x && y  #=> TRUE

# Manipulações Simples - Vetores - Valores ausentes -----------------------

z <- c(NA,1:5,NA)
missvalue <- is.na(z)

# Manipulações Simples - Vetores de Caracteres ----------------------------

alimentos <- c("frutas","legumes","verduras")
alimentos <- c('frutas','legumes','verduras')
alimentos <- c("frutas","\n\tlegumes","\n\t\t\tverduras")
cat(alimentos)
?Quotes # - apresenta a lista completa.
labs <- paste(c("X","Y"), 1:10, sep="")


# Manipulações Simples - Vetores - índices --------------------------------

x <- c(NA, 1:3,NA)
y <- x[!is.na(x)] #- retorna o subconjunto de valores válidos.
x <- c(1:20)
x
x[6]
x[1:10]
y <- x[-(1:5)]
y


frutas <- c(5, 10, 1, 20)
names(frutas) <- c("laranja", "banana", "maça", "pera")
lanche <- frutas[c("maça","laranja")] 
sum(lanche)

# Manipulações Simples - Vetores - Substituições --------------------------

x <- c(NA, 1:3,NA)
x[is.na(x)] <- 0

y <- c(1,-2,3,-4,5,-6)
y[y < 0] <- -y[y < 0]
y <- c(1,-2,3,-4,5,-6)
y <- abs(y)


# Arrays e Matrizes -------------------------------------------------------

z <- c(1:30)
dim(z) <- c(3,5, 2)
z
z[1,1,1]
z[,1,1]
z[1,,]
dim(z)

x <- array(1:20, dim=c(4,5))
x
i <- array(c(1:3,3:1), dim=c(3,2))
i
x[i] #=> utiliza os valores das linhas de i como índices para x.
x[i] <- -1 #=> substitui os valores.
x[-2,1] #=> todos os elementos da coluna 1 menos os da linha 2.
x[-2,-2] #=> subconjunto sem a linha 2 e coluna 2.
h <- c(1,2,3,4,5,6,7,8,9,10,11,12)
y <- array(h, dim=c(2,3,2))
z <- array(h, dim=c(3,4,2))
z <- h ; dim(z) = c(2,3,2)
w <- array(0, c(3,4,2))

#Para operações aritméticas os operando precisam ter a mesma dimensão.

A <- array(1, dim = c(3,2,2))
B <- array(2, dim = c(3,2,2))
C <- array(3, dim = c(3,2,2))
D <- 2*A*B + C + 1
dim(D)


# Arrays e Matrizes - Produto e funções com Arrays ------------------------

B*C #<=>??? outer(B, C, "*")
f <- function(x, y) cos(y)/(1 + x^2)
f
outer(A, B, f)


# Arrays e Matrizes - Permutando Array ------------------------------------

A <- array(1:12, dim = c(3,2,2))
B <- aperm(A, c(2, 1,3)) #- indicar a nova ordem das dimensões
dim(A)
dim(B)

A <- array(1:6, dim = c(3,2))
B <- aperm(A, c(2,1)) # <=> t(A)

m <- matrix(c(1,2,3,4,5,6,7,8), nrow = 2, ncol = 4, byrow = FALSE, dimnames = NULL)
m <- matrix(c(1,2,3,4,5,6,7,8), nrow = 2, ncol = 4, byrow = TRUE, dimnames = NULL)
m <- NULL
m <- cbind(m, c(5,4,6,8,9,10)) #adicionar coluna
m <- NULL
m <- rbind(m, c(5,4,6,8,9,10)) #acicionar linha


mdados <- matrix(c(1,2,3, 4,5,6), nrow = 2, ncol = 3, byrow = TRUE, dimnames = list(c("L1", "L2"), c("C1", "C2", "C3")))
mdados["L1",]
mdados[,"C2"]

A <- array(1:6, dim = c(3,2))
t(A)
nrow(A)
ncol(A)

# Matrizes Multiplicação de matrizes --------------------------------------

A <- array(1:6, dim = c(3,2))
B <- array(6:1, dim = c(3,2))
A*B #=> multiplicação de elemento por elemento.
B <- array(6:1, dim = c(2,3))
A %*% B #=> retorna o produto de duas matrizes

# Matrizes - Equações Lineares e inversões --------------------------------

A <- array(1:4, dim = c(2,2))
b <- array(1:2, dim = c(2,1))
solve(A,b)
solve(A) # A^-1

# Matrizes - Outras funções -----------------------------------------------

eigen(A) # calcula os autovalores e autovetores da matriz.
det(A) # calcula o determinante da matriz.
cbind(A, c(0,0))
rbind(A, c(0,0,1))
is(A)
vetor <- as.vector(A)
is(vetor)

# Matrizes - Fatores e Tabelas de frequências -----------------------------

fat <- factor(A) # retorna a lista de valores da matriz.
levels(fat) #mostra os diferentes valores.
table(A) #retorna a frequência dos valores.
curso <- matrix(c("cc","si","cc","si","espweb","espbd"), nrow = 2, ncol = 3, byrow = TRUE)
notas <- matrix(c(7,7,6,6,7.5,8.0), nrow = 2, ncol = 3, byrow = TRUE)
fat <- factor(curso)
fat
levels(factor(curso))
table(curso) 
tapply(notas, fat, mean)  # calcula o valor da função por fator.

stderr <- function(x) sqrt(var(x)/length(x))
tapply(notas, fat, stderr)
table(notas,fat) # tabulação cruzada


# Listas ------------------------------------------------------------------

lista <- list(nome = "Raul", trabalho = "UFMT", instituto = "IC", tempo = 8, disciplinas = c("ACI", "AC", "SO"))
lista
lista$nome
lista$disciplinas
lista$disciplinas[1]
lista[[2]]
lista[[5]][2]
length(lista) # retorna o número de elementos no nível mais alto.
x <- "nome"; lista[[x]]
lista2 <- list(empregos = c("UNIPAR","UNIRONDON"))
listac <- c(lista,lista2)
listac
listac <- listac[-6] # remove elemento da lista.
is(listac)


# Data Frames - Criando ---------------------------------------------------

dados <- data.frame(atual=lista)
dados
dados <- data.frame(lista)
dados
dados <- as.data.frame(lista)
dados
Notas <- data.frame(Aluno = c("A","B","C","D","E"), P1 = c(2.5,5.5,7.8,8.3,9.0), P2 = c(7.5,9,7,10,8), P3 = c(5,7.5,4,6,8))
Notas
Notas <- data.frame(Notas,PF = c(7,8,10,7,9)) # <=> Notas$PF <- c(7,8,10,7,9)
Notas


# Data Frames - Acessando e alterando dados -------------------------------

Notas[-2] # subconjunto sem a coluna 2.
Notas[-2,] # subconjunto sem a linha 2.
Notas[-(2:3),]
Notas$Aluno
Notas$P1
Notas$Aluno[1] # A
Notas$Aluno[1:2]
Notas$Aluno[-2]
Notas$PF[1] <- 10
Notas$PF <- c(5,7,9,4,Notas$PF[5])
Notas["PF"]
Notas <- Notas[,-5] # remove coluna 5.
Notas

attach(Notas) # permite utilizar os nomes das colunas sem indicar o nome do data frame. Pode ser utilizado para outros objetos.
Aluno
P1
media <- (P1+P2+P3)/3
media
Notas$media <- media
detach(Notas) # remove data frame do caminho de busca. Pode ser utilizado para outros objetos.
row.names(Notas) <- c("A","B","C","D","E")
Notas

# Definindo diretório de trabalho -----------------------------------------

getwd()
diratual <- getwd()

setwd("C:/Users/Raul/Documents/R")
getwd()
setwd(diratual)
getwd()


# Gravando dados em arquivos ----------------------------------------------

write.table(Notas, file = "Notas.csv")
write.table(Notas, file = "Notas1.csv", sep = ";")
write.table(Notas, file = "Notas2.csv", sep = ";", dec = ",")
write.table(Notas, file = "Notas3.csv", sep = ";", dec = ",", row.names = FALSE)
write.table(Notas, file = "Notas4.csv", sep = "\t", dec = ",", row.names = FALSE)
write.csv(Notas, file = "Notas.csv")
write.csv(Notas, file = "Notas2.csv", row.names = FALSE)

# Lendo dados de arquivos -------------------------------------------------

Notasopen <- read.table("Notas.csv", header = TRUE, sep = ",", dec = ".")
Notasopen
Notasopen2 <- read.table("Notas3.csv", header = TRUE, sep = ";", dec = ",", row.names = 1)
Notasopen2


# Lendo do Console ou arquivo ---------------------------------------------

Notasscan <- scan("Notas4.csv", list(""))
Notasscan
Notasscan <- scan("Notas4.csv", list("","","","","")) # Faz a leitura das colunas como vetores.
Notasscan
Notasscan <- scan("Notas4.csv", list(Aluno = "",P1 = "",P2 = "",P3 = "",Media = ""))
Notasscanmatrix <- matrix(scan("Notas4.csv", ""), ncol = 5, byrow = TRUE)
Notasscanmatrix
numeros <- scan("") # leitura de números.
numeros
teclado <- scan("", list("")) #leitura de strings.
teclado


Notasopencsv <- read.csv("Notas.csv", header = TRUE, sep = ",", dec = ".")
Notasopencsv
Notasopencsv <- read.csv("Notas.csv", header = TRUE, sep = ",", dec = ".", row.names = 1)
Notasopencsv


# Desvios e laços ---------------------------------------------------------

media <- 7
faltas <- 15
if (faltas > 15) 
{
  cat("Reprovado por faltas") 
} else 
{ 
  if (media < 7)
    cat("Reprovado por Nota")
  else 
    cat("Aprovado")
}

##############

media <- 8
faltas <- 15
if (media < 7 && faltas > 15) 
  cat("Reprovado por Nota e Falta") else 
  {
    if (media < 7)
      cat("Reprovado por Nota") else 
      {
        if (faltas > 15)
          cat("Reprovado por Falta") 
        else
          cat("Aprovado")
      }  
  }


# Desvios e Laços - For ---------------------------------------------------


for(i in 1:5) print(1:i)
inicio <- 1
fim <- 10
for(i in inicio:fim)
{
  cat(i,"\t", i^2, "\n")
}
for(i in 2*inicio:fim)
{
  cat(i,"\t", i^2, "\n")
}

############

vet <- NULL
for (i in seq(length=5, from=-5, by=.2))
{
  cat(i,"\t", i^2, "\n")
  vet <- rbind(vet,c(i,i^2))
}


# Desvios e laços - Repeat ------------------------------------------------

i <- 1
fim <- 10
vet <- NULL
repeat 
{
  cat(i,"\t", i^2, "\n")
  vet <- rbind(vet,c(i,i^2))
  i <- i + 1
  if (i > fim)
  {
    break
  }
}

# Desvios e laços - While ------------------------------------------------

i <- 1
fim <- 10
vet <- NULL
while (i <= fim) 
{
  cat(i,"\t", i^2, "\n")
  vet <- rbind(vet,c(i,i^2))
  i <- i + 1
}



# Funções -----------------------------------------------------------------

ola <- function () print("Olá!")
ola()
potencia <- function (base,expoente)
{
  base^expoente
}
potencia(2,3)


# Funções - Definindo novos operadores binários ---------------------------

"%+%" <- function (x,y) x+y # definindo novos operadores
2 %+% 3

# Funções - Parâmetros nominados e valor padrão ---------------------------

potencia <- function (base=2,expoente=2)
{
  base^expoente
}
potencia()
potencia(expoente=3)
potencia(expoente=3,base=3)
potencia(3)
potencia(,3)


# Funções - Recursividade -------------------------------------------------

fatorial <- function (n) 
{
  if (n>0)
    n*fatorial(n-1)
  else
    1
}
fatorial(4)


# Gráficos - comandos alto nível ------------------------------------------

x <- c(1.6907, 1.7242, 1.7552, 1.7842, 1.8113, 1.8369, 1.8610, 1.8839)
y <- c( 6, 13, 18, 28, 52, 53, 61, 60)
plot(x)
plot(x,y)
xy <- cbind(x,y)
plot(xy)
complexnumbers <- c(1+4i,5+10i,10+4i,2+5i)
plot(complexnumbers)

notascurso <- data.frame(curso = c("cc","si","cc","si","espweb","espbd"), notas = c(7,7,6,6,7.5,8.0) )
plot(notascurso$curso)
plot(notascurso$curso,notascurso$notas)
library(rpart)
data(car90)
plot(car90$Country) # barplot
plot(car90$Country,car90$Price) 
plot(car90$Country,car90$Height)

Notasopen <- read.table("Notas.csv", header = TRUE, sep = ",", dec = ".")
is(Notasopen)
plot(Notasopen)
plot(Notasopen$media)
plot(~ Notasopen$media)
plot(Notasopen$media ~ Notasopen$P1)
plot(Notasopen$media ~ Notasopen$P1 + Notasopen$P2 + Notasopen$P3)

pairs(Notasopen) # scaterplot combinando todos os pares de variáveis.
qqnorm(x)
qqline(x)
qqplot(x,y)

hist(x)
hist(x,nclass = 7) # nclass é equivalente a breaks quando escalar.
hist(x, breaks= c(1.6,1.7,1.8,1.9)) 
hist(x, breaks= 2) # apenas sugestão
hist(x, breaks= 3)
hist(x, breaks= 4)
hist(x, breaks= 5)
hist(x, breaks= 6)

hist(x, breaks= 7)
hist(x, breaks= 3)
hist(x, breaks= 3, freq = TRUE)
hist(x, breaks= 3, probability = TRUE)
hist(x, breaks= 3, density = TRUE)
dotchart(x)
dotchart(x,y)

x <- 1:8
y <- 5:12
z <- matrix(1:64, nrow = 8, ncol =8)
image(x, y, z) 
contour(x, y, z) 
persp(x, y, z) 


# Gráficos - comandos de baixo nível --------------------------------------

plot(x,y, type ="n", xlab="", ylab="")
points(x, y)
lines(x, y)
text(7, 6, "comentário")
abline(2,5)
abline(1,5)
abline(0,5)
abline(-5,5)
abline(-5,15)


abline(h=6) #linha horizontal
abline(v=3) # linha vertical
polygon(c(2,5,6), c(2,4,8)) # cria um polígono.


plot(x, type = "n")
legend(7, 7, "teste", fill=2)  # cor da caixa.

plot(x, type = "n")
legend(7,7, "teste" , col= 5, pch = "+") # cor dos pontos ou linhas.

plot(x, type = "n")
legend(7,7, "teste" , lty=3) # tipo de linha.

plot(x, type = "n")
legend(7,7, "teste" , lwd=2) # espessura da linha.

plot(x, type = "n")
legend(7,7, "teste" , pch=5) # símbolo para plotagem.

plot(x, type = "n")
title("título", "subtítulo")

plot(x, axes = FALSE)
axis(1)
axis(2)
axis(3)
axis(4)

plot(x, axes = FALSE)
axis(1, 0:9)
axis(2, 0:max(x))

plot(x, axes = FALSE)
axis(1, 1:8, LETTERS[1:8], col.axis = "blue")
axis(4, col = "violet", col.axis = "dark violet", lwd = 2)
axis(3, col = "gold", lty = 2, lwd = 0.5)

plot(x, axes = FALSE)
box(lty = '1373', col = 'red')


# Gráficos - Interatividade -----------------------------------------------

testelocator <- locator() 
plot(testelocator)
plot(testelocator, type = "l")
polygon(testelocator)
text(locator(1), "Teste", adj=0) 

plot(x,y, type = "p")
identify(x, y, "Teste") #=> clicar nos pontos.



# Gráficos - Parâmetros ---------------------------------------------------

plot(x,y)
par()
oldparall <- par(no.readonly=TRUE) # salva os valores atuais dos parâmetros configuráveis.
par(c("col", "lty"))  # retorna os valores dos parâmetros especificados
oldpar <- par(col=4, lty=2) # altera os valores dos parâmetros especificados e retorna os anteriores.
par(col=4, lty=2)
plot(x,y)
par(oldpar)
plot(x,y)
par(col=4, lty=2)
plot(x,y)
par(oldparall)
plot(x,y)

plot(x, y, pch="+")

plot(x, y, main = "Teste", sub = "eixo x", type = "l", lwd = 2, col = 5, col.main = 3, col.sub = 7, lab = c(16,5,1))


# Múltiplas figuras -------------------------------------------------------


par(mfrow = c(2,2)); plot(x); plot(x); plot(y); plot(x)


# Arquivos xlsx -----------------------------------------------------------

library(xlsx)
planilha1 <- read.xlsx2("Pasta1.xlsx","Plan1")
planilha2 <- read.xlsx2("Pasta1.xlsx","Plan2")
planilha3 <- read.xlsx2("Pasta1.xlsx","Plan3", header = FALSE)


# Importando dataset ------------------------------------------------------


setwd("c:/Users/Raul/Dropbox/ufmt/2017/especializacao_BD")
setwd("c:/Users/AlguemCO/Dropbox/ufmt/2017/especializacao_BD")
setwd("c:/Users/Alguem/Dropbox/ufmt/2017/especializacao_BD")


irisdataset <- read.csv("iris.data", header = FALSE, sep = ",", dec = ".")
irisdataset


# Verificando tipo do objeto ----------------------------------------------


is(irisdataset)

# Alterando nomes de atributos --------------------------------------------

names(irisdataset) <- c("Sepal_lenght", "Sepal_Width","Petal_lenght", "Petal_width", "Class")
names(irisdataset)
irisdataset


# Análise estatística -----------------------------------------------------


library(psych) 
describe(irisdataset$Sepal_lenght)
describe(irisdataset)
summary(irisdataset)


mean(irisdataset$Sepal_lenght)
median(irisdataset$Sepal_lenght)
var(irisdataset$Sepal_lenght)
sd(irisdataset$Sepal_lenght)

library(e1071)

skewness(irisdataset$Sepal_lenght,type=3)
kurtosis(irisdataset$Sepal_lenght,type=3)


# Boxplot -----------------------------------------------------------------

boxplot(irisdataset[-5], main = "Iris Dataset", col = "gray")

# Histograma --------------------------------------------------------------

hist(irisdataset$Sepal_lenght, freq = FALSE, main = "", xlab = "Sepal lenght", ylab = "Densidade", xlim = c(trunc(min(irisdataset$Sepal_lenght)),round(max(irisdataset$Sepal_lenght))+0.5), ylim = c(0, 1.1), col = "gray")
curve(dnorm(x,mean(irisdataset$Sepal_lenght),sd(irisdataset$Sepal_lenght)),col = 2, add = TRUE) #inserir linha com a curva de distribuicao normal


# QQplot ------------------------------------------------------------------

qqnorm(irisdataset$Sepal_lenght,main = "Sepal lenght");qqline(irisdataset$Sepal_lenght)

# Scatter plot ------------------------------------------------------------

library(psych)

with(as.data.frame(irisdataset),scatter.hist(Sepal_lenght,Sepal_Width, xlab = "Sepal lenght", ylab = "Sepal Width"))

scatter.hist(irisdataset$Sepal_lenght, irisdataset$Sepal_Width, xlab = "Sepal lenght", ylab = "Sepal width")

scatter.smooth(irisdataset$Sepal_lenght, irisdataset$Sepal_Width, xlab = "Sepal lenght", ylab = "Sepal width")


# Teste de normalidade ----------------------------------------------------


ks.test(irisdataset$Sepal_lenght, "pnorm", mean(irisdataset$Sepal_lenght), sd(irisdataset$Sepal_lenght))

library(nortest)

lillie.test(irisdataset$Sepal_lenght)

shapiro.test(irisdataset$Sepal_lenght) 

library(fBasics)

ksnormTest(irisdataset$Sepal_lenght, title = NULL, description= NULL) # teste de normalidade

shapiroTest(irisdataset$Sepal_lenght, title = NULL, description= NULL) # teste de normalidade

jarqueberaTest(irisdataset$Sepal_lenght) 


# Matriz de correlação ----------------------------------------------------

correlation_matrix <- cor(irisdataset[-5], y = NULL, use = "everything", method = "pearson")
correlation_matrix
cor.plot(correlation_matrix)



library(psych)
correlation_2 <- corr.test(irisdataset[-5], use = "pairwise",method="pearson",adjust="holm") ####### apresenta mais informacoes como p-value
correlation_2
cor.plot(correlation_2$r)

# Normalização/padronização dos dados --------------------------------------------------

library(clusterSim)
dados_normalizados <- NULL
dados_normalizados <- data.Normalization(irisdataset[-5], type="n4",normalization="column")
dados_normalizados
describe(irisdataset[-5])
describe(dados_normalizados)


# Seleção de atributos ----------------------------------------------------

library(FSelector)
data(iris)
weights <- information.gain(Species~., iris)
print(weights)
subset <- cutoff.k(weights, 1)
f <- as.simple.formula(subset, "Species")
print(f)
subset <- cutoff.k.percent(weights, 0.75)
f <- as.simple.formula(subset, "Species")
print(f)
subset <- cutoff.biggest.diff(weights)
f <- as.simple.formula(subset, "Species")
print(f)

# Analise de Componentes Principais ---------------------------------------

library(psych)

pca <- principal(irisdataset[-5], 4, residuals = TRUE, rotate="none", scores = TRUE) 
pca

pca <- prcomp(irisdataset[-5])
pca

PCA <- princomp(irisdataset[-5], scores=TRUE, cor=FALSE) 
PCA
summary(PCA)
plot(PCA)


#####################biplot(PCA)

PCA$loadings
PCA$scores


# Árvore de decisão -------------------------------------------------------

   # pacote 1

library(rpart)

# utilizando todo o conjunto para treinamento

arvore <- rpart(Class ~ Sepal_lenght + Sepal_Width + Petal_lenght + Petal_width, data = irisdataset)

# matriz de confusao

#arvore <- rpart(Class ~ Sepal_lenght + Sepal_Width + Petal_lenght + Petal_width, data = irisdataset)
conf.matrix <- table(irisdataset$Class, predict(arvore,irisdataset, type="class"))
rownames(conf.matrix) <- paste("Actual", rownames(conf.matrix), sep = ":")
colnames(conf.matrix) <- paste("Pred", colnames(conf.matrix), sep = ":")
print(conf.matrix)

#plot

plot(arvore, compress = TRUE, branch = 1, nspace = 0, uniform = TRUE, margin = 0.1)
text(arvore, use.n = TRUE)

# utilizando parte do conjunto para treinamento

percentual <- 0.3
tamanho_suconjunto_treinamento <- percentual*length(irisdataset$Class)
vetor_treinamento <- seq(length=tamanho_suconjunto_treinamento, from=1, by=round(1/percentual))
arvore <- rpart(Class ~ Sepal_lenght + Sepal_Width + Petal_lenght + Petal_width, data = irisdataset, subset = vetor_treinamento)
summary(arvore)
plot(arvore, compress = TRUE, branch = 1, nspace = 0, uniform = TRUE, margin = 0.1)
text(arvore, use.n = TRUE)
dados_teste <- irisdataset[-vetor_treinamento,]
conf.matrix <- table(dados_teste$Class, predict(arvore,dados_teste, type="class"))
rownames(conf.matrix) <- paste("Actual", rownames(conf.matrix), sep = ":")
colnames(conf.matrix) <- paste("Pred", colnames(conf.matrix), sep = ":")
print(conf.matrix)


  # pacote 2

library(RWeka)
library(partykit)
result <- J48(Class ~ Sepal_lenght + Sepal_Width + Petal_lenght + Petal_width, data = irisdataset)
plot(result)

# Construir matriz de confusão para análise de resultados.

  # pacote 3

library(C50)
result_c50 <- C5.0(irisdataset[,-5],irisdataset[,5])
result_c50
plot(result_c50)
summary(result_c50)

# produzindo regras de decisão.
result_c50_rules <- C5.0(irisdataset[,-5],irisdataset[,5], rules = TRUE)
result_c50_rules
summary(result_c50_rules)


# Redes Neurais -----------------------------------------------------------


### pacote 1

library(neuralnet)

irisdatasetneuralnet <- irisdataset

irisdatasetneuralnet$Setosa <- c(rep_len(1,50), rep_len(0,50), rep_len(0,50))
irisdatasetneuralnet$Versicolor <- c(rep_len(0,50), rep_len(1,50), rep_len(0,50))
irisdatasetneuralnet$Virginica <- c(rep_len(0,50), rep_len(0,50), rep_len(1,50))

nn <- neuralnet(Setosa+Versicolor+Virginica ~ Sepal_lenght + Sepal_Width + Petal_lenght + Petal_width,data=irisdatasetneuralnet, hidden=10, err.fct="ce",linear.output=FALSE)
nn$result.matrix
plot(nn)

### pacote 2

library(RSNNS)

data(iris)

irisValues <- iris[,1:4]
irisTargets <- decodeClassLabels(iris[,5])


iris <- splitForTrainingAndTest(irisValues, irisTargets, ratio=0.15)
iris <- normTrainingAndTestSet(iris)

model <- mlp(iris$inputsTrain, iris$targetsTrain, size=5, learnFuncParams=c(0.1), 
             maxit=50, inputsTest=iris$inputsTest, targetsTest=iris$targetsTest)

model
summary(model)
weightMatrix(model)
extractNetInfo(model)


confusionMatrix(iris$targetsTrain, encodeClassLabels(fitted.values(model),
                                                     method="402040", l=0.4, h=0.6))

# pacote 3

library(nnet)

samp <- c(sample(1:50,25), sample(51:100,25), sample(101:150,25))
rede <- nnet(irisdatasetneuralnet[samp,1:4], irisdatasetneuralnet[samp, 6:8], size = 10, rang = 0.1, decay = 5e-4, maxit = 200)


test.cl <- function(true, pred) {
  true <- max.col(true)
  cres <- max.col(pred)
  table(true, cres)
}
test.cl(irisdatasetneuralnet[samp, 6:8], predict(rede, irisdatasetneuralnet[samp, 1:4]))


# Clustering --------------------------------------------------------------

#crisp

cl <- kmeans(irisdataset[,1:4],3)
cl

table(irisdataset$Class  , cl$cluster)

#fuzzy

library(e1071)

cfuzzy <- cmeans(irisdataset[,1:4],3)
cfuzzy
table(irisdataset$Class  , cfuzzy$cluster)


# Aprendizado Bayesiano ---------------------------------------------------


model <- naiveBayes(Class ~ Sepal_lenght + Sepal_Width + Petal_lenght + Petal_width, data = irisdataset)
pred <- predict(model, irisdataset)
table(pred, irisdataset$Class)



# Regras de decisão -------------------------------------------------------


JRip(Class ~ Sepal_lenght + Sepal_Width + Petal_lenght + Petal_width, data = irisdataset)
PART(Class ~ Sepal_lenght + Sepal_Width + Petal_lenght + Petal_width, data = irisdataset)

