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
        treeLeft: 0,
        treeWidth: 'auto',
        treeTitle: 'tree',
        treeMinWidth: 'auto',
        expanderLeft: 20,
        nodeTextField: 'nodeText',
        rootVisible: true,
        rootText: 'root',
        rowHeight: '2em',
        expand: false,
        onSelect: function () {
        }
    };

    var METHODS = {
        crumbs: function (table, row) {
            var list = [];
            var parentId;
            var parent = $(row);
            while (parent.size() > 0) {
                list.push({
                    target: parent[0],
                    record: parent.data('originData')
                });
                parentId = parent.data('parent');
                parent = table.find('tr[data-level="' + parentId + '"]');
            }
            return list;
        },
        selected: function (table) {
            var sel = table.find('tr.selected');
            var data;
            if (!!sel[0]) {
                data = sel.data('originData');
            }
            return {
                target: sel[0],
                record: data
            }
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
                tr.siblings('tr.selected-state').removeClass('selected-state').addClass('default-state');
                opts.onSelect(tr, e, tr.removeClass('default-state').addClass('selected-state').data('originData'));
            }
        },
        onClick: function (e, opts) {
            var el = $(e.target);
            var name = el.prop("tagName");
            if ((name == 'BUTTON') && (el.hasClass('expand-icon'))) {
                this.toggle(el.parents('tr[data-level]'), el);
            } else if ((name == "A") && (el.hasClass('column-item'))) {

            } else if (name == "TR") {

            } else {
                this.onSelect(el.parents('tr[data-level]'), el, opts);
            }
        }
    }

    function renderHeader(table, opts) {
        var tr = $('<tr><th>' + opts.treeTitle + '</th></tr>');
        tr.find('th').css('minWidth', opts.treeMinWidth).width(opts.treeWidth);
        table.append(tr);
        $.each(opts.columns, function (i) {
            var dt = $('<th>' + this.text + '</th>');
            dt.width(this.width);
            tr.append(dt);
        });
    }

    function renderNode(index, uid, pid, data, table, box, opts) {

        if (((!!opts.rootVisible) && (index == -1)) || (index >= 0)) {
            var tr = $('<tr class="default-state" data-level="' + uid + '" data-parent="' + pid + '"></tr>');
            tr.append('<td style="padding-left: ' + (Math.max(index, 0) * opts.expanderLeft + opts.treeLeft) + 'px;">' +
                '<span><button class="expand-icon">+</button>' + data[opts.nodeTextField] + '</span></td>');

            $.each(opts.columns, function (i) {
                var col = this;
                var td = $('<td><span></span></td>');
                if (!!col.items) {
                    $.each(col.items, function (j) {
                        var me = this;
                        var item = $('<a class="column-item"></a>')
                        if (!!me.iconCls) {
                            item.attr('title', me.title).addClass(me.iconCls).addClass('column-item-icon');
                        }
                        if (!!me.format) {
                            me.format(table, tr, item, data, me);
                        }
                        item.html(me.text);
                        item.bind('click', function () {
                            me.handler(table, tr, item, data, me);
                        });
                        td.find('span:first-child').append(item);
                    });
                } else {
                    var val = data[col.name];
                    if (!col.format) {
                        val = $.default(val, '&nbsp;');
                    } else {
                        val = col.format(val, data);
                    }
                    td.find('span:first-child').html(val);
                }
                tr.append(td);
            });

            tr.data({
                expand: opts.expand,
                originData: data
            });

            if (index > 0) {
                if (tr.data('expand')) {
                    tr.show();
                } else {
                    tr.hide();
                }
            }

            table.append(tr);
        }

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
        renderNode(opts.rootVisible ? 0 : -1, '0', 'null', data, table, box, opts);
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