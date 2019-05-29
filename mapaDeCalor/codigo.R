if(!require(gplots)) install.packages(gplots)
if(!require(lattice)) install.packages(lattice)
if(!require(raster)) install.packages("raster")
if(!require(grid)) install.packages(grid)
if(!require("RColorBrewer")) install.packages("RColorBrewer")

library(gplots)
library(lattice)
library(grid)
library(RColorBrewer)
require(raster)

DIM <- function( ... ){
    args <- list(...)
    lapply( args , function(x) { if( is.null( dim(x) ) )
                                    return( length(x) )
                                 dim(x) } )
}

## Ler arquivos de entrada e os transforma para realizar operacoes
tabela=read.table("input.txt",header=T,sep="\t",row.names=1,as.is=T,check.names=FALSE)
data=as.matrix(tabela)
nomes=read.table("input.txt", header=T,sep="\t")
## Fim leitura entrada

## Gera eixo de x e y do grafico e transforma valores em uma matriz
rowColNames=list(nomes$Records,as.character(names(tabela)))
matriz=matrix(data, ncol=length(names(tabela)),byrow=F,dimnames=rowColNames)
## Fim transformacoes

## Gera matriz de cores com intervalo de 20 cores
cols <- rev(colorRampPalette(brewer.pal(6, "RdYlGn"))(20))
## Fim cores

## Salva em png
png(file="img1.png",width=640,height=480,res=102)

#print(levelplot(matriz,col.regions=heat.colors,xlab = "Year",ylab = "Subdomains",main = "Heatmap top",col.regions = cols))
print(
	levelplot(matriz,
		xlab = "Subdomains",
		ylab = "Year",
		main = "# of Patents by Subdomains/Year",
		col.regions = cols, 
		scales = list(x = list(rot = 45),cex=0.8),
		colorkey=list(labels=list(cex=1, font=2, col="brown"),
			height=1, 
			width=1.4,
			#title = expression(paste("W ", m^2), sep=""),
			labels=c("none", "a bit"),
			row=13, 
			column=2, 
			vjust=2
			)  
		)
)

## Gera textos adicionais no gráfico
grid.text("# of Patents", x = .80, y = .40, gp = gpar(fontface = "bold"))

## Finaliza salvamento da imagem
dev.off()
