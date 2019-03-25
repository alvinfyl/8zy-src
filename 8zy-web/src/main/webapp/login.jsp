<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv=”X-UA-Compatible” content=”IE=edge,chrome=1″ />
<title>安信平台</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">-->
<!-- Ionicons
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">-->
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/plugins/iCheck/square/blue.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/toastr.min.css"/>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<script src="js/md5.js" type="text/javascript"></script>
<style>
body {
	background: url(dist/img/photo4.jpg) no-repeat;
	width: 100%;
	height: 100%;
	background-size: 100% 100%;
	position: relative;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='bg-login.png',
		sizingMethod='scale');
	color: #f4f4f4;
}

#captcha {
	border-radius: 8px;
	cursor: pointer;
	position: absolute;
	z-index: 3;
	left: 0;
	top: 2px;
}

#validateCode {
	padding-left: 25px;
}

.form-control {
	background-color: #fff;
}

.login-box-body {
	border-radius: 5px;
	width:346px;
	margin-top:20px;
}

.has-feedback .form-control {
	border-radius: 5px;
}

.login-box-body, .register-box-body {
	background: #fff;
	padding: 20px;
	border-top: 0;
	color: #fff;
	opacity:0.8;
	box-shadow: 2px 2px 22px #4c88c3;
}
.logo{
	position:absolute;
	left:18%;
	top:20px;
	background:#fff;
	border-radius: 2px;
}

.loginBox{
	width:100%;
	display: flex;
	display:-webkit-flex;
	display: -moz-box;
	display: -moz-flex;
	display: -ms-flexbox;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-justify-content: center;
	-moz-justify-content: center;
	-ms-justify-content: center;
}
</style>
</head>
<body class="hold-transition login-page">
	<!--<div class="logo">
		<img src="dist/img/logo.gif"/>
	</div>-->
	<div class="login-box">
		<div class="login-logo">
			<%-- <img src="dist/img/login-logo1.png" style="width: 268px;height: 72px;border-radius: 2px;"/>--%>
			 <b style="color: #1C7FB6;">平台</b>
		</div>
		<div class="loginBox">
			<!-- /.login-logo -->
			<div class="login-box-body">
				<p class="login-box-msg" id="msg">${requestScope.message}</p>
	
				<form id="loginform2" name="form2"
					action="${pageContext.request.contextPath }/login" method="post">
					<div class="form-group has-feedback">
						<input type="text" id="userid" name="userid" class="form-control"
							autofocus placeholder="用户名"> <span
							class="glyphicon glyphicon-user form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" name="password2" id="password"
							class="form-control" placeholder="密码"> <span
							class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<div class="input-group"
							style="overflow: hidden; width: 122%; height: 36px;">
							<img id="captcha"
								src="${pageContext.request.contextPath }/validatecode.jsp"
								onclick="javascript:document.getElementById('captcha').src='${pageContext.request.contextPath }/validatecode.jsp?'+Math.random();"
								alt="点击切换验证码" title="点击切换验证码"> <input type="text"
								class="form-control" id="validateCode" name="checkcode"
								placeholder="验证码"
								style="position: absolute; right: 18%; top: 0; width: 50%;">
						</div>
					</div>
					<div class="row">
						<div class="col-xs-8">
							<div class="checkbox icheck">
								<label> <input id="ck_rmbUser" type="checkbox">
									记住我
								</label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-xs-4">
							<button type="button" class="btn btn-primary btn-block btn-flat"
								onclick="login()">登&nbsp;&nbsp;录</button>
						</div>
						<!-- /.col -->
					</div>
				</form>
	
				<div class="social-auth-links text-center"></div>
				<a href="#abc" onclick="forgetpwd()">忘记密码</a><br>
			</div>
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 2.2.3 -->
	<script
		src="${pageContext.request.contextPath }/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script
		src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath }/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/dist/js/jquery.cookie.js"></script>
	<script src="${pageContext.request.contextPath }/js/basepath.js"></script>
	<script src="${pageContext.request.contextPath }/js/base64.js"></script>
	<script src="${pageContext.request.contextPath }/bootstrap/js/toastr.min.js"></script>
	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
			if ($.cookie("rmbUser") == "true") {
				$("#ck_rmbUser")[0].parentNode.attributes[0].value="icheckbox_square-blue checked";
				$("#ck_rmbUser")[0].parentNode.attributes[1].value=true;
				$("#ck_rmbUser").attr("checked", true);
				$("#userid").val($.cookie("usernames"));
			}
		});
		$(window).keydown(
				function(event) {
					if ($('#userid').val().trim()
							&& $('#password').val().trim()
							&& $('#validateCode').val().trim())
						if (event.keyCode == 13) {
							setCookies();
							document.form2.password2.value= hex_md5($('#password').val().trim());
							$('#loginform2').submit();
						}
				});
		if (window.self != window.top) {
			window.top.location = window.location;
		}

		function forgetpwd() {
			var userid = $('#userid').val();
			var reg = /^1\d{10}$/;
			var mobile = null;
			if (userid) {
				$.ajax({
					url : basePath + "/user/queryMobile",
					type : 'post',
					data : {
						'userid' : userid
					},
					dataType : "json",
					async : false,
					success : function(data) {
						if (reg.test(data)) {
							var b = new Base64();
							var str = b.encode(userid + "&" + data);
							location.href = basePath + "/forgetpwd.jsp?" + str;
						} else {
							toastr.success(data);
						}
					},
					error : function(msg) {
						toastr.error('获取用户手机号异常!');
					}
				});
			} else {
				toastr.warning("请输入账号！");
			}
		}
		function setCookies() {
			if ($("#ck_rmbUser").is(':checked')) {
				var str_username = $("#userid").val();
				$.cookie("rmbUser", "true", {
					expires : 30
				}); //存储一个带30天期限的cookie  
				$.cookie("usernames", str_username, {
					expires : 30
				});
			} else {
				$.cookie("rmbUser", "false", {
					expire : -1
				});
				$.cookie("usernames", "", {
					expires : -1
				});
			}
		}
		function login() {
			var uid = $("#userid").val();
			var pwd = $("#password").val().trim();
			if (uid == "" || uid == null || pwd == '' || pwd == null) {
				$("#msg").html("账号和密码不能为空");
				return;
			} else {
				setCookies();
				//document.form2.password2.value= hex_md5(pwd);
				$('#loginform2').submit();
			}
		}
		
	
	</script>
</body>
</html>

