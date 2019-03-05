if(!require("data.table")) install.packages("data.table")
## if(!require("xlsx")) install.packages("xlsx")
if(!require("stringr")) install.packages("stringr")

## library(xlsx)
library(stringr)

source("read.wos.functions.R")

isSingleString <- function(input) {
	is.character(input) & length(input) == 1
}

## Ler arquivos da WoS
wos_data = read.wos(path="./WoS_amazonia", format = 'tab_win_utf8')
#wos_data = read.wos(path="./WoS_amazonia", format = 'plain_text')

## Ler dados das plantas
plantas = read.csv(file="plantas.csv", header=TRUE, sep=",")

## inicializacoes
limite = wos_data[[2]]
wos_data = wos_data[[1]]
## remove trash lines
wos_data = wos_data[ AU != 0 ]
## transforma tudo pra tolower
wos_data = data.frame(lapply(wos_data, function(v) {
  if (is.character(v)) return(tolower(v))
  else return(v)
}))
resultado = data.table(species = plantas$species, qtd = rep('0', length(plantas$species)))
class(resultado$qtd) = 'integer'
## verificador specie X WoS_line (inicializado a cada nova busca de especie)
hash_map = matrix(0, nrow = length(wos_data$AU), ncol = 1)

for(j in 1:length(x)){
	cat("Running #", j, "\n")
	ans = grep("carapa", x[,j])
	
	if(length(ans)>0){
		for(k in 1:length(ans)){
			if(hash_map[ans[k]] == 0){
				resultado$qtd[1] = resultado$qtd[1] + 1
			}
			hash_map[ans[k]] = 1
		}
	}
}

## loop atraves das especies de plantas
for(i in 1:length(plantas$species)){
	specie = plantas$species[i]
	
	cat("Running species #", i, " - ", specie, "...\n")
	
	## loop atraves dos dados da WoS
	for(j in 1:limite-1){
		specie = tolower(specie)
		finded = FALSE
		
		for(k in 1:length(wos_data[1,])){
			if(finded) break
			
			possivelString = wos_data[[1, k]]
			
			if(isSingleString(possivelString) == TRUE && !is.na(possivelString)){
				praDetectar = tolower(possivelString)
				
				if(str_count(praDetectar, specie) >= 1){
					resultado$qtd[i]=resultado$qtd[i]+1
					finded = TRUE
				}
			}
		}
	}
	write.csv(resultado, file = "resultado.csv")
}

## escreve resultado em arquivo
write.csv(resultado, file = "resultado.csv")
