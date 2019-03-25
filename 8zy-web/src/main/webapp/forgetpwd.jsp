<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>安信平台</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/bootstrapValidator.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/toastr.min.css"/>
    <script src="${pageContext.request.contextPath }/js/basepath.js"></script>
    <script src="${pageContext.request.contextPath }/js/base64.js"></script>
	<script src="${pageContext.request.contextPath }/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrapValidator.min.js"></script>
	<script src="${pageContext.request.contextPath }/bootstrap/js/toastr.min.js"></script>
	<script type="text/javascript">  
		var wait=60; 
		var userid="";
		var mobile="";
		function time(o) {
			//把按钮变为不可点
	        if (wait == 0) {  
	            o.removeAttribute("disabled");            
	            o.value="获取验证码";  
	            wait = 60;  
	        } else {  
	            o.setAttribute("disabled", true);  
	            o.value="重新发送(" + wait + ")";  
	            wait--;  
	            setTimeout(function() {  
	                time(o)  
	            },1000)  
	        } 
		} 
		function forgetCode(o){
			//写发送到后台的逻辑
			$.ajax({
	            url : basePath + "/message/sendCode",
	            type : 'post',
	            data :{
	                'mobile':mobile,
	                'userid':userid
	            },
	            dataType:"json",
	            async:false,
	            success : function(data) {
	            	if (data.status=="error") {
	               		toastr.warning(data.msg);
	               		return
					}
                    time(o);
	            }
	        });  

		}
		$(function () {
			var url = location.search; //获取url中"?"符后的字串 
			var theRequest = new Object(); 
			if (url.indexOf("?") != -1) { 
			var str = url.substr(1); 
			var b = new Base64();
	  		var str1 = b.decode(str);
	  		if (str1.indexOf("&") > 0) {
				var strs =str1.split("&");
				userid=unescape(strs[0]);
				mobile=unescape(strs[1]);
				$('#userid').val(userid);
				$('#mobile').val(mobile.substring(0, 3)+"****"+mobile.substring(7, 11));
			}else{
				userid=unescape(str1);
				$('.forgetBox').css('display','none');
				$('.progressThree').addClass('active');
				$('.changePWD').css('display','block');
			}
		}
	    $('#forgetForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                userid: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 18,
                            message: '用户名长度必须在6到18位之间'
                        }
                    }
                },
                mobile: {
                    validators: {
                        notEmpty: {
                            message: '手机号不能为空'
                        }
                    }
                },
                inputcheckcode:{
                    validators: {
                        notEmpty: {
                            message: '请输入验证码'
                        }
                    }
                }
            },
            submitHandler: function (validator, form, submitButton) {
                toastr.warning("submit");
            }
	      });
	      $('#updateForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                pwd: {
                    message: '密码验证失败',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 8,
                            max: 18,
                            message: '密码长度必须在8到18位之间'
                        },
                        regexp: {
                            regexp: /^(?![^A-Z]+$)(?![^a-z]+$)(?!\D+$)(?![^_]+$)/,
                            message: '密码必须包含大写、小写、数字和下划线'
                        }
                    }
                },
                pwd1: {
                    message: '密码验证失败',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },identical: {
                            field: 'pwd',
                            message: '两次输入的密码不一致。'
                        }
                    }
                }
            },
            submitHandler: function (validator, form, submitButton) {
                alert("submit");
            }
	      });
	    });
		//下一步操作
		function next(){
			var code=$('#inputcheckcode').val();
			$('.progressOne').addClass('active');
			$.ajax({
	            url : basePath + "/message/checkCode",
	            type : 'post',
	            data :{
	                'mobile':mobile,
	                'userid':userid,
	                'checkcode':code
	            },
	            dataType:"json",
	            async:false,
	            success : function(data) {
	            	if (data.status=="error") {
	               		toastr.warning(data.msg);
					}else{
						var b = new Base64();
	            		var str = b.encode(userid);
//						location.href = basePath+"/updatepwd.jsp?"+str;
						$('.forgetBox').css('display','none');
						$('.progressThree').addClass('active');
						$('.changePWD').css('display','block');
					}
	            },error :function(msg){
	            	toastr.warning("失败！");
	            }
	        });  
		}
		function loginBank(){
			location.href = '${pageContext.request.contextPath }/login/out';
		}
		
		
		//修改密码
		var wait=60; 
