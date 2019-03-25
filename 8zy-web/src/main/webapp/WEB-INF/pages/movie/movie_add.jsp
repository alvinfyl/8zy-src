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
                                    <label class="col-sm-3 control-label">主图:</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="mainimg">
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">标题:</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control " name="title">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">描述:</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="describes">
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">别名:</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control " name="alias">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">演员列表:</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control " name="lPerformers">
                                        <%--  <select class="form-control" name="lPerformers">
                                              <option value="1">演员列表</option>
                                          </select>--%>
                                    </div>
                                    <div class="col-sm-1">
                                        <button class="btn btn-primary btnc" type="button" onclick="toaddlabel('AddForm','lPerformers','演员','/lperformers/queryall','name','id','indexs')">添加</button>
                                    </div>
                                </div>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">类型:</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" name="lType">
                                            <option value="1">类型</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-1">
                                        <button class="btn btn-primary btnc" type="button">添加</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">区域:</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" name="lArea">
                                            <option value="1">区域</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-1">
                                        <button class="btn btn-primary btnc" type="button">添加</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">语言类型:</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" name="lLanguage">
                                            <option value="1">lLanguage</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-1">
                                        <button class="btn btn-primary btnc" type="button">添加</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">导演:</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" name="lDirector">
                                            <option value="1">导演</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-1">
                                        <button class="btn btn-primary btnc" type="button">添加</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>

                            <td>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">上映日期:</label>
                                    <div class="col-sm-9">
                                        <input type="date" class="form-control " data-format="yyyy-MM-dd"
                                               name="releasedate">
                                    </div>
                                </div>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">片长:</label>
                                    <div class="col-sm-9">
                                        <input type="number" class="form-control " name="runningtime">
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">豆瓣评分:</label>
                                    <div class="col-sm-9">
                                        <input type="number" class="form-control " name="score" min="0.0" step="0.1">
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">豆瓣链接:</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control " name="dblink">
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">视频截图:</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control " name="detailimg">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 64px;">
                            <td colspan="2">
                                <div class="form-group" style="position: relative;">
                                    <label class="control-label"
                                           style="width:23%;position: absolute;top: 0px;left:16px;">剧情介绍:</label>
                                    <div style="width:75%;position: absolute;top: 0px;left: 167px;">
                                        <textarea type="text" class="form-control " name="introduction"></textarea>
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
    $(function () {

    });

    function saveadd() {
        $.ajax({
            url: basePath + '/movie/addMovie',
            contentType: 'application/json',
            type: "POST",
            data: JSON.stringify($('#AddForm').serializeJSON()),
            success: function (data) {
                if (data == "success") {
                    toastr.success("添加成功");
                    $('#modal_add').modal('hide');
                    $('#gateTable').bootstrapTable('refresh');
                } else {
                    toastr.warning(data);
                }
            }
        });
    }
</script>

