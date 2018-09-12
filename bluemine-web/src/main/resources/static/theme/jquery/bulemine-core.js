/**
 * Created by hechao on 2018/7/25.
 */
var TAGTREE_DATA = [];
function loadTagTree(data) {
    if ((!!data) && (data.status == '200') && (!!data.result)) {
        TAGTREE_DATA = data.result;
    }
}

var PIE_OPTION = (function (template) {
    return function (opt) {

        var option = $.extend(true, {}, template, opt);
        console.log(option);

        for (var serie, i = 0, l = option.series.length; i < l; i++) {
            option.series[i] = $.extend(true, {
                type: 'pie',
                label: {
                    emphasis: {
                        textStyle: {
                            fontFamily: template.fontFamily
                        }
                    }
                }
            }, template.series, option.series[i]);
            console.log(option.series[i]);
        }

        return option;
    };
})({
    fontFamily: 'tahoma, arial, simsun, "Microsoft YaHei", \u5fae\u8f6f\u96c5\u9ed1, "微软雅黑", "Hiragino Sans GB", MingLiu',
    legend: {
        data: []
    },
    tooltip: {
        formatter: '{a} <br/>{b}: {c} ({d}%)',
        backgroundColor: 'rgba(0,0,0,0.5)',
        padding: [5, 10],
        textStyle: {
            color: '#FFFFFF',
        },
        extraCssText: 'box-shadow: 0 0 5px rgba(0,0,0,0.3)'
    },
    series: {
        label: {
            emphasis: {
                textStyle: {
                    color: '#333333',
                    fontSize: '14',
                    fontWeight: 'bold'
                }
            }
        }
    },
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
        '#7fe0ee'
    ],
    backgroundColor: '#fff'
});

var AXIS_OPTION = (function (template) {
    return function (opt) {

        var yaxis = [];

        var option = $.extend(true, {
            xAxis: {
                axisLabel: {
                    textStyle: {
                        fontFamily: template.fontFamily
                    }
                }
            }
        }, template, opt);

        for (var serie, i = 0, l = opt.series.length; i < l; i++) {
            serie = opt.series[i];
            yaxis.push($.extend(true, {
                name: serie.name,
                axisLabel: {
                    textStyle: {
                        fontFamily: option.fontFamily
                    }
                }
            }, option.yAxis, serie.yAxis));
        }
        option.yAxis = yaxis;

        return option;
    }
})({
    fontFamily: 'tahoma, arial, simsun, "Microsoft YaHei", \u5fae\u8f6f\u96c5\u9ed1, "微软雅黑", "Hiragino Sans GB", MingLiu',
    backgroundColor: '#FFF',
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            lineStyle: {
                color: '#B9B9B9'
            }
        },
        backgroundColor: 'rgba(0,0,0,0.5)',
        padding: [5, 10],
        textStyle: {
            color: '#FFFFFF',
        },
        extraCssText: 'box-shadow: 0 0 5px rgba(0,0,0,0.3)'
    },
    xAxis: {
        type: 'category',
        boundaryGap: true,
        splitLine: {
            show: true,
            interval: 'auto',
            lineStyle: {
                color: '#D4DFF5'
            }
        },
        axisTick: {
            show: true,
            length: 8,
            lineStyle: {
                color: '#D3DEEC'
            }
        },
        axisLine: {
            lineStyle: {
                color: '#D3DEEC'
            }
        },
        axisLabel: {
            margin: 10,
            textStyle: {
                fontSize: 12,
                color: '#666666'
            }
        }
    },
    yAxis: {
        splitLine: {
            lineStyle: {
                color: '#D4DFF5'
            }
        },
        axisTick: {
            show: true,
            lineStyle: {
                color: '#D3DEEC'
            }
        },
        axisLine: {
            lineStyle: {
                color: '#D3DEEC'
            }
        },
        axisLabel: {
            margin: 10,
            textStyle: {
                fontSize: 12,
                color: '#666666'
            }
        }
    },
    series: {
        data: []
    }
});