//		var userid="";
//		var mobile="";
		/*$(function () {
			var url = location.search; //获取url中"?"符后的字串 
			var theRequest = new Object(); 
			if (url.indexOf("?") != -1) { 
			var str = url.substr(1); 
			var b = new Base64();
	  		var str1 = b.decode(str);
			userid=unescape(str1);
		}
	    $('#updateForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                pwd: {
                    message: '密码验证失败',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 8,
                            max: 18,
                            message: '密码长度必须在8到18位之间'
                        },
                        regexp: {
                            regexp: /^(?![^A-Z]+$)(?![^a-z]+$)(?!\D+$)(?![^_]+$)/,
                            message: '密码必须包含大写、小写、数字和下划线'
                        }
                    }
                },
                pwd1: {
                    message: '密码验证失败',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },identical: {
                            field: 'pwd',
                            message: '两次输入的密码不一致。'
                        }
                    }
                }
            },
            submitHandler: function (validator, form, submitButton) {
                alert("submit");
            }
	      });
		});*/
		//更改操作
		function pwdChange(){
			var pwd=$('#pwd').val();
			$.ajax({
	            url : basePath + "/user/restartpwd",
	            type : 'post',
	            data :{
	                'pwd':pwd,
	                'userid':userid
	            },
	            dataType:"json",
	            async:false,
	            success : function(data) {
	            	if (data.status=="error") {
//	               		alert(data.msg);
	               		show_confirm("提示框",data.msg,function (result) {
							if(result) {
								$('#confirm').modal('hide');
							} else {
								$('#confirm').modal('hide');
							}
						} )
					}
	            	else{
						location.href = basePath+"/login.jsp";
					}
	            }
	        });  
		}
	</script> 
	<style type="text/css">
		body{
			background:url(dist/img/bgwall.png);
		}
		.forgetBox{
			/*position:relative;*/
			margin:0 auto;
			display: flex;
			justify-content: space-around;
			padding:10px;
		}
	
		#forgetForm{
			padding:20px;
			border:1px solid #ccc;
			border-radius: 5px;
			background:#fff;
		}
		.control-label{
			text-align: center !important;
		}
		
		/* 设置滚动条的样式 */
			
			::-webkit-scrollbar {
				width: 3px;
			}
			/* 滚动槽 */
			
			::-webkit-scrollbar-track {
				-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
				border-radius: 10px;
			}
			/* 滚动条滑块 */
			
			::-webkit-scrollbar-thumb {
				border-radius: 10px;
				background: rgba(255, 255, 255, 0.1);
				-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.5);
			}
			
			::-webkit-scrollbar-thumb:window-inactive {
				background: rgba(255, 0, 0, 0.4);
			}
			.section-subnav {
			    height: 80px;
			    background-color: #f5f5f5;
			    width: 62%;
			    margin: 0 auto;
			    margin-top:20px;
			}
.section_subnav .subnav_process {
    padding-top: 14px;
    text-align: center;
}
.section_subnav .subnav_process>li {
    position: relative;
    display: inline-block;
}
.section_subnav .subnav_process>li>div {
    text-align: center;
    position: relative;
    float: left;
    min-width: 56px;
    height: 34px;
    line-height: 30px;
    vertical-align: middle;
}
.section_subnav .subnav_process>li>div>i {
    width: 28px;
    height: 28px;
    font-size: 14px;
    line-height: 28px;
    color: #fff;
    background-image: url(dist/img/common.png);
    background-position: 0 -442px;
    background-repeat: no-repeat;
    background-color: none;
}
.section_subnav .subnav_process .active>div>i {
    background-image: url(dist/img/common.png);
    background-position: 0 -404px;
    background-repeat: no-repeat;
    background-color: none;
}
.section_subnav .subnav_process>li>div>p {
    position: relative;
    top: 12px;
    font-size: 14px;
    font-weight: 700;
    line-height: 20px;
    margin-top: -8px;
    color: #a5a5a5;
}
.section_subnav .subnav_process .active>i {
    background-image: url(dist/img/common.png);
    background-position: 0 -392px;
    background-repeat: no-repeat;
    background-color: none;
}
i {
    font-style: normal;
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    background-repeat: no-repeat;
}
.section_subnav .subnav_process>li>i {
    float: left;
    width: 180px;
    height: 2px;
    margin-top: 14px;
    vertical-align: middle;
    background-color: #ededed;
}
	</style>
