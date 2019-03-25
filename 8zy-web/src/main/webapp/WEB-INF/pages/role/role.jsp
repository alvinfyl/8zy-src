<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../common/common.jsp"></jsp:include>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>角色管理</title>
    <%--<script src="${pageContext.request.contextPath }/bower_components/jquery/jquery.js"  type="text/javascript"></script>--%>
    <link href="${pageContext.request.contextPath }/plugins/treeview/bootstrap-treeview.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/plugins/treeview/bootstrap-treeview.min.js"  type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/js/role/role_main.js"></script>
    <script src="${pageContext.request.contextPath }/js/role/role_edit.js"></script>
    <script src="${pageContext.request.contextPath }/js/role/role_add.js"></script>
    <script src="${pageContext.request.contextPath }/js/role/role_validator.js"></script>

</head>

<body>
<div class="panel-body" style="padding-bottom: 0px;">
    <div id="toolbar" class="btn-group">
        <button  class="btn btn-default" data-toggle="modal" data-target="#roleAddModal" id="btn_add">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="btn_edit" type="button"  class="btn btn-default" >
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
        </button>
        <button id="btn_delete" type="button" class="btn btn-default" onclick="doDelete()">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>
    <style>
        .btn{
            line-height: 0.8;
        }
    </style>
    <table id="tb_role"></table>
</div>

<jsp:include page="role_add.jsp"></jsp:include>
<jsp:include page="role_edit.jsp"></jsp:include>
<jsp:include page="../confirm/confirm.jsp"></jsp:include>

</body>
</html>