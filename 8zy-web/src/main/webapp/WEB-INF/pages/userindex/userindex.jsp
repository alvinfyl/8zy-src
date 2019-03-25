<%@ page import="com.zy.entity.YtUserinfo" %>
<%@ page import="com.zy.utils.SessionUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
	<jsp:include page="../common/common.jsp"></jsp:include>

	<head>
		<meta charset="utf-8">
		<title>用户管理</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/userindex.css" />
		<link rel="shortcut icon" href="${pageContext.request.contextPath }/img/favicon.ico" />
		<script src="${pageContext.request.contextPath }/js/userindex/userindex.js"></script>
		<script src="${pageContext.request.contextPath }/js/userindex/userindex_add.js"></script>
		<script src="${pageContext.request.contextPath }/js/userindex/userindex_edit.js"></script>
		<script src="${pageContext.request.contextPath }/js/userindex/userindex_validator.js"></script>
		<script src="${pageContext.request.contextPath }/js/userindex/user_detail.js"></script>
		<script src="${pageContext.request.contextPath }/js/userindex/userindex_recharge.js"></script>
		<script src="${pageContext.request.contextPath }/js/code/codehelp.js"></script>
		<script>
            $(function() {
                //加载签名方法
                $("#userindfoaddform2").find("[name='sign']").html(getsigncode());
                $("#userindfoeditform2").find("[name='sign']").html(getsigncode());

            });



		</script>

	</head>

	<body>
		<div class="panel-body" >
			<div style="" class="selectBox">

				<form id="formSearch" class="form-horizontal" style="margin-bottom:0px !important;">
					<div class="form-group">
						
						<div style="float: left;">
							<input type="text" name="userid" class="form-control" id="txt_search_username" placeholder="用户账号/用户姓名">
						</div>
						
						<div style="margin-left: 10px;float:left;">
							<input type="text" style="display: none;" value="" id="departid">
							<input type="text" class="form-control" id="txt_search_statu" placeholder="部门名称" readonly onclick="choosedeptmentid('#departid',this,null)">
						</div>
						<div style="text-align: left;float: left;">
							<button type="button" style="margin-left: 20px" id="btn_query" onclick="serchstrk()" class="btn btn-primary">查询
                            </button>
						</div>
						<div style="text-align: left;float: left;">
							<button type="reset" style="margin-left: 10px"  class="btn btn-primary" id="resetBtn">重置
                            </button>
						</div>
						
					</div>
				</form>

			</div>
			<div>
				<div id="toolbar" class="btn-group">
					<button id="btn_adduser" type="button" class="btn btn-default btn-setting" data-toggle="modal" data-target="#userindfoadd">
		                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
		            </button>
					<button id="btn_edituser" type="button" class="btn btn-default">
		                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改/查看
		            </button>
					<button id="btn_delete" type="button" class="btn btn-default" onclick="doDelete()">
		                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
		            </button>
					<button id="btn_set_status" type="button" class="btn btn-default" onclick="setStatus()">
		                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>启动/禁用
		            </button>

					<%
					YtUserinfo user = SessionUtil.getCurrentUser(request);
						if (user != null) {
							YtUserinfo usert = (YtUserinfo) user;
							if ("100261".equals(usert.getUserid())) {//100261管理员用户
					%>
					<button id="btn_unlock" type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>解锁
					</button>
					<%
							}
						}
					%>

				</div>
				<table id="tb_departments" class="scrolltable"></table>
				<style>
					.btn {
						line-height: 0.8;
					}
					
					.fixed-table-body {
						height: auto;
					}
					
				</style>
				
			</div>
				
		</div>
	<%--<jsp:include page="busType.jsp"></jsp:include>--%>
	<jsp:include page="userinfo_add.jsp"></jsp:include>
	<jsp:include page="userinfo_edit.jsp"></jsp:include> 
	<jsp:include page="userinfo_detail.jsp"></jsp:include>
	<jsp:include page="userinfo_recharge.jsp"></jsp:include>
	<jsp:include page="../confirm/confirm.jsp"></jsp:include>

	</body>

</html>
