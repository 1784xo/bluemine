/**
 * Created by hechao on 2018/8/29.
 */
$.extend(true, $.easyui, {
    formatter: {
        combobox: function (value, profile) {
            var data = profile.options.data;
            var txtf = profile.options.textField;
            var valf = profile.options.valueField;
            for (var i = 0, l = data.length; i < l; i++) {
                if (data[i][valf] == value) {
                    return data[i][txtf];
                }
            }
            return value;
        },
        number: function (num, form) {
            if (typeof form == 'string') {
                var high = parseInt(num);
                var low = String(num).substr(String(high).length);
                if (low != '') {
                    low = low.substr(1);
                }
                var fs = form.split('.');
                var len = String(high).length;
                fs[0] = (fs[0].length > len ? fs[0].concat(high).substr(len) : high);
                if (fs.length == 2) {
                    len = low.length;
                    fs[1] = (fs[1].length > len ? low.concat(fs[1].substr(len)) : low);
                } else if (low != '') {
                    fs.push(low);
                }
                return fs.join('.');
            } else if ($$(form, Number)) {
                return Number(parseFloat(num).toFixed(form)).toLocaleString();
            }
            throw ('IllegalArgumentException form:' + form);
        },
        date: function (date, format) {
            var year = String(date.getFullYear());
            return format.replace('yyyy', year).replace('yy', year.substr(year.length - Math.max(0, year.length - 2)))
                .replace('MM', this.number(date.getMonth() + 1, "00")).replace('dd', this.number(date.getDate(), '00')).replace('HH', this.number(date.getHours(), '00'))
                .replace('mm', this.number(date.getMinutes(), '00')).replace('ss', this.number(date.getSeconds(), '00'));
        }
    }
});

$.extend(true, $.fn.datagrid.defaults.editors, {
    linkbutton: {
        init: function (container, options) {
            var el = $('<span></span>');
            var input = $('<input width="0" height="0" type="hidden"/>').appendTo(el);
            $.each(options.button, function (i) {
                var me = this;
                $('<a href="javascript:;" class="datagrid-link">' + me.text + '</a>').bind('click', function (e) {
                    me.handler(input.val(), container, me, e, i);
                }).appendTo(el);
            });
            el.appendTo(container);
            return input;
        },
        destroy: function (target) {
            $(target).remove();
        },
        getValue: function (target) {
            return $(target).val();
        },
        setValue: function (target, value) {
            $(target).val(value);
        },
        resize: function (target, width) {
            $(target)._outerWidth(width);
        }
    }
});


$(function () {
    $(document.body).append('<img src="/theme/default/images/loading2.gif" width="0" height="0" border="0"/>');
});

(function ($) {
    var def_options = {
        separator: '/',
        format: 'yyyy-MM-dd',
        panelWidth: 'auto',
        panelHeight: 250,
        calendarWidth:250
    };

    var methods;

    function todate(o) {
        return typeof o == 'string' ? new Date(eval(o.replace(/\-/g, '+"-"+'))) : o;
    }

    function updateValuei(el, vals, opts) {
        var values = [$.easyui.formatter.date(vals[0], opts.format), $.easyui.formatter.date(vals[1], opts.format)];
        el.combo('setValues', values).combo('setText', values.join(opts.separator));
    }

    function prepare(el, opts) {
        var uid = $.uuid();

        var dates = ($.isArray(opts.value)
            ? opts.value
            : !opts.value
            ? el.val().split(opts.separator)
            : opts.value.split(opts.separator)).concat([new Date(), new Date()]);

        dates[0] = todate(dates[0]);
        dates[1] = todate(dates[1]);

        el.combo(opts).attr('data-range', uid);
        updateValuei(el, dates, opts);

        el.combo('textbox').parent('.combo').addClass('easyui-daterange');

        var form = $('<div class="easyui-calendar" ></div>').attr('data-range', uid).appendTo(document.body).calendar({
            width: opts.calendarWidth,
            border: false,
            height: '100%',
            onSelect: function (date) {
                var vals = el.combo('getValues');
                updateValuei(el, [date, new Date(vals[1])], opts);
            }
        }).calendar('moveTo', dates[0]);

        var to = $('<div class="easyui-calendar"></div>').attr('data-range', uid).appendTo(document.body).calendar({
            width: opts.calendarWidth,
            border: false,
            height: '100%',
            onSelect: function (date) {
                var vals = el.combo('getValues');
                updateValuei(el, [new Date(vals[0]), date], opts);
            }
        }).calendar('moveTo', dates[1]);

        var panelEl = el.combo('panel').addClass('easyui-datarange-panel');
        form.appendTo(panelEl);
        to.appendTo(panelEl);
    }

    $.fn.daterange = function (opts, p1, p2) {
        var meEl = this;
        if (opts instanceof Object) {
            var options = $.extend(true, {}, def_options, opts, {
                multivalue: true,
                editable: false
            });
            prepare(meEl, options);
        } else if (opts in methods) {
            return methods[opts](meEl, p1, p2);
        }
    }

    methods = $.fn.daterange.methods = {
        getValue:function (el) {
            return el.combo('getValues');
        }
    }
})(jQuery);



