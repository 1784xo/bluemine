var lineOption = {
	title:{
		text:""
	},
    backgroundColor: '#fff',
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            lineStyle: {
                color: '#ddd'
            }
        },
        backgroundColor: 'rgba(255,255,255,1)',
        padding: [5, 10],
        textStyle: {
            color: '#7588E4',
        },
        extraCssText: 'box-shadow: 0 0 5px rgba(0,0,0,0.3)'
    },
    legend: {
        right: 20,
        orient: 'vertical',
		left: 'center',
        data: ['昨日1']
    },
    xAxis: {
        type: 'category',
        data: [],
        boundaryGap: false,
        splitLine: {
            show: false,
            interval: 'auto',
            lineStyle: {
                color: ['#D4DFF5']
            }
        },
        axisTick: {
            show: true
        },
        axisLine: {
            lineStyle: {
                color: '#609ee9'
            }
        },
        axisLabel: {
            margin: 10,
            textStyle: {
                fontSize: 14
            }
        }
    },
    yAxis: {
        type: 'value',
        splitLine: {
            lineStyle: {
                color: ['#D4DFF5']
            }
        },
        axisTick: {
            show: false
        },
        axisLine: {
            lineStyle: {
                color: '#609ee9'
            }
        },
        axisLabel: {
            margin: 10,
            textStyle: {
                fontSize: 14
            }
        }
    },
    series: [{
        name: '昨日',
        type: 'line',
        smooth: true,
        showSymbol: true,
        symbol: 'circle',
        symbolSize: 10,
        data: [],
        areaStyle: {
			color: "#2C99F9",
			opacity :0.1
        },
        itemStyle: {
            normal: {
                color: '#2c99f9'
            }
        },
        lineStyle: {
            normal: {
                width: 3
            }
        }
    }]
};
var pieOption = {
    title:{
        text:"次数",
        left:'center'
    },
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
	legend: {
        orient: 'vertical',
        //right: '0%',
        top: 'middle',
        data: ['CARD', 'SSD', 'U盘', '嵌入式', 'FLASH'],
        itemWidth: 20,
        itemHeight: 20,
        padding: 10,
        itemGap: 20
    },
    series: [{
        name: '次数',
        type: 'pie',
        radius: ['50%', '80%'],
        center: ['50%', '50%'],
        selectedMode: 'single',
        data: [{
            value: 45,
            name: 'CARD'
        }, {
            value: 25,
            name: 'SSD'
        }, {
            value: 15,
            name: 'U盘'
        }, {
            value: 8,
            name: '嵌入式'
        }, {
            value: 7,
            name: 'FLASH'
        }],
        label: {
            show: false
        },
        itemStyle: {
            normal: {
                borderWidth: 1,
                borderColor: '#ffffff',
            },
            emphasis: {
                borderWidth: 0,
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        }
    }],
    color: [
        '#fb497b',
        '#ffa046',
        '#5fd91a',
        '#2f7af9',
        '#3f90f7',
        '#489cf6',
        '#64bef2',
        '#6dc9f0',
        '#76d5ef',
        '#7fe0ee',
    ],
    backgroundColor: '#fff'
};