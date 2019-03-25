<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 添加 模态框（Modal） -->
<div class="modal fade" id="modal_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width:800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" id="closeEdit" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title editUser" id="emyModalLabel">
                    修改
                </h4>
            </div>
            <div class="modal-body">
                <form id="EditForm">
                    <input type="hidden" name="id"/>
                    <table class="table table-striped" style="font-size:14px;">
                        <tbody>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">名称:</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" name="name">
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">排序:</label>
                                    <div class="col-sm-7">
                                        <input type="number" class="form-control " name="indexs">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="gatewawEdit" onclick="$('#EditForm').submit()">
                    保存
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
    //  转义


    $(function () {
        editvalr();

        //编辑
        $("#btn_edit").click(function () {
            var ids = [];
            var node = $("#gateTable").bootstrapTable('getSelections');
            for (var i = 0; i < node.length; i++) {
                ids.push(node[i].id);
            }
            if (ids.length == 0) {
                toastr.warning('必须选择一个进行查看或编辑');
                return;
            }
            if (ids.length > 1) {
                toastr.warning('只能选择一个进行查看或编辑');
                return;
            }
            $('#EditForm')[0].reset();
            $('#EditForm').find("[name='id']").val(htmlDecode(node[0].id));
            $('#EditForm').find("[name='name']").val(htmlDecode(node[0].name));
            $('#EditForm').find("[name='indexs']").val(htmlDecode(node[0].indexs));
            $('#modal_edit').modal('show');
        });
        $('#modal_edit').on('show.bs.modal', function () {
            $("#EditForm").data('bootstrapValidator').destroy();
            $('#EditForm').data('bootstrapValidator', null);
            editvalr();
        });
    });
    var notedit = true;

    function saveedit() {
        if (notedit) {
            notedit = false;
            $.ajax({
                url: basePath + '/llanguage/edit',
                contentType: 'application/json',
                type: 'post',
                data: JSON.stringify($('#EditForm').serializeJSON()),
                success: function (data) {
                    notedit = true;
                    if (data == "success") {
                        toastr.success("修改成功");
                        $('#modal_edit').modal('hide');
                        $('#gateTable').bootstrapTable('refresh');
                    } else {
                        toastr.warning("修改" + data);
                    }
                }
            });
        }
    }


    function editvalr() {
        $('#EditForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {}
        }).on("success.form.bv", function (e) {
            saveedit();
            return false;
        });
    }

</script>

