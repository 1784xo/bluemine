/**
 * Created by hechao on 2018/7/25.
 */
var bulemine = (function () {
    var LOAD_QUEUE = [];

    var _mask_count = 200;
    var _def_json = {
        dataType: 'JSON',
        contentType: 'application/json;charset=UTF-8',
        masking: false,
        payload: null,
        type: "POST",
        success: function () {
        }
    }

    var me = {
        loader: function (init) {
            var len = LOAD_QUEUE.length;
            LOAD_QUEUE.push(init);
            return len;
        },
        charts: function (opts) {
            if (!!opts.gradientDate) {
                opts.gradientDate.selectmenu();
            }
        },
        ajaxJson: function (opts) {
            var params = $.extend({}, _def_json, opts);

            if (!!params.masking) {
                var mask = $('<div class="ui-widget-overlay ui-front" style="z-index:' + (_mask_count++) + ';"><img src="/theme/dark-blue/images/loading2.gif"/></div>');
                params.mask = mask;
                $(document.body).append(mask);
            }
            params = $.extend(params, {
                data: opts.params,
                callback: function (status, data, msg) {
                    if (!!params.mask) {
                        params.mask.remove();
                    }
                    opts.callback(status == 'success', data, msg, params);
                },
                success: function (data, status, jqXHR) {
                    if (data.status == '200') {
                        params.callback(status, data.result, data.message);
                    } else {
                        params.error(jqXHR, 'error', data.message);
                    }
                },
                error: function (request, status, error) {
                    params.callback(status, null, error);
                }
            });

            if (!!opts.payload) {
                var req = {};
                req[opts.payload] = params.data;
                params.data = req;
            }

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

$.default = function (a, b) {
    return (((a + '') == '') || (a == undefined) || (a == null)) ? b : a;
};

var TAGTREE_DATA = [];
function loadTagTree(data) {
    if ((!!data) && (data.status == '200') && (!!data.result)) {
        TAGTREE_DATA = data.result;
    }
}