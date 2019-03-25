<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<jsp:include page="../common/common.jsp"></jsp:include>

<head>
    <meta charset="utf-8">
    <title>用户特征号管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/code/code.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="${pageContext.request.contextPath }/js/userconcode/user_con_code.js"></script>
    <script src="${pageContext.request.contextPath }/js/userconcode/user_con_code_add.js"></script>
	<script src="${pageContext.request.contextPath }/js/userconcode/user_con_code_validator.js"></script>

</head>
<body>
<div class="panel-body">
    <div style="">
        <form id="add_form" class="form-horizontal" style="margin-bottom:0px !important;">
            <div class="form-group" style="display: flex;justify-content: flex-start;align-items: center;margin-left:0">
                <div>用户名称:</div>
                <div>
                    <input type="hidden" name="userid" value="${userInfo.userid}">
                    <input type="text" class="form-control " thename="chnGroupName" value="${userInfo.username}"  readonly>
                </div>
                <div style="margin-left: 15px;">特征码:</div>
                <div>
                    <input type="text" class="form-control " name="codename" value="" maxlength="2"  style="width: 150px;">
                </div>
                <div style="margin-left: 15px;">描述:</div>
                <div>
                    <input type="text" class="form-control " name="remark" value="" maxlength="20"  style="width: 200px;">
                </div>
                <button type="button" onclick="$('#add_form').submit()" style="margin-left: 20px" id="btn_add" class="btn btn-primary">新增
                </button>
            </div>
        </form>
    </div>
    <div style="">
        <div id="toolbar" class="btn-group">
            <button id="btn_back" type="button" class="btn btn-default btn-setting"  onclick="history.back(-1);">
                <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>返回
            </button>
        </div>
        <table id="tb_main"></table>
    </div>
</div>

</body>
</html>
