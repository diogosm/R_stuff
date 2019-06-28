#!/ur/bin/env python
# -*- coding: utf-8 -*-
# @author: Diogo 'dsm' Soares
#

'''
    Conversor de graphviz para entrada do amCharts
    :params arq: nome do arquivo com a saída do graphviz
'''
if __name__ == "__main__":
    #arq = open("sassy-0_AdjacencyGraphvizReport.txt")
    #arq = open("infocom5-0_AdjacencyGraphvizReport.txt")
    arq = open("rollernet-0_AdjacencyGraphvizReport.txt")
    firstLine = False
    
    for line in arq:
        if "weight" in line:
            if firstLine:
                print ','
            de = line.split("--")[0].replace("\t","").replace("p","id: ")
            para = line.split("--")[1].split(" ")[0].replace("p","id: ")
            peso = line.split("--")[1].split(" ")[1].replace("\n","").split("=")[1].split("]")[0]
            
            print '{"from":"', de, '","to":"', para, '","value":', peso, '}',
            firstLine = True
