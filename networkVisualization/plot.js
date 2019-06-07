
    /**
     * ---------------------------------------
     * This demo was created using amCharts 4.
     * 
     * For more information visit:
     * https://www.amcharts.com/
     * 
     * Documentation is available at:
     * https://www.amcharts.com/docs/v4/
     * ---------------------------------------
     */

    // Themes begin
    am4core.useTheme(am4themes_spiritedaway);
    am4core.useTheme(am4themes_animated);
    // Themes end

    var chart = am4core.create("chartdiv", am4charts.ChordDiagram);

    // colors of main characters
    chart.colors.saturation = 0.45;
    chart.colors.step = 3;
    var colors = {
        Rachel:chart.colors.next(),
        Monica:chart.colors.next(),
        Phoebe:chart.colors.next(),
        Ross:chart.colors.next(),
        Joey:chart.colors.next(),
        Chandler:chart.colors.next()
    }

    // data was provided by: https://www.reddit.com/user/notrudedude

    chart.data = [
    // node property fields take data from data items where they are first mentioned, that's 
    // why we add empty data items at the beginning and set colors here

    // real data
        {"from":" id: 10 ","to":" id: 18 ","value": 1 } ,
        {"from":" id: 10 ","to":" id: 17 ","value": 5 } ,
        {"from":" id: 0 ","to":" id: 13 ","value": 608 } ,
        {"from":" id: 0 ","to":" id: 12 ","value": 75 } ,
        {"from":" id: 0 ","to":" id: 11 ","value": 13 } ,
        {"from":" id: 4 ","to":" id: 20 ","value": 16 } ,
        {"from":" id: 19 ","to":" id: 5 ","value": 2 } ,
        {"from":" id: 17 ","to":" id: 13 ","value": 11 } ,
        {"from":" id: 11 ","to":" id: 4 ","value": 268 } ,
        {"from":" id: 11 ","to":" id: 6 ","value": 513 } ,
        {"from":" id: 17 ","to":" id: 10 ","value": 6 } ,
        {"from":" id: 19 ","to":" id: 1 ","value": 2 } ,
        {"from":" id: 0 ","to":" id: 19 ","value": 1 } ,
        {"from":" id: 10 ","to":" id: 14 ","value": 5 } ,
        {"from":" id: 11 ","to":" id: 7 ","value": 3 } ,
        {"from":" id: 10 ","to":" id: 13 ","value": 2 } ,
        {"from":" id: 10 ","to":" id: 16 ","value": 1 } ,
        {"from":" id: 0 ","to":" id: 17 ","value": 54 } ,
        {"from":" id: 8 ","to":" id: 13 ","value": 8 } ,
        {"from":" id: 8 ","to":" id: 14 ","value": 781 } ,
        {"from":" id: 17 ","to":" id: 9 ","value": 3 } ,
        {"from":" id: 8 ","to":" id: 10 ","value": 39 } ,
        {"from":" id: 24 ","to":" id: 14 ","value": 21 } ,
        {"from":" id: 11 ","to":" id: 12 ","value": 292 } ,
        {"from":" id: 11 ","to":" id: 14 ","value": 805 } ,
        {"from":" id: 17 ","to":" id: 0 ","value": 8 } ,
        {"from":" id: 14 ","to":" id: 23 ","value": 3 } ,
        {"from":" id: 14 ","to":" id: 8 ","value": 1 } ,
        {"from":" id: 0 ","to":" id: 20 ","value": 1 } ,
        {"from":" id: 4 ","to":" id: 10 ","value": 3 } ,
        {"from":" id: 5 ","to":" id: 8 ","value": 7 } ,
        {"from":" id: 17 ","to":" id: 7 ","value": 14 } ,
        {"from":" id: 4 ","to":" id: 14 ","value": 29 } ,
        {"from":" id: 4 ","to":" id: 13 ","value": 23 } ,
        {"from":" id: 10 ","to":" id: 20 ","value": 3 } ,
        {"from":" id: 17 ","to":" id: 4 ","value": 7 } ,
        {"from":" id: 17 ","to":" id: 3 ","value": 2 } ,
        {"from":" id: 12 ","to":" id: 14 ","value": 162 } ,
        {"from":" id: 17 ","to":" id: 1 ","value": 9 } ,
        {"from":" id: 6 ","to":" id: 12 ","value": 7 } ,
        {"from":" id: 8 ","to":" id: 21 ","value": 5 } ,
        {"from":" id: 11 ","to":" id: 1 ","value": 4 } ,
        {"from":" id: 11 ","to":" id: 0 ","value": 3 } ,
        {"from":" id: 1 ","to":" id: 11 ","value": 1 } ,
        {"from":" id: 8 ","to":" id: 20 ","value": 56 } ,
        {"from":" id: 1 ","to":" id: 12 ","value": 1 } ,
        {"from":" id: 5 ","to":" id: 4 ","value": 1 } ,
        {"from":" id: 21 ","to":" id: 20 ","value": 25 } ,
        {"from":" id: 5 ","to":" id: 3 ","value": 7 } ,
        {"from":" id: 13 ","to":" id: 0 ","value": 1 } ,
        {"from":" id: 13 ","to":" id: 4 ","value": 1 } ,
        {"from":" id: 3 ","to":" id: 23 ","value": 1 } ,
        {"from":" id: 1 ","to":" id: 0 ","value": 3 } ,
        {"from":" id: 13 ","to":" id: 1 ","value": 3 } ,
        {"from":" id: 1 ","to":" id: 7 ","value": 3 } ,
        {"from":" id: 16 ","to":" id: 13 ","value": 2 } ,
        {"from":" id: 1 ","to":" id: 4 ","value": 3 } ,
        {"from":" id: 16 ","to":" id: 14 ","value": 6 } ,
        {"from":" id: 16 ","to":" id: 18 ","value": 3 } ,
        {"from":" id: 1 ","to":" id: 9 ","value": 2 } ,
        {"from":" id: 3 ","to":" id: 13 ","value": 67 } ,
        {"from":" id: 8 ","to":" id: 0 ","value": 3 } ,
        {"from":" id: 8 ","to":" id: 1 ","value": 1 } ,
        {"from":" id: 3 ","to":" id: 16 ","value": 2 } ,
        {"from":" id: 3 ","to":" id: 18 ","value": 1 } ,
        {"from":" id: 3 ","to":" id: 19 ","value": 1 } ,
        {"from":" id: 9 ","to":" id: 7 ","value": 2 } ,
        {"from":" id: 8 ","to":" id: 7 ","value": 60 } ,
        {"from":" id: 9 ","to":" id: 1 ","value": 2 } ,
        {"from":" id: 16 ","to":" id: 19 ","value": 2 } ,
        {"from":" id: 8 ","to":" id: 4 ","value": 280 } ,
        {"from":" id: 23 ","to":" id: 20 ","value": 1 } ,
        {"from":" id: 23 ","to":" id: 21 ","value": 2 } ,
        {"from":" id: 24 ","to":" id: 21 ","value": 12 } ,
        {"from":" id: 13 ","to":" id: 7 ","value": 2 } ,
        {"from":" id: 12 ","to":" id: 7 ","value": 2 } ,
        {"from":" id: 24 ","to":" id: 23 ","value": 51 } ,
        {"from":" id: 12 ","to":" id: 6 ","value": 7 } ,
        {"from":" id: 7 ","to":" id: 8 ","value": 47 } ,
        {"from":" id: 7 ","to":" id: 3 ","value": 14 } ,
        {"from":" id: 22 ","to":" id: 23 ","value": 2 } ,
        {"from":" id: 24 ","to":" id: 20 ","value": 6 } ,
        {"from":" id: 2 ","to":" id: 13 ","value": 2 } ,
        {"from":" id: 7 ","to":" id: 4 ","value": 193 } ,
        {"from":" id: 12 ","to":" id: 1 ","value": 2 } ,
        {"from":" id: 12 ","to":" id: 0 ","value": 1 } ,
        {"from":" id: 3 ","to":" id: 7 ","value": 2 } ,
        {"from":" id: 18 ","to":" id: 19 ","value": 2 } ,
        {"from":" id: 20 ","to":" id: 24 ","value": 4 } ,
        {"from":" id: 20 ","to":" id: 21 ","value": 1 } ,
        {"from":" id: 9 ","to":" id: 17 ","value": 4 } ,
        {"from":" id: 3 ","to":" id: 4 ","value": 2 } ,
        {"from":" id: 10 ","to":" id: 7 ","value": 7 } ,
        {"from":" id: 13 ","to":" id: 23 ","value": 8 } ,
        {"from":" id: 10 ","to":" id: 8 ","value": 2 } ,
        {"from":" id: 13 ","to":" id: 21 ","value": 10 } ,
        {"from":" id: 13 ","to":" id: 20 ","value": 12 } ,
        {"from":" id: 10 ","to":" id: 4 ","value": 3 } ,
        {"from":" id: 2 ","to":" id: 4 ","value": 3 } ,
        {"from":" id: 2 ","to":" id: 3 ","value": 2 } ,
        {"from":" id: 2 ","to":" id: 1 ","value": 2 } ,
        {"from":" id: 19 ","to":" id: 18 ","value": 2 } ,
        {"from":" id: 18 ","to":" id: 14 ","value": 3 } ,
        {"from":" id: 18 ","to":" id: 16 ","value": 2 } ,
        {"from":" id: 13 ","to":" id: 17 ","value": 3 } ,
        {"from":" id: 2 ","to":" id: 5 ","value": 2 } ,
        {"from":" id: 18 ","to":" id: 1 ","value": 1 } ,
        {"from":" id: 18 ","to":" id: 2 ","value": 3 } ,
        {"from":" id: 18 ","to":" id: 5 ","value": 2 } ,
        {"from":" id: 7 ","to":" id: 20 ","value": 199 } ,
        {"from":" id: 18 ","to":" id: 4 ","value": 4 } ,
        {"from":" id: 18 ","to":" id: 7 ","value": 1 } ,
        {"from":" id: 5 ","to":" id: 13 ","value": 4 } ,
        {"from":" id: 0 ","to":" id: 6 ","value": 64 } ,
        {"from":" id: 0 ","to":" id: 4 ","value": 278 } ,
        {"from":" id: 5 ","to":" id: 20 ","value": 2 } ,
        {"from":" id: 0 ","to":" id: 3 ","value": 49 } ,
        {"from":" id: 5 ","to":" id: 21 ","value": 3 } ,
        {"from":" id: 10 ","to":" id: 1 ","value": 1 } ,
        {"from":" id: 0 ","to":" id: 9 ","value": 26 } ,
        {"from":" id: 0 ","to":" id: 8 ","value": 734 } ,
        {"from":" id: 0 ","to":" id: 7 ","value": 180 } ,
        {"from":" id: 4 ","to":" id: 3 ","value": 1 } ,
        {"from":" id: 7 ","to":" id: 10 ","value": 94 } ,
        {"from":" id: 4 ","to":" id: 6 ","value": 3 } ,
        {"from":" id: 7 ","to":" id: 13 ","value": 125 } ,
        {"from":" id: 4 ","to":" id: 0 ","value": 1 } ,
        {"from":" id: 5 ","to":" id: 23 ","value": 5 } ,
        {"from":" id: 7 ","to":" id: 14 ","value": 206 } ,
        {"from":" id: 7 ","to":" id: 16 ","value": 3 } ,
        {"from":" id: 4 ","to":" id: 1 ","value": 12 } ,
        {"from":" id: 7 ","to":" id: 18 ","value": 1 } ,
        {"from":" id: 7 ","to":" id: 19 ","value": 3 } ,
        {"from":" id: 4 ","to":" id: 7 ","value": 15 } ,
        {"from":" id: 6 ","to":" id: 0 ","value": 9 } ,
        {"from":" id: 4 ","to":" id: 8 ","value": 14 } ,
        {"from":" id: 6 ","to":" id: 4 ","value": 5 } ,
        {"from":" id: 6 ","to":" id: 1 ","value": 10 } ,
        {"from":" id: 16 ","to":" id: 8 ","value": 1 } ,
        {"from":" id: 6 ","to":" id: 7 ","value": 12 } ,
        {"from":" id: 0 ","to":" id: 1 ","value": 342 } ,
        {"from":" id: 0 ","to":" id: 2 ","value": 75 }
    ]



    chart.dataFields.fromName = "from";
    chart.dataFields.toName = "to";
    chart.dataFields.value = "value";


    chart.nodePadding = 0.5;
    chart.minNodeSize = 0.01;
    chart.startAngle = 80;
    chart.endAngle = chart.startAngle + 360;
    chart.sortBy = "value";
    chart.fontSize = 10;

    var nodeTemplate = chart.nodes.template;
    nodeTemplate.readerTitle = "Click to show/hide or drag to rearrange";
    nodeTemplate.showSystemTooltip = true;
    nodeTemplate.propertyFields.fill = "color";
    nodeTemplate.tooltipText = "{name}'s kisses: {total}";

    // when rolled over the node, make all the links rolled-over
    nodeTemplate.events.on("over", function(event) {    
        var node = event.target;
        node.outgoingDataItems.each(function(dataItem) {
            if(dataItem.toNode){
                dataItem.link.isHover = true;
                dataItem.toNode.label.isHover = true;
            }
        })
        node.incomingDataItems.each(function(dataItem) {
            if(dataItem.fromNode){
                dataItem.link.isHover = true;
                dataItem.fromNode.label.isHover = true;
            }
        }) 

        node.label.isHover = true;   
    })

    // when rolled out from the node, make all the links rolled-out
    nodeTemplate.events.on("out", function(event) {
        var node = event.target;
        node.outgoingDataItems.each(function(dataItem) {        
            if(dataItem.toNode){
                dataItem.link.isHover = false;                
                dataItem.toNode.label.isHover = false;
            }
        })
        node.incomingDataItems.each(function(dataItem) {
            if(dataItem.fromNode){
                dataItem.link.isHover = false;
               dataItem.fromNode.label.isHover = false;
            }
        })

        node.label.isHover = false;
    })

    var label = nodeTemplate.label;
    label.relativeRotation = 90;

    label.fillOpacity = 0.4;
    let labelHS = label.states.create("hover");
    labelHS.properties.fillOpacity = 1;

    nodeTemplate.cursorOverStyle = am4core.MouseCursorStyle.pointer;
    // this adapter makes non-main character nodes to be filled with color of the main character which he/she kissed most
    nodeTemplate.adapter.add("fill", function(fill, target) {
        let node = target;
        let counters = {};
        let mainChar = false;
        node.incomingDataItems.each(function(dataItem) {
            if(colors[dataItem.toName]){
                mainChar = true;
            }

            if(isNaN(counters[dataItem.fromName])){
                counters[dataItem.fromName] = dataItem.value;
            }
            else{
                counters[dataItem.fromName] += dataItem.value;
            }
        })
        if(mainChar){
            return fill;
        }

        let count = 0;
        let color;
        let biggest = 0;
        let biggestName;

        for(var name in counters){
            if(counters[name] > biggest){
                biggestName = name;
                biggest = counters[name]; 
            }        
        }
        if(colors[biggestName]){
            fill = colors[biggestName];
        }
      
        return fill;
    })

    // link template
    var linkTemplate = chart.links.template;
    linkTemplate.strokeOpacity = 0;
    linkTemplate.fillOpacity = 0.15;
    linkTemplate.tooltipText = "{fromName} & {toName}:{value.value}";

    var hoverState = linkTemplate.states.create("hover");
    hoverState.properties.fillOpacity = 0.7;
    hoverState.properties.strokeOpacity = 0.7;

    var titleImage = chart.chartContainer.createChild(am4core.Image);
    titleImage.href = "//www.amcharts.com/wp-content/uploads/2018/11/whokissed.png";
    titleImage.x = 30
    titleImage.y = 30;
    titleImage.width = 200;
    titleImage.height = 200;

    chart.exporting.menu = new am4core.ExportMenu();
