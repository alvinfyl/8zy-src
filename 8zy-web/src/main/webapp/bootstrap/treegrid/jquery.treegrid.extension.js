(function ($) {
    "use strict";

    $.fn.treegridData = function (options, param) {
        //如果是调用方法
        if (typeof options == 'string') {
            return $.fn.treegridData.methods[options](this, param);
        }

        //如果是初始化组件
        options = $.extend({}, $.fn.treegridData.defaults, options || {});
        var target = $(this);
        //debugger;
        //得到根节点
        target.getRootNodes = function (data) {
            var result = [];
            $.each(data, function (index, item) {
                //if (item[options.parentColumn]) {
                //if (item[options.parentColumn]==0||item[options.parentColumn]==1) {//安信项目根节点为0或者1
                var pid = item[options.parentColumn];
                if(pid==null||pid=="0"||pid==0||pid==""){
                    result.push(item);
                }

            });
            return result;
        };

        var j = 1;
        //递归获取子节点并且设置子节点
        target.getChildNodes = function (data, parentNode, parentIndex, tbody) {
            $.each(data, function (i, item) {
                if (item[options.parentColumn] == parentNode[options.id]) {
                    var tr = $('<tr></tr>');
                    var nowParentIndex =   item[options.id];
                    tr.addClass('treegrid-' + nowParentIndex);
                    tr.addClass('treegrid-parent-' + parentIndex);
                    tr.attr("deptid",item[options.id]);//增加id属性
                    $.each(options.columns, function (index, column) {
                        var td = $('<td></td>');
                        td.text(item[column.field]);
                        tr.append(td);
                    });
                    tbody.append(tr);
                    target.getChildNodes(data, item, nowParentIndex, tbody)

                }
            });
        };
        target.addClass('table');
        if (options.striped) {
            target.addClass('table-striped');
        }
        if (options.bordered) {
            target.addClass('table-bordered');
        }
        if (options.url) {
            $.ajax({
                type: options.type,
                url: options.url,
                data: options.ajaxParams,
                dataType: "JSON",
                success: function (data, textStatus, jqXHR) {
                    //debugger;
                    //构造表头
                    var thr = $('<tr></tr>');
                    $.each(options.columns, function (i, item) {
                        var th = $('<th style="padding:10px;"></th>');
                        th.text(item.title);
                        thr.append(th);
                    });
                    var thead = $('<thead></thead>');
                    thead.append(thr);
                    target.append(thead);

                    //构造表体
                    var tbody = $('<tbody></tbody>');
                    var rootNode = target.getRootNodes(data);
                    $.each(rootNode, function (i, item) {
                        var tr = $('<tr></tr>');
                        var tid = item[options.id];
                        tr.addClass('treegrid-' + tid);
                        tr.attr("deptid",item[options.id]);
                        $.each(options.columns, function (index, column) {
                            var td = $('<td></td>');
                            td.text(item[column.field]);
                            tr.append(td);
                        });
                        tbody.append(tr);
                        target.getChildNodes(data, item, tid, tbody);
                    });
                    target.append(tbody);
                    target.treegrid();
                    if (!options.expandAll) {
                        target.treegrid('collapseAll');
                    }

                    if(options.onloaddata){
                        //console.info(data);
                        options.onloaddata(data);
                    }

                    target.find("tr").click(function () {
                        if(options.checkcoloer){//点击颜色
                            var isha = $(this).hasClass("mybackcoloer");
                            target.find("tr").removeClass("mybackcoloer");
                            if(isha){
                                $(this).removeClass("mybackcoloer");
                            }else{
                                $(this).addClass("mybackcoloer");
                            }

                        }
                        if(options.onClickRow){//点击事件ff
                            var rowitem;
                            var thistr = $(this);
                            $.each(data, function (index, item) {
                                if(thistr.attr("deptid")==item[options.id]){
                                    rowitem = item
                                }
                            });
                            options.onClickRow($(this),rowitem,data,$(this).hasClass("mybackcoloer"));
                        }


                    });


                }
            });
        }
        else {
            //也可以通过defaults里面的data属性通过传递一个数据集合进来对组件进行初始化....有兴趣可以自己实现，思路和上述类似
        }
        return target;
    };

    $.fn.treegridData.methods = {
        getAllNodes: function (target, data) {
            return target.treegrid('getAllNodes');
        },
        //组件的其他方法也可以进行类似封装........
    };

    $.fn.treegridData.defaults = {
        id: 'Id',
        parentColumn: 'ParentId',
        data: [],    //构造table的数据集合
        type: "GET", //请求数据的ajax类型
        url: null,   //请求数据的ajax的url
        ajaxParams: {}, //请求数据的ajax的data属性
        expandColumn: null,//在哪一列上面显示展开按钮
        expandAll: true,  //是否全部展开
        striped: false,   //是否各行渐变色
        bordered: false,  //是否显示边框
        columns: [],
        expanderExpandedClass: 'glyphicon glyphicon-chevron-down',//展开的按钮的图标
        expanderCollapsedClass: 'glyphicon glyphicon-chevron-right'//缩起的按钮的图标
    };



})(jQuery);