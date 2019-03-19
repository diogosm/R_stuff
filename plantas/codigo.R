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
cat("############## Reading wos data ##############\n")
wos_data = read.wos(path="./WoS_amazonia", format = 'tab_win_utf8')
#wos_data = read.wos(path="./WoS_amazonia", format = 'plain_text')

## Ler dados das plantas
cat("############## Reading data about plantas ##############\n")
plantas = read.csv(file="plantas.csv", header=TRUE, sep=",")

## inicializacoes
cat("############## Initializing variables ##############\n")
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
## Remove o campo referencias citadas
wos_data$CR = NULL

## loop atraves das especies de plantas
for(i in 1:length(plantas$species)){
	specie = plantas$species[i]
	specie = tolower(specie)
	specieWithUnderline = gsub(" ", "-", specie)
	hash_map = matrix(0, nrow = length(wos_data$AU), ncol = 1)
	
	cat("Running species #", i, " - ", specie, " and ", specieWithUnderline, "...\n")
	
	for(j in 1:length(wos_data)){
		ans = grep(specie, wos_data[,j])
		
		## achei resultados pra specie na coluna j da WoS
		if(length(ans)>0){
			for(k in 1:length(ans)){
				if(hash_map[ans[k]] == 0){
					resultado$qtd[i] = resultado$qtd[i] + 1
				}
				## evita duplicacoes de busca na mesma linha da WoS
				hash_map[ans[k]] = 1
			}
		}

		## achei caso do underline
		ansWithUnderline = grep(specieWithUnderline, wos_data[,j])
		if(length(ansWithUnderline)>0){
			for(k in 1:length(ansWithUnderline)){
				if(hash_map[ansWithUnderline[k]] == 0){
					resultado$qtd[i] = resultado$qtd[i] + 1
				}
				## evita duplicacoes de busca na mesma linha da WoS
				hash_map[ansWithUnderline[k]] = 1
			}
		}
	}
	## escreve resultado PARCIAL em arquivo
	## write.csv(resultado, file = "resultado.csv")
}

## escreve resultado em arquivo
write.csv(resultado, file = "resultado.csv")