</head>
<body>
	<div calss="forget-header" style="overflow: hidden;margin:0 auto;width:62%;padding:10px;"><img src="dist/img/logoqy.gif" class="forgetImg" alt="" style="margin-top:30px;float: left;"/><a onclick="loginBank()"  style="margin-top:30px;float: right;cursor: pointer;">登录</a></div>
	<div class="section section-subnav">
                    <div class="section_subnav">
                        <ul class="subnav_process">
                            
                            <li  class="active">
                                <div>
                                    <i>1</i>
                                    <p>身份验证</p>
                                </div>
                                <i></i>
                            </li>
                            <li  class="progressThree">
                                <div>
                                    <i>2</i>
                                    <p>设置新密码</p>
                                </div>
                                <i></i>
                            </li>
                            <li class="last">
                                <div>
                                    <i>3</i>
                                    <p>完成</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
	<div class="forgetBox" style="margin-top:5%;">
        <div class="fright">
        	<form id="forgetForm" class="form-horizontal">
	           <div class="box-body" style="width:100%">
	             <div class="form-group">
	               <label for="userid" class="col-sm-3 control-label">用户账号</label>
	               <div class="col-sm-9">
	                 <input type="text" class="form-control" readonly="readonly" style="width:45%" id="userid" name="userid" placeholder="用户账号">
	               </div>
	             </div>
	             <div class="form-group">
	               <label for="mobile" class="col-sm-3 control-label">手机号</label>
	               <div class="col-sm-9">
	                 <input type="text" maxlength="11" class="form-control" style="width:45%" readonly="readonly" id="mobile" name="mobile"
	                 onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')"  placeholder="手机号">
	               </div>
	             </div>
	             <div class="form-group">
	               <label for="inputcheckcode" class="col-sm-3 control-label">验证码</label>
	               <div class="col-sm-9">
		               <table>
		               	<tr>
		               	 	<td width="50%">
		                		<input type="text" class="form-control" style="width:90%" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" id="inputcheckcode" name="inputcheckcode" placeholder="输入验证码"/>
		               	 	</td>
		               	 	<td width="50%">
		                 		<input type="button" align="right" class="form-control" onclick="forgetCode(this)" style="width:56%" id="btn" value="获取验证码"/>
		               	 	</td>
		               	</tr>
		               </table>
	               </div>
	             </div>
	           </div>
	           <!-- /.box-body -->
	           <div class="box-footer"  style="width:88%" align="center">
	             <button  onclick="next()" class="btn btn-info">下一步</button>
	           </div>
	           <!-- /.box-footer -->
	         </form>
        </div> 
      </div>
      <div class="changePWD" style="width:50%;display:none;margin-top:10%;margin-left: 28%;background:#fff;padding: 20px;border: 1px solid #ccc;border-radius: 5px;margin-top: 5%;">
         <form id="updateForm" class="form-horizontal">
           <div class="box-body" style="width:100%">
             <div class="form-group">
               <label for="pwd" class="col-sm-3 control-label">请输入密码</label>
               <div class="col-sm-9">
                 <input type="password" class="form-control" style="width:50%" id="pwd" name="pwd" placeholder="新密码">
               </div>
             </div>
             <div class="form-group">
               <label for="pwd1" class="col-sm-3 control-label">请确认密码</label>
               <div class="col-sm-9">
                 <input type="password" class="form-control" style="width:50%"  id="pwd1" name="pwd1" placeholder="确认密码">
               </div>
             </div>
           </div>
           <!-- /.box-body -->
           <div class="box-footer"  style="width:60%" align="center">
             <button  onclick="pwdChange()" class="btn btn-info">确定</button>
           </div>
           <!-- /.box-footer -->
         </form>
      </div>
</body>
<jsp:include page="./WEB-INF/pages/confirm/confirm.jsp"></jsp:include>
</html>