<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 添加 模态框（Modal） -->
<div class="modal fade" id="modal_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width:800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" id="closeEdit" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title editUser" id="emyModalLabel">
                    新增
                </h4>
            </div>
            <div class="modal-body">
                <form id="AddForm">
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
                <button type="button" class="btn btn-primary" onclick="$('#AddForm').submit()">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>

    $(function() {
        addvalr();
    });
    function saveadd() {
        $.ajax({
            url : basePath + '/ltype/add',
            contentType: 'application/json',
            type : "POST",
            data: JSON.stringify($('#AddForm').serializeJSON()),
            success : function(data) {
                if(data == "success") {
                    toastr.success("添加成功");
                    $('#AddForm')[0].reset();
                    $('#modal_add').modal('hide');
                    $('#gateTable').bootstrapTable('refresh');
                } else {
                    toastr.warning(data);
                }
            }
        });
    }


    /**
     * 校验
     */
    function addvalr() {
        $('#AddForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            }
        }).on("success.form.bv",function(e){
            saveadd();
            return false;
        });
    }


</script>


