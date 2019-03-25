$(function () {
//  转义
    function htmlDecode(value) {
        if (value) {
            return $('<div />').html(value).text();
        } else {
            return '';
        }
    }
    $('#btn_edit').click(function () {
        $("#roleeditform").data('bootstrapValidator').resetForm();
        $('#roleeditform')[0].reset();
        var nodelist = $('#efunctionTree').treeview('getEnabled');
        $.each(nodelist, function (i, va2) {
            $("#efunctionTree").treeview("uncheckNode", va2.nodeId);
        });
        var ids = [];
        var roles = $("#tb_role").bootstrapTable('getSelections');

        for (var i = 0; i < roles.length; i++) {
            ids.push(roles[i].id);
        }

        if (ids.length == 0) {
            toastr.warning('必须选择一个进行查看或编辑');
            return;
        }
        if (ids.length > 1) {
            toastr.warning('只能选择一个进行查看或编辑');
            return;
        }
        var id = ids.toString();
        $("#roleid").val(id);
        $.ajax({
            url: basePath + "/role/view",
            contentType: 'application/json',
            type: 'post',
            data: JSON.stringify({
                'id': id
            }),
            success: function (role) {
                var role = JSON.parse(role);
                $("#roleeditform input[name='rolename']").val(htmlDecode(role.rolename));
                $("#roleeditform").find("[name='memo']").val(htmlDecode(role.memo));
                $("#roleeditform input[name='roletype']").each(function () {
                    if ($(this).val() == role.roletype) {
                        $(this).prop("checked", true);
                    }
                });
                getNodes(id);


            }
        });
        $('#eroleModal').modal('show');
    });

});

function getNodes(roleId) {
    $.ajax({
        url: basePath + '/function/getSelectionFunctions',
        contentType: 'application/json',
        type: 'post',
        data: JSON.stringify({
            'roleId': roleId
        }),
        success: function (data) {
            var list = JSON.parse(data);
            var nodelist = $('#efunctionTree').treeview('getEnabled');
            $.each(nodelist, function (i, node) {
                $.each(list, function (i, val1) {
                    if (val1.id == node.id) {
                        var selectNodes = getChildNodeIdArr(node); //获取所有子节点
                        if (selectNodes.length>0) { //子节点不为空，则选中所有子节点
                            $("#efunctionTree").treeview("checkNode", node.nodeId);
                            $('#efunctionTree').treeview('uncheckNode', [selectNodes, {silent: true}]);
                        }
                    }
                });
            });
            $.each(nodelist, function (i, node) {
                $.each(list, function (i, val1) {
                    if (val1.id == node.id) {
                        //console.info(node.id);
                        var selectNodes = getChildNodeIdArr(node); //获取所有子节点
                        if (selectNodes.length>0) { //子节点不为空，则选中所有子节点

                        }else{
                            $("#efunctionTree").treeview("checkNode", node.nodeId);
                        }
                    }
                });
            });
        }
    });
}


function editsavek22() {
    var ids = getselecdnodes($('#efunctionTree'));
    if (ids == "") {
        toastr.warning("请配置权限！");
        return false;
    }
    var roleid =   $("#roleid").val();
    if(roleid==""){
        toastr.warning("角色id不存在");
        return false;
    }
    $.ajax({
        url: basePath + "/role/edit",
        contentType: 'application/json',
        type: 'post',
        data: JSON.stringify({
            'ids': ids,
            'rolename': $("#roleeditform input[name='rolename']").val(),
            'memo': $("#roleeditform").find("[name='memo']").val(),
            'roletype': $("#roleeditform input[name='roletype']:checked").val(),
            'roleid':roleid
        }),
        success: function (data) {
            if (data == "success") {
                toastr.success("编辑成功");
                $('#tb_role').bootstrapTable('refresh');
                $('#eroleModal').modal('hide');
            } else {
                toastr.warning(data);
            }
        }
    });
}