<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 3/27/24
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<style>
    .chart_layout {
        width: 300px;
        height: 300px;
        border: 2px solid red;
        margin: 5px;
    }
</style>
<script>
    let chart3 = {
        init: function () {
            setInterval(() => {
                this.getCornChart();
                this.getPopChart();
                this.getStockChart();
            }, 3000);
        },
        getCornChart:function (){
            this.cornChart();
        },
        cornChart:function (){
            Highcharts.chart('c1', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Corn vs wheat estimated production for 2020',
                    align: 'left'
                },
                subtitle: {
                    text:
                        'Source: <a target="_blank" ' +
                        'href="https://www.indexmundi.com/agriculture/?commodity=corn">indexmundi</a>',
                    align: 'left'
                },
                xAxis: {
                    categories: ['USA', 'China', 'Brazil', 'EU', 'India', 'Russia'],
                    crosshair: true,
                    accessibility: {
                        description: 'Countries'
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '1000 metric tons (MT)'
                    }
                },
                tooltip: {
                    valueSuffix: ' (1000 MT)'
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: [
                    {
                        name: 'Corn',
                        data: [406292, 260000, 107000, 68300, 27500, 14500]
                    },
                    {
                        name: 'Wheat',
                        data: [51086, 136000, 5500, 141000, 107180, 77000]
                    }
                ]
            });
        },
        getPopChart:function () {
            this.popChart();
        },
        popChart:function () {
            Highcharts.chart('c2', {
                chart: {
                    type: 'variablepie'
                },
                title: {
                    text: 'Countries compared by population density and total area, 2022.',
                    align: 'left'
                },
                tooltip: {
                    headerFormat: '',
                    pointFormat: '<span style="color:{point.color}">\u25CF</span> <b> {point.name}</b><br/>' +
                        'Area (square km): <b>{point.y}</b><br/>' +
                        'Population density (people per square km): <b>{point.z}</b><br/>'
                },
                series: [{
                    minPointSize: 10,
                    innerSize: '20%',
                    zMin: 0,
                    name: 'countries',
                    borderRadius: 5,
                    data: [{
                        name: 'Spain',
                        y: 505992,
                        z: 92
                    }, {
                        name: 'France',
                        y: 551695,
                        z: 119
                    }, {
                        name: 'Poland',
                        y: 312679,
                        z: 121
                    }, {
                        name: 'Czech Republic',
                        y: 78865,
                        z: 136
                    }, {
                        name: 'Italy',
                        y: 301336,
                        z: 200
                    }, {
                        name: 'Switzerland',
                        y: 41284,
                        z: 213
                    }, {
                        name: 'Germany',
                        y: 357114,
                        z: 235
                    }],
                    colors: [
                        '#4caefe',
                        '#3dc3e8',
                        '#2dd9db',
                        '#1feeaf',
                        '#0ff3a0',
                        '#00e887',
                        '#23e274'
                    ]
                }]
            });
        },
        getStockChart:function () {
            this.displayStockChart();
        },
        displayStockChart: (async () => {

            // Load the dataset
            const data = await fetch(
                'https://demo-live-data.highcharts.com/aapl-ohlcv.json'
            ).then(response => response.json());

            // split the data set into ohlc and volume
            const ohlc = [],
                volume = [],
                dataLength = data.length;

            for (let i = 0; i < dataLength; i += 1) {
                ohlc.push([
                    data[i][0], // the date
                    data[i][1], // open
                    data[i][2], // high
                    data[i][3], // low
                    data[i][4] // close
                ]);

                volume.push([
                    data[i][0], // the date
                    data[i][5] // the volume
                ]);
            }

            Highcharts.stockChart('c3', {
                yAxis: [{
                    labels: {
                        align: 'left'
                    },
                    height: '80%',
                    resize: {
                        enabled: true
                    }
                }, {
                    labels: {
                        align: 'left'
                    },
                    top: '80%',
                    height: '20%',
                    offset: 0
                }],
                tooltip: {
                    shape: 'square',
                    headerShape: 'callout',
                    borderWidth: 0,
                    shadow: false,
                    positioner: function (width, height, point) {
                        const chart = this.chart;
                        let position;

                        if (point.isHeader) {
                            position = {
                                x: Math.max(
                                    // Left side limit
                                    chart.plotLeft,
                                    Math.min(
                                        point.plotX + chart.plotLeft - width / 2,
                                        // Right side limit
                                        chart.chartWidth - width - chart.marginRight
                                    )
                                ),
                                y: point.plotY
                            };
                        } else {
                            position = {
                                x: point.series.chart.plotLeft,
                                y: point.series.yAxis.top - chart.plotTop
                            };
                        }

                        return position;
                    }
                },
                series: [{
                    type: 'ohlc',
                    id: 'aapl-ohlc',
                    name: 'AAPL Stock Price',
                    data: ohlc
                }, {
                    type: 'column',
                    id: 'aapl-volume',
                    name: 'AAPL Volume',
                    data: volume,
                    yAxis: 1
                }],
                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 800
                        },
                        chartOptions: {
                            rangeSelector: {
                                inputEnabled: false
                            }
                        }
                    }]
                }
            });
        })
    };
    $(function () {
        chart3.init();
    });
</script>
<div class="container">
    <h2>Chart3 Page</h2>
    <div class="row well">
        <div id="c1" class="col-sm4 well chart_layout"></div>
        <div id="c2" class="col-sm4 well chart_layout"></div>
        <div id="c3" class="col-sm4 well chart_layout"></div>
    </div>
</div>
