# importação do csv para o R
indata <- list()
filename = paste("c:\\deputados.csv", sep = ";")

indata <- read.csv(filename, 
                   header = TRUE, 
                   sep = ";", 
                   dec = ".",
                   nrows = 10000)

# correcao das casa decimais
indata$vlrLiquido <- sub(",",".",indata$vlrLiquido)
indata$vlrLiquido <- as.numeric(indata$vlrLiquido)
                   
# analise inicial
indata

unique(indata$sgUF)
indata$vlrLiquido
is(indata$vlrLiquido)
max(indata$vlrLiquido)
min(indata$vlrLiquido)


# plot 1 (ok): da dispersão de valores 
plot(indata$vlrLiquido, 
     main="Dispersão de valores",
     xlab="", 
     ylab="Faixa de valores")

# plot 2 (corrigir): valores minimos, máximas e média por estado
plot1 <- data.frame(uf = c(indata$sgUF), valor = c(indata$vlrLiquido) )
plot(plot1, main="Valores minimos, máximas e média por estado",
     xlab="Deveria ser as UFs", ylab="Faixa de valores")

# plot 3 (ok): valor total pago por uf
counts <- table(indata$sgUF)
barplot(counts, main="Cotas parlamentares reembolsadas por UF", 
        xlab="UFs", ylab="Valores (em milhões)")

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
        xlab="Média dos valores pagos",
        ylab="Frequencia de valores", 
        main="Histograma da média de valores pagos") 

xfit<-seq(min(x),max(x),length=40) 
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
yfit <- yfit*diff(h$mids[1:2])*length(x) 
lines(xfit, yfit, col="blue", lwd=2)
