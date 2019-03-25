<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
		<title>安信平台</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<!-- Bootstrap 3.3.6 -->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
		<!-- toastr -->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/toastr.min.css">
		<!-- Font Awesome -->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/font-awesome-4.7.0/css/font-awesome.min.css">
		<!-- jvectormap -->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
		<!-- Theme style -->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/style.css">
		<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/skins/_all-skins.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/bootstrap-slider/slider.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/daterangepicker/daterangepicker.css">
		
		
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/bootstrapValidator.min.css"/>

		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
	</head>

	<body class="hold-transition skin-blue sidebar-mini" style="overflow-x: hidden;overflow-y: auto;">
		<div class="wrapper">

			<header class="main-header">

				<!-- Logo -->
				<a href="#" class="logo">
					<!-- mini logo for sidebar mini 50x50 pixels -->
					<span class="logo-mini"><b>A</b>C</span>
					<!-- logo for regular state and mobile devices -->
					<!--<span class="logo-lg"><b>Admin</b>MD</span>
					<span class="logo-mini"><b>M</b>D</span>-->
					<span class="logo-lg"></span>
				</a>

				<!-- Header Navbar: style can be found in header.less -->
				<nav class="navbar navbar-static-top">
					<!-- Sidebar toggle button-->
					<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
						<span class="sr-only">Toggle navigation</span>
					</a>
					<!-- Navbar Right Menu -->
					<div class="navbar-custom-menu">
						<ul class="nav nav-pills">
							<li class="dropdown all-camera-dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" style="padding: 5px 15px;margin-top: 11px;border-radius: 5px;cursor: pointer;">
									设置
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu" style="top: 110%;">
									<!-- <li data-filter-camera-type="all" id="btnPwd">
										<a data-toggle="tab" style="padding: 6px 40px;">修改密码</a>
									</li> -->
									<li data-filter-camera-type="Alpha" onclick="loginout()">
										<a data-toggle="tab" style="padding: 6px 40px;">退出登录</a>
									</li>
									<li data-filter-camera-type="Alpha" onclick="location.href = basePath + '/templateDown/dxptyhczscdown';">
										<a data-toggle="tab" style="padding: 6px 40px;">下载《用户操作手册》</a>
									</li>

								</ul>
							</li>
							<li>
								<a href="#" data-toggle="control-sidebar"  style="padding: 5px 15px;margin-top: 11px;border-radius: 5px;"><i class="fa fa-gears"></i>更换皮肤</a>
							</li>
						</ul>
					</div>
				</nav>
			</header>

			<!-- Left side column. contains the logo and sidebar -->
			<aside class="main-sidebar">
				<!-- sidebar: style can be found in sidebar.less -->
				<section class="sidebar">
					<!-- Sidebar user panel -->
					<!--<div class="user-panel" style="position:relative;">
      	<span class="icon node-icon glyphicon glyphicon-home" style="position:absolute;left:12px;top:18px;"></span>
        	主菜单
      </div>-->

					<!-- sidebar menu: : style can be found in sidebar.less -->
						<div id="nav" class="nav-canvas">
							
						</div>
				</section>
				<!-- /.sidebar -->
			</aside>

			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">

				<div class="row" style="height: 100%;">
					<div class="col-md-12">
						<!-- Custom Tabs -->
						<div class="nav-tabs-custom">
							<div id="box">
								<ul class="nav nav-tabs" id="myTab" style="overflow-y: auto;">
									<li class="active">
										<a href="#tab_1" data-toggle="tab">首页</a>
									</li>
								</ul>
								<div id="bar"></div>
							</div>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane active" id="tab_1">
									<iframe scrolling="auto" style="width: 100%; height: 100%;" frameborder="0" src="pages/toPage/common/table1"></iframe>
								</div>
								<!-- /.tab-pane -->
								<div id="control-sidebar-theme-demo-options-tab" class="tab-pane active">
									<style>
										iframe{
											border:none;
                                            border-width:0;
                                            frameBorder:0;
										}
									</style>
								</div>
							</div>
							<!-- /.tab-content -->
						</div>
						<!-- nav-tabs-custom -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

			</div>
			<!-- /.content-wrapper -->

			<!-- Control Sidebar -->
			<aside class="control-sidebar control-sidebar-dark" style="overflow: auto;">
			
				<!-- Tab panes -->
				<div class="tab-content">
					<!-- Home tab content -->
					<div class="tab-pane" id="control-sidebar-home-tab">
						

					</div>
					<!-- /.tab-pane -->

				</div>
			</aside>
			<!-- /.control-sidebar -->
			<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
			<div class="control-sidebar-bg"></div>
		</div>
		<!-- ./wrapper -->
		

		<!-- jQuery 2.2.3 -->
		<script src="${pageContext.request.contextPath }/plugins/jQuery/jquery-1.9.1.min.js"></script>
		<!-- Bootstrap 3.3.6 -->
		<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
		<!-- toastr -->
		<script src="${pageContext.request.contextPath }/bootstrap/js/toastr.min.js"></script>
		<!-- FastClick -->
		<script src="${pageContext.request.contextPath }/plugins/fastclick/fastclick.js"></script>
		<!-- AdminLTE App -->
		<script src="${pageContext.request.contextPath }/dist/js/app.js"></script>
		<!-- Sparkline -->
		<script src="${pageContext.request.contextPath }/plugins/sparkline/jquery.sparkline.min.js"></script>
		<!-- jvectormap -->
		<script src="${pageContext.request.contextPath }/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
		<!-- SlimScroll 1.3.0 -->
		<script src="${pageContext.request.contextPath }/plugins/slimScroll/jquery.slimscroll.min.js"></script>
		<!-- ChartJS 1.0.1 -->
		<script src="${pageContext.request.contextPath }/plugins/chartjs/Chart.min.js"></script>
		<script src="${pageContext.request.contextPath }/plugins/treeview/bootstrap-treeview.min.js"></script>
		<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
		<script src="${pageContext.request.contextPath }/dist/js/pages/dashboard.js"></script>
		<script src="${pageContext.request.contextPath }/dist/js/demo.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="${pageContext.request.contextPath }/js/common/index.js"></script>
		<script src="${pageContext.request.contextPath }/js/basepath.js"></script>
		<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>--%>
		<script src="${pageContext.request.contextPath }/plugins/morris/morris.min.js"></script>
		<script src="${pageContext.request.contextPath }/plugins/knob/jquery.knob.js"></script>
		<script src="${pageContext.request.contextPath }/plugins/bootstrap-slider/bootstrap-slider.js"></script>
		<script src="${pageContext.request.contextPath }/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>

		
		<script src="${pageContext.request.contextPath }/bootstrap/treegrid/jquery.treegrid.min.js"></script>
		<script src="${pageContext.request.contextPath }/bootstrap/treegrid/jquery.treegrid.bootstrap3.js"></script>
		<script src="${pageContext.request.contextPath }/bootstrap/treegrid/jquery.treegrid.extension.js"></script>
		
		<script src="${pageContext.request.contextPath }/plugins/jQuery/jquery.placeholder.min.js"></script>
    <%--<script src="${pageContext.request.contextPath }/plugins/jQuery/respond.js"></script>--%>
    
    
    <script src="${pageContext.request.contextPath }/bootstrap/js/bootstrapValidator.min.js"></script>
	
    
	</body>
	<jsp:include page="../confirm/confirm.jsp"></jsp:include>
	<jsp:include page="./loginout.jsp"></jsp:include>
	<jsp:include page="./changePwd.jsp"></jsp:include>

