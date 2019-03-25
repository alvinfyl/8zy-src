<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 添加 模态框（Modal） -->
<div class="modal" id="changePwd" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:800px;">
		<div class="modal-content" style="width:800px;">
			<div class="modal-header">
				<!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button> -->
				<h4 class="modal-title" id="myModalLabel">
					修改密码
				</h4>
			</div>
			<div class="modal-body">
				<form id="changePwdForm1">
					<table class="table table-striped" style="font-size:14px;">
						<tbody>
						<tr class="col-sm-12">
							<td class="col-sm-6" style="float: left;">
								<div class="form-group">
									<label  class="col-sm-4 control-label" style="padding-right:0;">新密码:</label>
									<div class="col-sm-8" style="margin-left:-10px;width:62.5%;">
										<input type="password" id="txtNewPass2" name="txtNewPass" class="form-control"/>
									</div>
								</div>
							</td>

							<td class="col-sm-6" style="float: left;">
								<div class="form-group">
									<label  class="col-sm-4 control-label" style="margin-left:-25px;">确认密码:</label>
									<div class="col-sm-8" style="margin-left:-10px;width:62.5%;">
										<input type="password" name="txtRePass" class="form-control" id="txtRePass2" />
									</div>
								</div>
							</td>
						</tr>
						<tr class="col-sm-12">
							
							<td class="col-sm-6" style="float: left;">
								<div class="form-group">
									<label  class="col-sm-4 control-label" style="padding-right:0;">email:</label>
									<div class="col-sm-8" style="margin-left:-10px;width:62.5%;">
										<input type="text" name="emailInp" class="form-control" id="emailInp" />
									</div>
								</div>
							</td>
							
							<td class="col-sm-6" style="float: left;">
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label" style="margin-left:-25px;">员工编号:</label>
                                    <div class="col-sm-8" style="margin-left:-10px;width:62.5%;">
                                        <input type="text" name="PeoInp" class="form-control" id="PeoInp" />
                                    </div>
                                </div>
                            </td>
						</tr>

						<tr class="col-sm-12">

							<td class="col-sm-6" style="float: left;">
								<div class="form-group">
									<label  class="col-sm-4 control-label" style="padding-right:0;">联系人姓名:</label>
									<div class="col-sm-8" style="margin-left:-10px;width:62.5%;">
										<input type="text" name="contact" style="padding:6px 20px;" class="form-control" id="contact" />
									</div>
								</div>
							</td>

							<td class="col-sm-6" style="float: left;">
								<div class="form-group">
									<label  class="col-sm-4 control-label" style="margin-left:-25px;">联系电话:</label>
									<div class="col-sm-8" style="margin-left:-10px;width:62.5%;">
										<input type="text" name="mobile" class="form-control"  id="mobile" />
									</div>
								</div>
							</td>
						</tr>
						</tbody>
					</table>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="backlogin()" >返回</button>
				<button type="button" class="btn btn-primary" id="btnEp" onclick="$('#changePwdForm1').submit()">保存</button>
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
		var isfirst = <%=session.getAttribute("isfirst")%>
		
		if(isfirst == "1"){
			$("#changePwd").modal('show');
			document.onkeydown = killesc; 

			function   killesc() 
			
			{   
				if(window.event.keyCode==27)   
				{
			        $('#changePwd').modal('show');  
				}   
			} 
		}else{
			$("#changePwd").modal('hide');
		}
		changePwdForm1();
		
		//强制修改密码
		/*$("#btnPwd").click(function () {
	        $("#changePwdForm1").data('bootstrapValidator').resetForm();
	        $("#changePwdForm1").data('bootstrapValidator').destroy();
	        changePwdForm1();
	        $('#changePwdForm1')[0].reset();
	        $('#changePwd').modal('show');
	    });*/
	});
	
	function backlogin(){
		location.href = basePath+"/login.jsp";
	}
	
	function changePwdForm1(){
		$('#changePwdForm1').bootstrapValidator({
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
	          
	           emailInp:{
	           		validators:{
	           			notEmpty:{
	           				message:'email不能为空'
	           			},
	           			regexp: {
                            regexp: /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                            message: '请输入正确的邮箱'
                        }
	           		}
	           },
	           username: {
	                validators: {
	                    notEmpty: {
	                        message: '联系人姓名不能为空'
	                    }
	                }
	            },
	            mobile: {
	                validators: {
	                    notEmpty: {
	                        message: '联系电话不能为空'
	                    },
	                    stringLength: {
	                        min: 11,
	                        max: 11,
	                        message: '联系电话必须为11位之间'
	                    },
	                    regexp: {
	                        regexp: /^1[0-9]{10}$/,
	                        message: '手机号码非法的运营商号段，请重新输入！'
	                    }
	                }
	            },
	           PeoInp:{
	           		validators:{
	           			notEmpty:{
	           				message:'员工编号不能为空'
	           			}
	           		}
	           }
	        }
	    }).on("success.form.bv",function(e){
	    	saveChangePwd1();
	        return false;
	    });
	}
	function saveChangePwd1(){
		var newPass = $('#txtNewPass2').val();
		var rePass = $('#txtRePass2').val()
		var email = $("#emailInp").val();
		var cardid = $("#cidInp").val();
		var empid = $("#PeoInp").val();
		var username = $("#username").val();
		var mobile = $("#mobile").val();
		if(newPass!=rePass){
			toastr.warning('提示:两次密码输入不一致！');
			return;
		}
		$.ajax({
			url:'${pageContext.request.contextPath}/user/editPWDAndInfo',
			type:'post',
			data:{pwd:newPass,email:email,cardid:cardid,empid:empid,username:username,mobile:mobile},
			success:function(data){
				if(data=='success'){
					toastr.success('密码以及信息修改成功');
					$('#txtNewPass2').val("");
					$('#txtRePass2').val("");
					$('#changePwd').modal('hide');
					location.href = basePath+"/login.jsp";
				}else {
					toastr.warning('提示:密码以及信息修改失败');
				}
			}
		});
	}
</script>