# Network Visualization using am charts (JS)

## Running

to run this code you'll need the correspondent [Graphviz](https://www.graphviz.org/) graph of your network. For instance, look at examples stored at this repository. Further, it's assumed you are using weights in your graph construction.

1. First, transform Graphviz input to a JSON output (this part need some improvements, I know). Further, modify the variable in `parse.py` code: `arq = open("rollernet-0_AdjacencyGraphvizReport.txt")`; 

```bash
python parse.py > saida.out
```

2. Copy and paste the contents of `saida.out` to `chart.data` variable inside `plot.js` code;

3. Open `pagina.html` in browser and *voilá*. In the superior right corner you'll se a little menu button to download your plot.
