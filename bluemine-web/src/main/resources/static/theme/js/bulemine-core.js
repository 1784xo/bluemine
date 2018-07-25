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
        }
    };
    $(function () {
        for (var i = 0, l = LOAD_QUEUE.length; i < l; i++) {
            LOAD_QUEUE[i](me);
        }
    });
    return me;
}());