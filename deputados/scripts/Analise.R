# importa??o do csv para o R
indata <- list()
filename = paste("D:/GIT/deputados.csv", sep = ";")

indata <- read.csv(filename, 
                   header = TRUE, 
                   sep = ";", 
                   dec = ".")

# correcao das casa decimais
indata$vlrLiquido <- sub(",",".",indata$vlrLiquido)
indata$vlrLiquido <- as.double(indata$vlrLiquido)
                   
# analise inicial
indata

unique(indata$sgUF)
indata$vlrLiquido
is(indata$vlrLiquido)
max(indata$vlrLiquido)
min(indata$vlrLiquido)


# plot 1 (ok): da dispers?o de valores 
plot(indata$vlrLiquido, 
     main="Dispers?o de valores",
     xlab="", 
     ylab="Faixa de valores")

# plot 2 (corrigir): valores minimos, m?ximas e m?dia por estado
plot1 <- data.frame(uf = c(indata$sgUF), valor = c(indata$vlrLiquido) )
plot(plot1, main="Valores minimos, m?ximas e m?dia por estado",
     xlab="Deveria ser as UFs", ylab="Faixa de valores")

# plot 3 (ok): valor total pago por uf
counts <- table(indata$sgUF)
barplot(counts, main="Cotas parlamentares reembolsadas por UF", 
        xlab="UFs", ylab="Valores (em milh?es)")

# plot 4 (ok): distribuicao normal
x <- rnorm(indata$vlrLiquido)
y <- rnorm(indata$vlrLiquido) 
plot(x,y, main="", 
     col=rgb(0,100,0,50,maxColorValue=255))

# plot 5 (ok): histograma com curva
x <- indata$vlrLiquido
is(x)
h<-hist(x, 
        breaks=10, 
        col="red", 
        xlab="M?dia dos valores pagos",
        ylab="Frequencia de valores", 
        main="Histograma da m?dia de valores pagos") 

xfit<-seq(min(x),max(x),length=40) 
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
yfit <- yfit*diff(h$mids[1:2])*length(x) 
lines(xfit, yfit, col="blue", lwd=2)
