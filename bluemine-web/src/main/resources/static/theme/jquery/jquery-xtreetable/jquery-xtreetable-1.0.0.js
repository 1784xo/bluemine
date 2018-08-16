/**
 * Created by hechao on 2018/8/3.
 */
(function ($) {
    var _editor = $('<div class="editor"><input /><button class="editor-ok">Y</button><button class="editor-cancel">N</button></div>');

    var _def_options = {
        expand: false,
        width: '100%',
        height: 'auto',
        header: true,
        rowHeight: '2em',
        selectable: true,
        tree: {
            checked: false,
            title: 'tree',
            minWidth: 'auto',
            fieldName: 'node',
            whiteSpace: 0,
            editable: false,
            nodeSpace: 20,
            iconSize: 16,
            root: {
                visible: true,
                name: 'root',
                valueName: 'root',
                value: null,
                text: 'root'
            }
        },
        scroll: {
            overflowX: 'auto',
            overflowY: 'auto'
        },
        afteredit: function () {
        },
        onSelect: function () {
        }
    };

    var METHODS = {
        findCell: function (rowEl, name) {
            return rowEl.find('span[data-column="' + name + '"]');
        },
        updateCell: function (cellEl, val) {
            cellEl.empty();
            var rowEl = cellEl.parents('tr.default-state');
            var record = rowEl.data('originData');
            var opt = cellEl.data('option');
            if (!!opt.items) {
                $.each(opt.items, function (i) {
                    var item = this;
                    var itemEl = $('<a class="column-item"></a>');
                    if (!!item.iconCls) {
                        itemEl.attr('title', item.title).addClass(item.iconCls).addClass('column-item-icon');
                    }
                    if (!!item.render) {
                        item.render(rowEl, cellEl, itemEl, record, item);
                    }
                    if (!!item.text) {
                        itemEl.html(item.text);
                    }
                    if (!!item.handler) {
                        itemEl.bind('click', function () {
                            item.handler(rowEl, cellEl, itemEl, record, item);
                        });
                    }
                    cellEl.append(itemEl);
                });
            } else {
                if (!opt.format) {
                    val = $.default(val, '&nbsp;');
                } else {
                    val = opt.format(val, record);
                }
                cellEl.html(val);
            }
        },
        onCancelEditor: function (opts) {
            _editor.detach();
            var selected = _editor.data('selected');
            if (!!selected) {
                selected.cell.html(selected.cell.data('originValue'));
            }
        },
        onOkEditor: function (opts) {
            _editor.detach();
            var selected = _editor.data('selected');
            if (!!selected) {
                var val = _editor.find('input').val();
                var originValue = selected.cell.data('originValue');
                var data = selected.data;
                selected.cell.html(val);
                data[opts.tree.fieldName] = val;
                opts.afteredit(selected, opts.tree.fieldName, val, originValue, data, opts);
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
        checked: function () {
            var list=[];
            var checks = this.find('input.ui-checkboxradio:checked').parents('tr[data-index]');
            for (var i = 0, l = checks.length; i < l; i++) {
                list.push({
                    target:checks[i],
                    data:$(checks[i]).data()
                });
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
            e.addClass('tree-expand');
            tr.data('expand', true);
            var level = tr.data('level');
            var childs = tr.siblings('tr[data-parent="' + level + '"]');
            childs.show();
        },
        collapse: function (tr, e) {
            e.removeClass('tree-expand');
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
            if (!!opts.selectable) {
                if (tr.size() != 0) {
                    tr.siblings('tr.selected-state').removeClass('selected-state').addClass('default-state');
                    tr.removeClass('default-state').addClass('selected-state');
                    opts.onSelect(tr, e, tr.data('originData'));
                }
            }
        },
        onClick: function (e, opts) {
            var el = $(e.target);
            var name = el.prop("tagName");
            if ((name == 'BUTTON') && (el.hasClass('tree-expand-icon'))) {
                this.toggle(el.parents('tr[data-level]'), el);
            } else if ((name == "A") && (el.hasClass('column-item'))) {

            } else if (name == "TR") {

            } else {
                this.onSelect(el.parents('tr[data-level]'), el, opts);
            }
        },
        appendNode: function (parentEl, record) {
            var index = parentEl.data('index');
            var parent = parentEl.data('originData');
            var parentLevel = parentEl.data('level');
            var uid = parentLevel + '-' + parent.childrens.length;
            var meEl = $(this);
            var prevEl = parentEl.find('~tr[data-parent="' + parentLevel + '"]:last');
            renderNode(index + 1, uid, parentLevel, record, meEl, meEl.find('table.xtreetable'), prevEl.size() == 0 ? parentEl : prevEl, meEl.data('option'));
        }
    }

    function renderHeader(tableEl, opts) {
        if (opts.header) {
            var headEl = $('<tr><th>' + opts.tree.title + '</th></tr>');
            headEl.find('th').css({
                minWidth: opts.tree.minWidth,
                paddingLeft: opts.tree.whiteSpace
            }).width(opts.tree.width).height(opts.rowHeight);
            tableEl.append(headEl);
            $.each(opts.columns, function (i) {
                var thEl = $('<th>' + this.text + '</th>');
                thEl.width(this.width);
                headEl.append(thEl);
            });
            return headEl;
        }
    }

    function renderNode(index, uid, pid, data, meEl, tableEl, prevEl, opts) {

        var prev = prevEl;

        if (((!!opts.tree.root.visible) && (index == -1)) || (index >= 0)) {
            var rowEl = $('<tr class="default-state" data-index="' + index + '" data-level="' + uid + '" data-parent="' + pid + '"></tr>').data({
                expand: opts.tree.expand,
                originData: data
            });

            var height = Math.max(20, opts.rowHeight - 6);
            var mTop = ((opts.rowHeight - 16) / 2) - 3;

            var colEl = $('<td style="padding-left: ' + (Math.max(index, 0) * opts.tree.nodeSpace + opts.tree.whiteSpace) + 'px; height: ' + opts.rowHeight + 'px;">' +
                '<button class="tree-expand-icon ' + (opts.tree.expand ? 'tree-expand' : '') + '" type="button" style="margin-top:' + mTop + 'px;  height:' + opts.tree.iconSize + 'px; width:' + opts.tree.iconSize + 'px;"></button>' +
                '<div class="tree-node-text" data-column="' + opts.tree.fieldName + '" style="height:' + height + 'px; line-height:' + height + 'px;">' + data[opts.tree.fieldName] + '</div></td>');

            rowEl.append(colEl);

            if (!!opts.tree.checked) {
                var checkbox = $('<div class="tree-checkbox" style="margin-top:' + mTop + 'px;">' +
                    '<label class="tree-checkbox-label" for="level_' + uid + '"></label>' +
                    '<input id="level_' + uid + '" type="checkbox"/></div>');
                colEl.prepend(checkbox);
                checkbox.find('input').checkboxradio();
            }

            if (($.isFunction(opts.tree.editable) && opts.tree.editable(tableEl, rowEl, data, opts)) || (opts.tree.editable === true)) {
                colEl.find('.tree-node-text').bind('dblclick', function () {
                    METHODS.onCancelEditor(opts);
                    var val = rowEl.data('originData')[opts.tree.fieldName];
                    var cellEl = $(this).data('originValue', val);
                    cellEl.empty().append(_editor);
                    _editor.data('selected', {
                        'data': data,
                        'cell': cellEl
                    }).find('input').focus().val(val);
                });
            }

            $.each(opts.columns, function (i) {
                var cellEl = $('<span data-column="' + $.default(this.name, '') + '"></span>');
                cellEl.data('option', this);
                colEl = $('<td></td>').append(cellEl);
                rowEl.append(colEl);
                METHODS.updateCell(cellEl, data[this.name]);
            });

            if (index > 0) {
                if (rowEl.data('expand')) {
                    rowEl.show();
                } else {
                    rowEl.hide();
                }
            }

            if (prev == null) {
                tableEl.append(rowEl);
            } else {
                prev.after(rowEl);
                prev = rowEl;
            }
        }

        var childs = data.childrens;
        for (var child, i = 0, l = childs.length; i < l; i++) {
            child = childs[i];
            prev = renderNode(index + 1, uid + '-' + (i + 1), uid, child, meEl, tableEl, prev, opts);
        }
        return prev;
    }

    function render(meEl, opts) {
        var tableEl = $('<table class="xtreetable" cellpadding="0" cellspacing="0"  border="0"></table>');
        meEl.append(tableEl);
        tableEl.bind('click', function (e) {
            METHODS.onClick(e, opts);
        });

        var headEl = renderHeader(tableEl, opts);
        var data = {
            childrens: opts.data
        };
        data[opts.tree.fieldName] = opts.tree.root.text;
        data[opts.tree.root.valueName] = opts.tree.root.value;
        renderNode(opts.tree.root.visible ? 0 : -1, '0', 'null', data, meEl, tableEl, headEl, opts);
    }

    function prepare(opts) {

        _editor.find('.editor-cancel').bind('click', function () {
            METHODS.onCancelEditor(opts);
        });

        _editor.find('.editor-ok').bind('click', function () {
            METHODS.onOkEditor(opts);
        });

        opts = $.extend(true, {}, opts);

        return opts;
    }

    $.fn.xtreetable = function (opts, a, b, c, d, e) {
        var meEl = this;
        if (METHODS[opts]) {
            return METHODS[opts].apply(meEl, [a, b, c, d, e]);
        }
        if (opts instanceof Object) {
            var options = prepare($.extend(true, {}, _def_options, opts));
            meEl.addClass('xtreetable-container');
            meEl.css(options.scroll).css('height', options.height).css('width', options.width);
            render(meEl, options);
            meEl.data('option', options);
        } else {

        }
    };

})(jQuery);