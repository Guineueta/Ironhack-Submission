// http://jsfiddle.net/gh/get/jquery/1.9.1/highslide-software/highcharts.com/tree/master/samples/highcharts/demo/line-basic/




$(function () {



    $('#container').highcharts({
        title: {
            text: 'Grafica de Esfuerzos',
            x: -20 //center
        },
        subtitle: {
            text: 'Metodo de Clapeyron',
            x: -20
        },
        xAxis: {
            categories: gon.array_categorias
        },
        yAxis: {
            title: {
                text: 'Valor del Esfuerzo'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: ''
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Momento KN/m',
            data: gon.array_momentos
        }, {
            name: 'Cortante KN',
            data: gon.array_cortantes
        }, {
            name: 'Deformaciones mm',
            data: gon.array_deformaciones
        }]
    });
});
