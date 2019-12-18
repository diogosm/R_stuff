

data = read.csv("PlanilhaCarol.csv", sep=";", fileEncoding = "ISO-8859-15")
#head(data)

#keywords = data$Author.Keywords
#head(keywords)

hash_map = matrix(ncol = 1)
maisOcorridas = c("biblioteca escolar", "biblioteca universitária",
    "biblioteconomia", "leitura", "incentivo à leitura",
    "bibliotecário")

for(row in 1:nrow(data)){
    ano = data[row,]$Year
    keywords = data[row,]$Author.Keywords
    vetorKeywords = strsplit(toString(keywords),";")
    
#    print(
#        paste(
#            "Num keys: ", 
#            length(vetorKeywords), 
#            " - Ano: ",
#            ano
#        )
#    )
    for(keyword in 1:length(vetorKeywords[[1]])){
        ans = gregexpr(pattern=' ', vetorKeywords[[1]][keyword])
        
        ## elimina quem comeca com espaco
        if( ans[[1]][1] == 1 ){
            vetorKeywords[[1]][keyword] = substring(vetorKeywords[[1]][keyword], 2)
        }
        
        ## toLower
        vetorKeywords[[1]][keyword] = tolower(vetorKeywords[[1]][keyword])
        
        ## verifica se eh uma das mais ocorridas, senao pula
        if( !(is.element(vetorKeywords[[1]][keyword], maisOcorridas)) )
            next

        ## ocorrencias por ano concatenado        
        vetorKeywords[[1]][keyword] = paste(
                vetorKeywords[[1]][keyword],
                "-",
                ano    
            , sep="")
        
        ## verifica se ta no hash
        if( is.na( hash_map[vetorKeywords[[1]][keyword]] ) ){
            hash_map[vetorKeywords[[1]][keyword]] = 1
        }else{
            hash_map[vetorKeywords[[1]][keyword]] = hash_map[vetorKeywords[[1]][keyword]] + 1
        }
        
        #print(vetorKeywords[[1]][keyword])
    }
}

print(hash_map[order(hash_map)])
