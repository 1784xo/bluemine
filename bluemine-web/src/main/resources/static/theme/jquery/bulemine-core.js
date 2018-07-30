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

$.default = function (a, b) {
    return (((a + '') == '') || (a == undefined) || (a == null)) ? b : a;
};

(function ($) {
    var def_options = {
        width: '100%',
        height: 'auto',
        treeWidth: 200,
        rowHeight: '2em',
        expanderLeft: 20,
        nodeTextField: 'nodeText',
        rootText: 'root',
        expand: false,
        onSelect: function () {
        }
    };

    var METHODS = {
        crumbs: function (table, row) {
            var list = [];
            var parentId;
            var parent = row;
            while (parent.size() > 0) {
                list.push(parent.data('originData'));
                parentId = parent.data('parent');
                parent = table.find('tr[data-level="' + parentId + '"]');
            }
            return list;
        },
        expand: function (tr, e) {
            tr.data('expand', true);
            var level = tr.data('level');
            var childs = tr.siblings('tr[data-parent="' + level + '"]');
            childs.show();
        },
        collapse: function (tr, e) {
            tr.data('expand', false);
            var level = tr.data('level');
            var childs = tr.siblings('tr[data-level^="' + (level + '-') + '"]');
            childs.each(function () {
                $(this).hide().data('expand', false);
            });
        },
        toggle: function (tr, e) {
            if (tr.data('expand')) {
                this.collapse(tr, e);
            } else {
                this.expand(tr, e);
            }
        },
        onSelect: function (tr, e, opts) {
            if (tr.size() != 0) {
                tr.siblings('tr.selected').removeClass('selected');
                opts.onSelect(tr, e, tr.addClass('selected').data('originData'));
            }
        },
        onClick: function (e, opts) {
            var el = $(e.target);
            var name = el.prop("tagName");
            if ((name == 'BUTTON') && (el.hasClass('expand-icon'))) {
                this.toggle(el.parents('tr[data-level]'), el);
            } else if (name == "TR") {

            } else {
                this.onSelect(el.parents('tr[data-level]'), el, opts);
            }
        }
    }

    function renderHeader(table, opts) {
        var tr = $('<tr><th>树</th></tr>');
        table.append(tr);
        var fields = opts.fields;
        for (var i = 0, l = fields.length; i < l; i++) {
            var dt = $('<th>' + fields[i].text + '</th>');
            //TODO:+列宽
            tr.append(dt);
        }
    }

    function renderNode(index, uid, pid, data, table, box, opts) {
        // if (index > 0) {

        var tr = $('<tr data-level="' + uid + '" data-parent="' + pid + '"></tr>');
        tr.data({
            expand: opts.expand,
            originData: data
        });
        table.append(tr);

        tr.append('<td style="padding-left: ' + (index * opts.expanderLeft) + 'px;">' +
            '<span><button class="expand-icon">+</button>' + data[opts.nodeTextField] + '</span></td>');

        var fields = opts.fields;
        for (var i = 0, l = fields.length; i < l; i++) {
            var dd = $('<td><span class="expand">' + $.default(data[fields[i].name], '') + '</span></td>');
            tr.append(dd);
        }
        // }

        var childs = data.childrens;
        for (var child, i = 0, l = childs.length; i < l; i++) {
            child = childs[i];
            renderNode(index + 1, uid + '-' + (i + 1), uid, child, table, box, opts);
        }
    }

    function render(box, opts) {
        var table = $('<table class="treetable" cellpadding="0" cellspacing="0"  border="0"></table>');
        box.append(table);
        table.bind('click', function (e) {
            METHODS.onClick(e, opts);
        });

        renderHeader(table, opts);
        var data = {
            childrens: opts.data
        };
        data[opts.nodeTextField] = opts.rootText;
        renderNode(0, 0, -1, data, table, box, opts);
    }

    function prepare(opts) {
        opts = $.extend({}, opts);
        opts.rowHeight = $.isNumeric(opts.rowHeight) ? (opts.rowHeight + 'px') : opts.rowHeight;
        return opts;
    }

    $.fn.treetable = function (opts, val) {
        var me = this;
        if (METHODS[opts]) {
            return METHODS[opts](me, val);
        } else {
            var options = prepare($.extend({}, def_options, opts));
            me.addClass('treetable-container');
            me.css('height', options.height).css('width', options.width);
            render(me, options);
        }
    };

})(jQuery);

var TAGTREE_DATA = [];
function loadTagTree(data) {
    if ((!!data) && (data.status == '200') && (!!data.result)) {
        TAGTREE_DATA = data.result;
    }
}