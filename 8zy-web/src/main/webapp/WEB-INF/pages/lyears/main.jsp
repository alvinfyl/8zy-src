<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<jsp:include page="../common/common.jsp"></jsp:include>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>通道管理</title>
        <style type="text/css">
        	/*页面样式*/
        	.riqi{width:45px;font-weight: 700;}
        	.headbox{margin-right:10px;}
        	.dateBox{width:170px;}
        	.dataFar{display: flex;justify-content: flex-start;align-items: center;margin-left:0}
        	/*body{background:#ECF0F5;}*/
        	.btn {
						line-height: 0.8;
					}
					
					.fixed-table-body {
						height: auto;
					}
        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" href="${pageContext.request.contextPath }/img/favicon.ico" />
		<script src="${pageContext.request.contextPath }/js/lyears/main.js"></script>
    </head>
    <body>
    	<div class="panel-body" >
			<div>
				<form id="formSearch" class="form-horizontal" style="margin-bottom:0px !important;">
					<div class="form-group" style="display: flex;justify-content: flex-start;align-items: center;margin-left:0">
						<div class="headbox" style="float:left;">
							<input type="text" name="name" class="form-control" id="txt_search_1" placeholder="名称">
						</div>
						<div style="text-align: left;float: left;">
							<button type="button" style="margin-left: 20px" id="btn_query" onclick="serchstrk()" class="btn btn-primary">查询
                            </button>
						</div>
						<div style="text-align: left;float: left;">
							<button type="button" style="margin-left: 10px"  class="btn btn-primary" id="resetBtn">重置
                            </button>
						</div>
					</div>
				</form>
			</div>
			<div style="">
				<div id="toolbar" class="btn-group">
					<button id="btn_addgateway" type="button" class="btn btn-default btn-setting" data-toggle="modal" data-target="#modal_add">
		                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
		            </button>
					<button id="btn_edit" type="button" class="btn btn-default" >
		                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>查看/编辑
		            </button>
		            <button id="btn_delete" type="button" class="btn btn-default" onclick="doDelete()">
		                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
		            </button>
				</div>
				<table id="gateTable"></table>
			</div>
		</div>
 	</body>
 	<jsp:include page="add.jsp"></jsp:include>
 	<jsp:include page="edit.jsp"></jsp:include>
 	<jsp:include page="../confirm/confirm.jsp"></jsp:include>
</html>