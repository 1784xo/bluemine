/**
 * Created by hechao on 2018/8/3.
 */
(function ($) {
    var _editor = $('<div class="editor"><input /><button class="editor-ok">Y</button><button class="editor-cancel">N</button></div>');

    var _def_options = {
        expand: false,
        expanderLeft: 20,
        width: '100%',
        height: 'auto',
        nodeTextField: 'nodeText',
        treeLeft: 0,
        treeWidth: 'auto',
        treeTitle: 'tree',
        treeMinWidth: 'auto',
        treeEditor: false,
        rootVisible: true,
        rootText: 'root',
        rowHeight: '2em',
        afteredit: function () {
        },
        onSelect: function () {
        }
    };

    var METHODS = {
        updateCell:function () {
            console.log(arguments);
        },
        onCancelEditor: function (e, opts) {
            var tr = e.data('selected');
            if (!!tr) {
                e.detach();
                tr.find('.tree-node-text:first').html(tr.data('originData')[opts.nodeTextField]);
                opts.afteredit(tr, tr.data('originData'), null, e, opts);
            }
        },
        onOkEditor: function (e, opts) {
            var tr = e.data('selected');
            if (!!tr) {
                e.detach();
                var val = e.find('input').val();
                tr.find('.tree-node-text:first').html(val);
                var origin = tr.data('originData');
                origin[opts.nodeTextField] = val;
                var record = tr.data('recordData');
                record[opts.nodeTextField] = val;
                opts.afteredit(tr, origin, record, e, opts);
            }
        },
        crumbs: function (row) {
            var list = [];
            var parentId;
            var parent = $(row);
            while (parent.size() > 0) {
                list.push({
                    target: parent[0],
                    record: parent.data('originData')
                });
                parentId = parent.data('parent');
                parent = this.find('tr[data-level="' + parentId + '"]');
            }
            return list;
        },
        selected: function () {
            var sel = this.find('tr.selected-state');
            return {
                target: sel,
                data: sel.data()
            };
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
            var node = $('<td style="padding-left: ' + (Math.max(index, 0) * opts.expanderLeft + opts.treeLeft) + 'px;">' +
                '<button class="expand-icon">+</button><span data-column="'+opts.nodeTextField+'" class="tree-node-text" >' + data[opts.nodeTextField] + '</span></td>');
            tr.append(node);

            if (($.isFunction(opts.treeEditor) && opts.treeEditor(table, tr, data, opts)) || (opts.treeEditor === true)) {
                node.find('.tree-node-text').bind('dblclick', function () {
                    METHODS.onCancelEditor(_editor, opts);
                    $(this).html('').append(_editor);
                    _editor.data('selected', tr).find('input').focus().val(tr.data('originData')[opts.nodeTextField]);
                });
            }

            $.each(opts.columns, function (i) {
                var col = this;
                var td = $('<td><span data-column="'+$.default(col.name, '')+'"></span></td>');
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
                originData: data,
                recordData: {}
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

        _editor.find('.editor-cancel').bind('click', function () {
            METHODS.onCancelEditor(_editor, opts);
        });

        _editor.find('.editor-ok').bind('click', function () {
            METHODS.onOkEditor(_editor, opts);
        });

        opts = $.extend({}, opts);
        opts.rowHeight = $.isNumeric(opts.rowHeight) ? (opts.rowHeight + 'px') : opts.rowHeight;
        return opts;
    }

    $.fn.treetable = function (opts, a, b, c, d, e) {
        var me = this;
        if (METHODS[opts]) {
            return METHODS[opts].apply(this, [a, b, c, d, e]);
        } if(opts instanceof Object){
            var options = prepare($.extend({}, _def_options, opts));
            me.addClass('treetable-container');
            me.css('height', options.height).css('width', options.width);
            render(me, options);
            me.data('option', options);
        }else{

        }
    };

})(jQuery);