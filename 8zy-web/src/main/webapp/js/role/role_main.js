$(function () {
    init();
    initTree();
});

function init() {
    $("#tb_role").bootstrapTable({
        url: basePath + "/role/search",
        method: "post",
        toolbar: '#toolbar',
        striped: true,
        cache: false,
        pagination: false,
        search: false,
        showColumns: true,
        showRefresh: true,
        minimumCountColumns: 2,
        clickToSelect: true,
        uniqueId: "id",
        showToggle: true,
        singleSelect: true,
        columns: [[{
            checkbox: true
        }, {
            field: 'rolename',
            title: '名称',
            width: 150
        }, {
            field: 'memo',
            title: '描述',
            width: 150
        }, {
            field: 'createtime',
            title: '创建时间',
            width: 150,
            formatter: function (value, row, index) {
                return dfYmdhms(value)
            }
        }, {
            field: 'createuser',
            title: '创建人',
            width: 150
        }]]
    });
}

function doDelete() {

    var ids = [];
    var roles = $('#tb_role').bootstrapTable('getSelections');
    for (var i = 0; i < roles.length; i++) {
        ids.push(roles[i].id);
    }
    ids.join(",")
    if (ids.length == 0) {
        toastr.warning('必须选择需要删除的数据');
        return;
    }
    if (ids.length > 1) {
        toastr.warning("提示", "一次只能删除一个角色");
        return;
    }
    var id = ids.toString();
    if (id != null) {
        show_confirm("提示框", "确认删除吗?", function (result) {
            if (result) {
                $.ajax({
                    url: basePath + '/role/del/' + id,
                    success: function (data) {
                        if (data == 'success') {
                            toastr.success("删除成功");
                            $('#tb_role').bootstrapTable('refresh');
                        }
                        else {
                            toastr.warning('提示 删除失败,' + data);
                        }
                    }
                });
            }
        });
    }
}

function initTree() {
    var thetree = $('#functionTree');
    var ethetree = $('#efunctionTree');
    // 授权树初始化
    $.ajax({
        url: basePath + '/function/initFunctionTree',
        type: 'POST',
        dataType: 'text',
        success: function (result) {
            result = JSON.parse(result);
            thetree.treeview({
                data: result,         // 数据源
                showCheckbox: true,   //是否显示复选框
                highlightSelected: true,    //是否高亮选中
                nodeIcon: 'glyphicon glyphicon-user',    //节点上的图标
                nodeIcon: 'glyphicon glyphicon-globe',
                emptyIcon: '',    //没有子节点的节点图标
                /*  multiSelect: true,    //多选*/
                onNodeChecked: function (event, node) {
                    var selectNodes = getChildNodeIdArr(node); //获取所有子节点
                    if (selectNodes.length > 0) { //子节点不为空，则选中所有子节点
                        thetree.treeview('checkNode', [selectNodes, {silent: true}]);
                    }
                    var parentNode = thetree.treeview("getNode", node.parentId);
                    setParentNodeCheck(node, thetree);
                },
                onNodeUnchecked: function (event, node) { //取消选中节点
                    var selectNodes = getChildNodeIdArr(node); //获取所有子节点
                    if (selectNodes.length > 0) { //子节点不为空，则取消选中所有子节点
                        thetree.treeview('uncheckNode', [selectNodes, {silent: true}]);
                    }
                },
                onNodeExpanded: function (event, data) {
                },
                onNodeSelected: function (event, data) {
                    //alert(data.nodeId);
                }
            });
            shousuo(thetree);

            //编辑的+++
            ethetree.treeview({
                data: result,         // 数据源
                showCheckbox: true,   //是否显示复选框
                highlightSelected: true,    //是否高亮选中
                nodeIcon: 'glyphicon glyphicon-user',    //节点上的图标
                nodeIcon: 'glyphicon glyphicon-globe',
                emptyIcon: '',    //没有子节点的节点图标
                /*  multiSelect: true,    //多选*/
                onNodeChecked: function (event, node) {
                    var selectNodes = getChildNodeIdArr(node); //获取所有子节点
                    if (selectNodes.length > 0) { //子节点不为空，则选中所有子节点
                        ethetree.treeview('checkNode', [selectNodes, {silent: true}]);
                    }
                    var parentNode = ethetree.treeview("getNode", node.parentId);
                    setParentNodeCheck(node, ethetree);
                },
                onNodeUnchecked: function (event, node) { //取消选中节点
                    var selectNodes = getChildNodeIdArr(node); //获取所有子节点
                    if (selectNodes.length > 0) { //子节点不为空，则取消选中所有子节点
                        ethetree.treeview('uncheckNode', [selectNodes, {silent: true}]);
                    }
                },
                onNodeExpanded: function (event, data) {
                },
                onNodeSelected: function (event, data) {
                    //alert(data.nodeId);
                }
            });
            shousuo(ethetree);

        },
        error: function (msg) {

        }
    });
}


function shousuo(obj) {
    obj.treeview('collapseAll', {silent: true});
}

function zhankai(obj) {
    obj.treeview('expandAll', {silent: true});
}

function getChildNodeIdArr(node) {
    var ts = [];
    if (node.nodes) {
        for (x in node.nodes) {
            ts.push(node.nodes[x].nodeId);
            if (node.nodes[x].nodes) {
                var getNodeDieDai = getChildNodeIdArr(node.nodes[x]);
                for (j in getNodeDieDai) {
                    ts.push(getNodeDieDai[j]);
                }
            }
        }
    } else {
        ts.push(node.nodeId);
    }
    return ts;
}

function setParentNodeCheck(node, obj) {
    var parentNode = obj.treeview("getNode", node.parentId);
    if (parentNode.nodes) {
        var checkedCount = 0;
        for (x in parentNode.nodes) {
            if (parentNode.nodes[x].state.checked) {
                checkedCount++;
            } else {
                break;
            }
        }
        if (checkedCount === parentNode.nodes.length) {
            obj.treeview("checkNode", parentNode.nodeId);
            setParentNodeCheck(parentNode, obj);
        }
    }
}

function getselecdnodes(obj) {
    var resu = "";
    var nodelist = obj.treeview('getEnabled');
    $.each(nodelist, function (i, val) {
        if (val.state && val.state.checked == true) {
            resu += val.id + ","
        }
    });
    return resu;
}