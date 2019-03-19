library(ggplot2) 

dataInfocom6horas 	<- read.table("overheadInfocom10pcent6horas.txt", header=F, fill=T, sep=" ")
dataInfocom			<- read.table("overheadInfocom10pcent.txt", header=F, fill=T, sep=" ")
dataSassy6horas 	<- read.table("overheadSassy10pcent6horas.txt", header=F, fill=T, sep=" ")
dataSassy			<- read.table("overheadSassy10pcent.txt", header=F, fill=T, sep=" ")


#ecdf1 <- ecdf(dataInfocom6horas)
#ecdf2 <- ecdf(dataInfocom)
#ecdf3 <- ecdf(dataSassy6horas)
#ecdf4 <- ecdf(dataSassy$V2)

x1 = cumsum(dataInfocom6horas$V2)
x2 = cumsum(dataInfocom$V2)
x3 = cumsum(dataSassy6horas$V2)
x4 = cumsum(dataSassy$V2)

#plot(breaks, cumfreq0,            # plot the data 
#+   main="Old Faithful Eruptions",  # main title 
#+   xlab="Duration minutes",        # x−axis label 
#+   ylab="Cumulative eruptions")   # y−axis label 

#plot(ecdf3, verticals=TRUE, do.points=FALSE)
#plot(dataInfocom, ecdf2, verticals=TRUE, do.points=FALSE, col='brown',xlab="x",ylab="y")
#plot(dataInfocom6horas, ecdf1, verticals=TRUE, do.points=FALSE, add=TRUE, col='orange')

#legend(0, 8000, legend=c("Line 1", "Line 2"),
#       col=c("red", "blue"), lty=1:2, cex=0.8)

# create a data set containing the range you wish to use

#plot(dataInfocom6horas$V1, x1, type="b", col='brown',xlab="Tempo de simulação (s)",ylab="Overhead de mensangens do watchdog", ylim=c(0,6507838))
#lines(dataInfocom$V1, x2, type="b", col='orange')
#plot(dataSassy6horas$V1, x3, type="b", col='brown',xlab="Tempo de simulação (s)",ylab="Overhead de mensangens do watchdog", ylim=c(0,16517))
#lines(dataSassy$V1, x4, type="b")

png(file="congestionamento1-EN.png")
#par(mfrow=c(2,1))

Fn1 = ecdf(dataInfocom6horas$V2)
Fn2 = ecdf(dataInfocom$V2)
Fn3 = ecdf(dataSassy6horas$V2)
Fn4 = ecdf(dataSassy$V2)
plot(Fn1,xlab="Amount of exchanged messages", ylab="Cumulative frequency distribution",pch=46,xlim=c(-20,10000),main=NULL) 
#plot(Fn3,xlab="Número de mensagens trocadas", ylab="Frequência relativa acumulada",pch=46,xlim=c(-20,300)) 
#lines(Fn1,lwd=2,cex = 1.5)
lines(Fn2,lty = 6, lwd = 4)
#lines(Fn3)
#lines(Fn4)
legend(-20, 0.95, legend=c("congestion control (6 hours)", "without congestion control"), lwd=1:3)
dev.off()

png(file="congestionamento2-EN.png")

plot(Fn3,xlab="Amount of exchanged messages", ylab="Cumulative frequency distribution",pch=46,xlim=c(-20,300),main=NULL) 
lines(Fn4,lty = 6, lwd = 4)
legend(-20, 0.95, legend=c("congestion control (6 hours)", "without congestion control"), lwd=1:3)

#dev.copy(png,'congestionamento.png')
dev.off()

#x <- c(dataInfocom6horas$V2, dataInfocom$V2)
#g <- c(rep("com controle de congestionamento", length(dataInfocom6horas$V2)), rep("sem controle de congestionamento", length(dataInfocom$V2)))
#ecdf(x, group = g)
