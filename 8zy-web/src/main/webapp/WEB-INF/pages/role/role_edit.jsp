<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 添加 模态框（Modal） -->
<div class="modal fade" id="eroleModal" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="emyModalLabel">
                    修改
                </h4>
            </div>
            <div class="modal-body">
                <form id="roleeditform">
                    <input type="hidden" name="id"  id="roleid" />
                    <table class="table table-striped">
                        <tbody>
	                        <tr>
								<td>
									<div class="form-group">
										<label for="rolename" class="col-sm-4 control-label" style="width: 20%">名称:</label>
										<div class="col-sm-8">
		                                    <input type="text" class="form-control "  name="rolename" id="rolename">
		                                </div>
										<font color="red">(*必填)</font>
		                            </div>
	                            </td>
							</tr>
							<tr>
								<td>
									<div class="form-group">
										<label for="memo" class="col-sm-4 control-label" style="width: 20%">描述:</label>
										<div class="col-sm-8">
											<textarea rows="4" class="form-control " cols="60" id="memo" style="resize:none" name="memo" maxlength="50"></textarea>
		                                </div>
		                            </div>
	                            </td>
							</tr>
			
							<tr>
								<td>
									<label  class="col-sm-4 control-label" style="width: 20%">可访问数据:</label>
									<div class="form-group">
										<input type="radio" name="roletype"  value="0">全部
										<input type="radio" name="roletype"  value="1">自己及下属部门
										<input type="radio" name="roletype"  value="2">仅本自己
		                            </div>
								</td>
							</tr>
							<td>
								<label for="efunctionTree" class="control-label">授权:</label>
								<div></div>
								<div class="btn-group">
									<button id="btn_edit" type="button" class="btn btn-default"
											onclick="zhankai($('#efunctionTree'))">
										<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>全部展开
									</button>
									<button id="btn_delete" type="button" class="btn btn-default"
											onclick="shousuo($('#efunctionTree'))">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>全部收缩
									</button>
									<%--<button   type="button" class="btn btn-default"
                                            onclick="showddsd()">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>显示
                                    </button>--%>
								</div>
								<div id="efunctionTree"></div>
							</td>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="$('#roleeditform').submit()">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>