# Mapa de calor

Código que gera mapa de calor de dominio x patentes. Este código foi usado para gerar o gráfico apresentado no artigo: <a href="http://www.icieom.org/proceedings.asp" target="_blank">Internet of Things (IoT): technological indicators from patent analysis</a>

## Preparacao

- Garanta que seu arquivo de entrada esteja codificado em UTF-8

## Como usar

Troque o nome do arquivo de entrada nas seguintes linhas:

```
tabela=read.table("input.txt",header=T,sep="\t",row.names=1,as.is=T,check.names=FALSE)
nomes=read.table("input.txt", header=T,sep="\t")
```

Caso queira mexer na paleta de cores, modifique a seguinte linha (em caso de dúvida, consulte [RColorBrewer](https://moderndata.plot.ly/create-colorful-graphs-in-r-with-rcolorbrewer-and-plotly/):

```
cols <- rev(colorRampPalette(brewer.pal(6, "RdYlGn"))(20))
```

Caso queira modificar o tamanho e resolucao da imagem gerada, modifique a seguinte linha:

```
## quanto menor res, menor o tamanho das fontes
## adeque ao seu propósito, imagens pequenas tendem a precisar de res > 90 para ficar boa para leitura
png(file="img1.png",width=640,height=480,res=102)
```

Com relacao ao gráfico gerado, modifique eventuais legendas, etc no código abaixo:

```
print(
	levelplot(matriz,
		xlab = "Subdomains",							## legenda em X, caso queira usar
		ylab = "Year",								## legenda em Y, caso queira usar
		main = "# of Patents by Subdomains/Year",				## título do gráfico, caso queira usar
		col.regions = cols,							## regiao de cores 
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
```

Este código gera um pequeno texto que pode ser colocado como uma legenda extra em qualquer lugar do gráfico usando a seguinte linha:

```
## Gera textos adicionais no gráfico
## comente caso nao queira usar
## modifique x e y para ajustar a posicao que ficará no gráfico
grid.text("# of Patents", x = .80, y = .40, gp = gpar(fontface = "bold"))
```

## Bugs

Encontrou um bug? Reporte utilizando a instrução abaixo:

![image](https://user-images.githubusercontent.com/1641686/58602781-80c14100-8264-11e9-840b-d88ebdd64df0.png)

