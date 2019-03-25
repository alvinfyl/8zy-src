<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 添加 模态框（Modal） -->
<div class="modal fade" id="userindfodetail" tabindex="-1" role="dialog"  data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog" style="width:800px">
		<div class="modal-content">
			<div class="modal-header">
				
				<button type="button" class="close" id="closeSearch" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title searchUser" id="emyModalLabel">
					查看详情
				</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" class="form-control "  name="oldcode" id="oldcode" >
				<form id="userindfoeditform" >
					<input type="hidden" name="id"  id="euserid" />
					<input type="hidden" name="userid"   />
					<table class="table table-striped" style="font-size:14px;">
						<tbody>
						<tr>
							<td> <div class="form-group">
								<label for="euseren" class="col-sm-4 control-label" >用户帐号:</label>
								<div class="col-sm-8">
									
								</div>
							</div></td>
							<td> <div class="form-group">
								<label for="epassword" class="col-sm-4 control-label" >用户密码:</label>
								<div class="col-sm-8">
									
								</div>
							</div></td>
							
						</tr>
						<tr>
							<td> <div class="form-group">
								<label for="eusername" class="col-sm-4 control-label">用户姓名:</label>
								<div class="col-sm-8">
									
								</div>
							</div></td>
							<td> <div class="form-group">
								<label for="emobile" class="col-sm-4 control-label">联系电话:</label>
								<div class="col-sm-8">
									
								</div>
							</div></td>
						</tr>
						<tr>
							
							<td> <div class="form-group">
								<label for="edname" class="col-sm-4 control-label">所属部门:</label>
								<div class="col-sm-8">
									
								</div>
							</div></td>
							<td> <div class="form-group">
								<label for="eroleid" class="col-sm-4 control-label" >用户角色:</label>
								<div class="col-sm-8">
									超级管理员
								</div>
							</div></td>
						</tr>
						<tr>
							
							<td> <div class="form-group">
								<label for="esign" class="col-sm-4 control-label">用户签名:</label>
								<div class="col-sm-8">
									
								</div>
							</div></td>
							<td> <div class="form-group">
								<label for="esign" class="col-sm-4 control-label">签名位置:</label>
								<div class="col-sm-8">
									
								</div>
							</div></td>
						</tr>
						<tr>
							<td> <div class="form-group">
								<label for="eprotype" class="col-sm-4 control-label" >用户类型:</label>
								<div class="col-sm-8">
									
								</div>
							</div></td>
							<td> <div class="form-group">
								<label for="epriority" class="col-sm-4 control-label">通道组:</label>
								<div class="col-sm-8">
									
								</div>
							</div></td>
						</tr>
						<tr>
							<td> <div class="form-group" style="position: relative;">
								<span class="blackTap5" style="font-size:12px;position:absolute;left:130px;top:-15px;color:red;display:none;">
									开启后该用户将过系统敏感词和业务敏感词
								</span>
								<label for="eprotype" class="col-sm-4 control-label" id="blackName5">业务敏感词:</label>
								<div class="col-sm-8">
									5个类型
								</div>
							</div></td>
							<td> <div class="form-group" style="position: relative;">
								<span class="blackTap6" style="font-size:12px;position:absolute;left:135px;top:-15px;color:red;display:none;">
									开启后该用户将过系统敏感词和业务敏感词
								</span>
								<label for="epriority" class="col-sm-4 control-label" id="blackName6">业务黑名单:</label>
								<div class="col-sm-8">
									3个类型
								</div>
							</div></td>
						</tr>
						<tr>
							<td> <div class="form-group">
								<label for="eprotype" class="col-sm-4 control-label" >短信模板:</label>
								<div class="col-sm-8">
									
								</div>
							</div></td>
							<td> <div class="form-group">
								<label for="epriority" class="col-sm-4 control-label">免审数量:</label>
								<div class="col-sm-8">
									
								</div>
							</div></td>
						</tr>
						
						<tr>
							
							<td> <div class="form-group">
								<label for="ereportflag" class="col-sm-4 control-label">报告权限:</label>
								<div class="col-sm-8">
									
								</div>
							</div></td>
							<td> <div class="form-group">
								<label for="euserip" class="col-sm-4 control-label" >计费类型:</label>
								<div class="col-sm-8">
									
								</div>
							</div></td>
						</tr>
						<tr>
							<td colspan="2"> <div class="form-group">
								<label for="eremark" class="col-sm-2 control-label">报告地址:</label>
								<div class="col-sm-10">
									例如:http://baidu.com
								</div>
							</div></td>
						</tr>
						<tr>
							<td colspan="2"> <div class="form-group">
								<label for="eremark" class="col-sm-2 control-label">上行地址:</label>
								<div class="col-sm-10">
									例如:http://baidu.com
								</div>
							</div></td>
						</tr>
						<tr>
							<td colspan="2"> <div class="form-group">
								<label for="eremark" class="col-sm-2 control-label">IP白名单:</label>
								<div class="col-sm-10">
									192.168.1.11
								</div>
							</div></td>
						</tr>
					
						<tr>
							<td colspan="2"> <div class="form-group">
								<label for="eremark" class="col-sm-2 control-label">备注:</label>
								<div class="col-sm-10">
									
								</div>
							</div></td>
						</tr>
						
						</tbody>
					</table>

				</form>
			</div>
			
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>


