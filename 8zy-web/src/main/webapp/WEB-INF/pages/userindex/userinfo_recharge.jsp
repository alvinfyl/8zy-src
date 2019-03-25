
 <%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 添加 模态框（Modal） -->
<div class="modal fade" id="userindforecharge" tabindex="-1" role="dialog"  data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:500px">
		<div class="modal-content" style="width:500px;">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">
					充值
				</h4>
			</div>
			<div class="modal-body">
				<form id="userindfoaddform">
					<table class="table table-striped" style="font-size:14px;">
						<tbody>
						<tr>
							<td> <div class="form-group">
								<label   class="col-sm-5 control-label" >充值账号:user_name</label>
								
							</div></td>
						</tr>
						
						<tr>
							<td> <div class="form-group">
								<label   class="col-sm-5 control-label" >账户余额:3(条)</label>
								
							</div></td>
						</tr>	
						<tr>
							<td> <div class="form-group">
								<label for="useren" class="col-sm-5 control-label" >充值条数:</label>
								
									<input type="text" class="form-control "  name="useren" id="useren" >
								
							</div></td>
						</tr>	
						<tr>
							<td> 
							总余额:78888(条)
							</td>
						</tr>	
						</tbody>
					</table>
						<p>注:仅对提交计费的用户有效</p>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary">
					确定
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>



