$(function () {

    $('#btn_add').click(function () {
        $("#roleaddform").data('bootstrapValidator').resetForm();
        $('#roleaddform')[0].reset();
        var nodelist = $('#functionTree').treeview('getEnabled');
        $.each(nodelist, function (i, va2) {
            $("#functionTree").treeview("uncheckNode", va2.nodeId);
        });
    });
});

function savek() {
    var ids = getselecdnodes($('#functionTree'));
    if (ids == "") {
        toastr.warning("请配置权限！");
        return false;
    }
    $.ajax({
        url: basePath + "/role/add",
        contentType: 'application/json',
        type: 'post',
        data: JSON.stringify({
            'ids': ids,
            'rolename': $("#roleaddform input[name='rolename']").val(),
            'memo': $("#roleaddform").find("[name='memo']").val(),
            'roletype': $("#roleaddform input[name='roletype']:checked").val()
        }),
        success: function (data) {
            if (data == "success") {
                toastr.success("添加成功");
                $('#tb_role').bootstrapTable('refresh');
                $('#roleAddModal').modal('hide');
            } else {
                toastr.warning(data);
            }
        }
    });
}
