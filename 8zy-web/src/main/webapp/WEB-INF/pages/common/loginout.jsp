<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 添加 模态框（Modal） -->
<div class="modal fade" id="loginout" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:800px;">
		<div class="modal-content" style="width:800px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改密码
				</h4>
			</div>
			<div class="modal-body">
				<form id="changePwdForm">
					<table class="table table-striped" style="font-size:14px;">
						<tbody>
						
						<tr>
							<td class="col-sm-12"> 
								<div class="form-group">
									<label for="codename" class="col-sm-2 control-label" name="" id="">原密码:</label>
									<div class="col-sm-10">
										<input type="password" class="form-control " name="oldpass" id="oldpass"/>
									</div>
								</div>
							</td>
							<td class="col-sm-0"> </td>
						</tr>
						<tr>
							<td class="col-sm-12"> 
								<div class="form-group">
									<label for="typename" class="col-sm-2 control-label">新密码:</label>
									<div class="col-sm-10">
										<input type="password" id="txtNewPass" name="txtNewPass" class="form-control" />
									</div>
								</div>
							</td>
							<td class="col-sm-0"> </td>
						</tr>
						
						
						<tr>
							<td class="col-sm-12"> 
								<div class="form-group">
									<label for="typename" class="col-sm-2 control-label">确认密码:</label>
									<div class="col-sm-10">
										<input type="password" name="txtRePass" class="form-control" id="txtRePass" />
									</div>
								</div>
							</td>
							<td class="col-sm-0"> </td>
						</tr>
						
						</tbody>
					</table>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
				<button type="button" class="btn btn-primary" id="btnEp" onclick="$('#changePwdForm').submit()">保存</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<style type="text/css">
	@media (min-width: 768px) {
		  .modal-dialog {
		    margin: 10% auto;
		  }
		}
</style>
<script type="text/javascript">
	
	$(function () {
		changePwdForm();
	});
	function changePwdForm(){
		$('#changePwdForm').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	txtNewPass: {
	                validators: {
	                   notEmpty: {
	                        message: '新密码不能为空'
	                   },
                        stringLength: {
                            min: 8,
                            max: 18,
                            message: '密码长度必须在8到18位之间'
                        },
                        regexp: {
                            regexp: /^(?![^A-Z]+$)(?![^a-z]+$)(?!\D+$)/,
                            message: '密码必须包含大写、小写、数字'
                        }
	                }
	           },
	           txtRePass: {
	           		validators: {
	                   notEmpty: {
	                        message: '确认密码不能为空'
	                   },
                        stringLength: {
                            min: 8,
                            max: 18,
                            message: '密码长度必须在8到18位之间'
                        },
                        regexp: {
                            regexp: /^(?![^A-Z]+$)(?![^a-z]+$)(?!\D+$)/,
                            message: '密码必须包含大写、小写、数字'
                        },identical: {
                            field: 'txtNewPass',
                            message: '两次输入的密码不一致。'
                        }
	                }
	           },
	           oldpass: {
	           		validators: {
	                   notEmpty: {
	                        message: '原密码不能为空'
	                   }
	                }
	           }
	        }
	    }).on("success.form.bv",function(e){
	    	saveChangePwd();
	        return false;
	    });
	}
	function saveChangePwd(){
		var newPass = $('#txtNewPass').val();
				var rePass = $('#txtRePass').val()
				var oldPass = $('#oldpass').val();
				if(newPass!=rePass){
					toastr.warning('提示:两次密码输入不一致！');
					return;
				}
				$.ajax({
					url:'${pageContext.request.contextPath}/user/editPWD',
					type:'post',
					data:{pwd:newPass,oldPass:oldPass},
					success:function(data){
						console.log(data);
						if(data=='success'){
							toastr.success('密码修改成功');
							$('#txtNewPass').val("");
							$('#txtRePass').val("");
							$('#oldpass').val("");
							$('#loginout').modal('hide');
							location.href = basePath+"/login.jsp";
						}else if(data=='olderror'){
							toastr.warning('提示:原密码有误！');
						}else {
							toastr.warning('提示:密码过于简单,请重新修改');
						}
					}
				});
	}
</script>