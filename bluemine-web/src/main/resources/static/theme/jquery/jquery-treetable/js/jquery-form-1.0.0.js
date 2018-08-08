/**
 * Created by hechao on 2018/8/8.
 */
(function ($) {
    var _def_form = {
        submit: $(),
        onSubmit: function () {
        }
    };

    function prepare(el, opts) {
        opts.submit.bind('click', function (e) {
            opts.onSubmit(el.form('getValues'), el, e, opts);
        });
        return opts;
    };
    var METHODS = {
        getValues: function () {
            var vals = {};
            var fields = this.find('[name]');
            for (var val, field, i = 0, l = fields.length; i < l; i++) {
                field = $(fields[i]);
                vals[field.attr('name')] = $.default(field.data('value'), field.val());
            }
            return vals;
        }
    };
    $.fn.form = function (opts, a, b, c, d, e) {
        var meEl = this;
        if (METHODS[opts]) {
            return METHODS[opts].apply(meEl, [a, b, c, d, e]);
        }
        if (opts instanceof Object) {
            var options = prepare(meEl, $.extend({}, _def_form, opts));
            meEl.data('option', options);
        } else {

        }
    };
})(jQuery);