</html>

<style type="text/css">
		/* 设置滚动条的样式 */
			/*.sidebar-menu{
				scrollbar-arrow-color:red; !*三角箭头的颜色*!

				　　scrollbar-face-color:green; !* 立体滚动条的颜色（包括箭头部分的背景色） *!

				　　scrollbar-3dlight-color: blue; !* 立体滚动条亮边的颜色 *!

				　　scrollbar-highlight-color: #ddd; !* 滚动条的高亮颜色（左阴影？） *!

				　　scrollbar-shadow-color: pink;!* 立体滚动条阴影的颜色 *!

				　　scrollbar-darkshadow-color: #ccc;!* 立体滚动条外阴影的颜色 *!

				　　scrollbar-track-color: orange; !* 立体滚动条背景颜色 *!

				　　scrollbar-base-color: yellow;!* 滚动条的基色 *!
			}*/
			::-webkit-scrollbar {
				width: 5px;
				height:5px
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
		
			/*IE,360*/
			
			/* 滚动槽 */
			
			::-ms-track {
				-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
				border-radius: 10px;
			}
			/* 滚动条滑块 */
			
			::-ms-thumb {
				border-radius: 10px;
				background: rgba(255, 255, 255, 0.1);
				-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.5);
			}
			
			::-ms-thumb:window-inactive {
				background: rgba(255, 0, 0, 0.4);
			}
			
			
			
			
			.list-group {
				/*margin-bottom: 90px;*/
			}
			
			.user-panel {
				color: #b8c7ce;
				padding-left: 55px;
				line-height: 30px;
			}
			a .logo-lg{
				background: url(dist/img/logo.png) no-repeat;
				width:230px;
				height:50px;
				border-radius: 2px;
				margin:3px;
			    background-size:100% 100%; 
			    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='bg-login.png',sizingMethod='scale');
			}
	.node-nav:not(.node-disabled):hover {
		background-color: #8cafe0;
	}
	
	.nav-tabs>li {
		float: left;
		margin-bottom: 0px;
		border-right: 1px solid #f4f4f4;
		border-bottom: 1px solid #f4f4f4;
	}
	
	.nav>li>a {
		position: relative;
		display: block;
		padding: 5px 10px;
	}
	
	.treeview span.icon {
		width: 12px;
		margin-right: 5px;
	}
	.logo-mini:hover{
		background: #337ab7;
	}
	.nav-tabs>li a{
		color:#555;
		margin-right:0px;
	}
	.nav-tabs>li.active>a{
	    color: #000;
	    background:#cdf;
	}
	.nav-tabs>li.active>a:hover {
	    background-color: #9ec1f3;
	}
	.sidebar-mini .sidebar-menu{
		overflow:auto;
	}
	.sidebar-mini.sidebar-collapse .sidebar-menu{
		overflow:visible;
	}
	.skin-blue .main-header .navbar {
    background-color: #fff;
}
.skin-blue .main-header .navbar .sidebar-toggle {
    color: #000;
}
.skin-blue .main-header .navbar .nav>li>a {
    color: #000;
}

</style>
<script type="text/javascript">
	//退出登录
function loginout () {
			location.href = '${pageContext.request.contextPath }/login/out';
}
</script>