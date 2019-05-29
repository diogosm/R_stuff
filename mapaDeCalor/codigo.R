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

tabela=read.table("input.txt",header=T,sep="\t",row.names=1,as.is=T)
data=as.matrix(tabela)
nomes=read.table("input.txt", header=T,sep="\t")
#data=t(data)
#nomes=t(nomes)

rowColNames=list(nomes$Records,as.character(names(tabela)))
#rowColNames=list(as.character(2010:2017),nomes$Records)
#matriz=matrix(data, ncol=10,byrow=T,dimnames=rowColNames)
matriz=matrix(data, ncol=length(names(tabela)),byrow=F,dimnames=rowColNames)

cols <- rev(colorRampPalette(brewer.pal(6, "RdYlGn"))(20))

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

grid.text("# of Patents", x = .80, y = .40, gp = gpar(fontface = "bold"))

dev.off()