var bulemine = (function () {

    var LOAD_QUEUE = [];

    var _mask_count = 200;
    var _def_json = {
        dataType: 'JSON',
        contentType: 'application/json;charset=UTF-8',
        masking: false,
        type: "POST",
        success: function () {
        }
    };

    var _def_chart = {
        autoLoad: true,
        option: {},
        parsexAxisData: function () {
            return null;
        },
        parseLegendData: function () {
            return null;
        },
        parseSeriesData: function () {
            return [];
        },
        afterload: function () {
        },
        beforeload: function () {
        }
    };
    var Chart = function (opts) {
        var option = opts;
        var chart = echarts.init(opts.canvas);
        chart.setOption(opts.option);
        this.__defineGetter__('option', function () {
            return option;
        });
        this.__defineGetter__('chart', function () {
            return chart;
        });
        if (!!option.autoLoad) {
            this.reload({});
        }
    };

    Chart.prototype.reload = function (p) {
        var params = $.extend(true, {}, this.option.params, p);
        var opt = this.option;
        var chart = this.chart;
        opt.beforeload(params);
        bulemine.ajaxJson({
            url: opt.url,
            params: params,
            callback: function (ok, data, msg, opts) {
                if (ok) {
                    opt.afterload(ok, data, msg, opts);
                    var xaxis = opt.parsexAxisData(data, params);
                    if ((!!xaxis) && (xaxis.length > 0)) {
                        chart.setOption({
                            xAxis: [{
                                data: xaxis
                            }]
                        });
                    }
                    var series = chart.getOption().series;
                    var results = [];
                    var legenddata = null;
                    for (var result, i = 0, l = series.length; i < l; i++) {
                        result = {
                            yAxisIndex: i,
                            data: opt.parseSeriesData(i, data, series[i], params)
                        };
                        results.push(result);
                        if (legenddata == null) {
                            legenddata = opt.parseLegendData(i, data, series[i], params);
                        }
                    }
                    chart.setOption({
                        legend: {
                            data: legenddata
                        },
                        series: results
                    });
                } else {
                    alert('[ERROR]' + msg);
                }
            }
        });
    };

    var me = {
        queue: function () {
            var list = [];
            return {
                push: function (d) {
                    list.push(d);
                },
                each: function (fn) {
                    for (var i = 0, l = list.length; i < l; i++) {
                        if (!!fn(i, list[i])) {
                            return;
                        }
                    }
                }
            }
        },
        crumbs: function (list) {
            var txt = '';
            for (var i = 0, l = list.length; i < l; i++) {
                txt = list[i].record.tagText + ' / ' + txt;
            }
            return txt;
        },
        loader: function (init) {
            var len = LOAD_QUEUE.length;
            LOAD_QUEUE.push(init);
            return len;
        },
        charts: function (opts) {
            var options = $.extend({}, _def_chart, opts);
            return new Chart(options);
        },
        ajaxJson: function (opts) {
            var params = $.extend({}, _def_json, opts);

            if (!!params.masking) {
                var mask = $('<div class="window-mask request-mask" style="display: block; z-index: 9004; position: fixed;"><img src="/theme/default/images/loading2.gif"/></div>');
                params.mask = mask;
                $(document.body).append(mask);
            }
            params = $.extend(params, {
                data: opts.params,
                callback: function (status, data, msg, da) {
                    if (!!params.mask) {
                        params.mask.fadeTo(500, 0, function () {
                            params.mask = null;
                            $(this).remove();
                        });
                    }
                    opts.callback(status == 'success', data, msg, da, params);
                },
                success: function (data, status, jqXHR) {
                    if (data.status == '200') {
                        params.callback(status, data.result, data.message, data);
                    } else {
                        params.error(jqXHR, 'error', data.message);
                    }
                },
                error: function (request, status, error) {
                    params.callback(status, null, error);
                }
            });

            params.data = JSON.stringify(params.data);

            return $.ajax(params);
        }
    };
    $(function () {
        for (var i = 0, l = LOAD_QUEUE.length; i < l; i++) {
            LOAD_QUEUE[i](me);
        }
    });
    return me;
}());

$.extend({
    valueFrom: function (a, b, c) {
        if ((a === undefined) || (a === null))
            return b;
        return !c? a: (a+''=='')? b: a;
    },
    uuid: function () {
        var bits = new Date().getTime().toString(2);
        var stub = parseInt(Math.random() * 100000) & 0xFFFF;
        var low = parseInt(bits.substr(bits.length - 32, 32), 2);
        var high = parseInt(bits.substring(0, bits.length - 32), 2);
        return String(((high >>> 16) * 31) ^ (stub & 0xF)) + String((high & 0xFFFF) ^ ((stub & 0xF0) >> 4)) + String((low >>> 16) ^ ((stub & 0xF00) >> 8)) + String((low & 0xFFFF) ^ ((stub >> 12) * 31));
    }
});