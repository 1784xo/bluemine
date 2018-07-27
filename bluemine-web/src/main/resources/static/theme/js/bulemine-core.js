/**
 * Created by hechao on 2018/7/25.
 */
var bulemine = (function () {
    var LOAD_QUEUE = [];
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
        }
    };
    $(function () {
        for (var i = 0, l = LOAD_QUEUE.length; i < l; i++) {
            LOAD_QUEUE[i](me);
        }
    });
    return me;
}());

(function ($) {
    var def_options = {
        width: '100%',
        height: 'auto',
        treeWidth: 200,
        rowHeight: '2em',
        expanderLeft: 20,
        expand: false
    };

    var METHODS = {
        expand:function (table, tbody, e) {
            var level= tbody.data('level');
            var childs = table.find('tbody[data-level^="'+(level+'-')+'"]');
            childs.show();
            e.data('expand', true);
        },
        collapse:function (table, tbody, e) {
            var level= tbody.data('level');
            var childs = table.find('tbody[data-level^="'+(level+'-')+'"]');
            childs.hide();
            e.data('expand', false);
        }
    }

    function renderHeader(table, opts) {
        var treeT = $('<tbody class="treetable-title"><tr><th>树</th></tr></tbody>');
        table.append(treeT);
        var fields = opts.fields;
        for (var i = 0, l = fields.length; i < l; i++) {
            var dt = $('<th>' + fields[i].text + '</th>');
            //TODO:+列宽
            table.find('tr').append(dt);
        }
    }

    function renderNode(index, uid, data, table, box, opts) {
        if (index > 0) {
            var tbody=$('<tbody class="treetable-tbody"  data-level="' + uid + '"></tbody>');
            var tr = $('<tr></tr>');
            tbody.append(tr);
            table.append(tbody);

            tr.append('<td style="padding-left: ' + (Math.max(0, index - 1) * opts.expanderLeft) + 'px;">' +
                '<span><button>+</button>' + data[opts.nodeTextField] + '</span></td>');

            tr.find('button').data('expand', opts.expand).bind('click', function (e) {
                var me = $(this);
                if(!me.data('expand')){
                    METHODS.expand(table, tbody, me);
                }else{
                    METHODS.collapse(table, tbody, me);
                }
            });

            var fields = opts.fields;
            for (var i = 0, l = fields.length; i < l; i++) {
                var dd = $('<td><span class="expand">' + data[fields[i].name] + '</span></td>');
                tr.append(dd);
            }
        }
        var childs = data.childrens;
        for (var child, i = 0, l = childs.length; i < l; i++) {
            child = childs[i];
            renderNode(index + 1, index == 0 ? (i + 1) : uid + '-' + (i + 1), child, table, box, opts);
        }
    }

    function render(box, opts) {
        var table = $('<table class="treetable" cellpadding="0" cellspacing="0"  border="0"></table>');
        box.append(table);
        renderHeader(table, opts);
        var data = {
            childrens: opts.data
        };
        renderNode(0, 0, data, table, box, opts);
    }

    function prepare(opts) {
        opts = $.extend({}, opts);
        opts.rowHeight = $.isNumeric(opts.rowHeight) ? (opts.rowHeight + 'px') : opts.rowHeight;
        return opts;
    }

    $.fn.treetable = function (opts) {
        var options = prepare($.extend({}, def_options, opts));
        var me = this;
        me.addClass('treetable-container');
        me.css('height', options.height).css('width', options.width);
        render(me, options);
    };

})(jQuery);

var TAGTREE_DATA = [];
function loadTagTree(data) {
    if ((!!data) && (data.status == '200') && (!!data.result)) {
        TAGTREE_DATA = data.result;
    }
}