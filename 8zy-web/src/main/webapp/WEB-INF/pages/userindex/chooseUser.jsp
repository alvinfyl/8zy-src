<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="myModal1u" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel1" aria-hidden="true" style="z-index: 1056;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModal1Label1">
                    选择用户
                </h4>
            </div>
            <!--<div class="modal-body">

                <div id="toolbar2" class="btn-group" style="padding-bottom: 5px;">
                    <label class="control-label col-sm-2" style="line-height: 32px;padding-right:0;"
                           for="scanname">用户名称:</label>
                    <div class="col-sm-5">
                        <input type="text" name="scanname" class="form-control " style="height: 32px;"
                               id="scanname">
                    </div>
                    <button id="query2" class="btn btn-default" title="查询">
                        <i class="glyphicon glyphicon-plus"></i> 查询
                    </button>
                    <button id="del2" class="btn btn-default" title="重置" onclick="$('#scanname').val('')">
                        <i class="glyphicon glyphicon-minus"></i> 重置
                    </button>
                </div>
                <table id="userlist1">
                </table>

            </div>-->
           
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
     <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <%--<button id="save1" type="button" class="btn btn-primary">
                    提交更改
                </button>--%>
            </div>
</div>
<script>


    function chooseuserid(sitid,setname,tresetForm) {
        $("#myModal1u").modal('show');
        $("#userlist1").bootstrapTable("destroy");
        $("#userlist1").bootstrapTable({
            url: basePath + "/user/queryCondition",
            method: "post",
            striped: true,
            cache: false,
            pagination: true,
            sortable: false,
            sidePagination: "server",
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20],
            striped: true,
            uniqueId: "id",
            clickToSelect: true,
            columns: [[{
                field: 'useren',
                title: '用户名',
                width: 1,
                align: 'center'
            }, {
                field: 'username',
                title: '用户姓名',
                width: 2,
                align: 'center'
            }]],
            onClickRow: function (rowData, rowIndex) {
                $(sitid).val(rowData.useren);
                $(setname).val(rowData.username);
                $("#myModal1u").modal('hide');
                if(tresetForm!=null){
                    $(tresetForm).data('bootstrapValidator').resetForm();
                }
            }
        })

        $("#query2").click(function () {
            var scanname = $('#scanname').val();
            $('#userlist1').bootstrapTable('refresh', {
                query:
                    {
                        username: scanname
                    }
            });

        })


    }


</script>
