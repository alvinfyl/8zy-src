<%@page import="com.zy.entity.YtRole" %>
<%@ page import="com.zy.entity.YtUserinfo" %>
<%@ page import="com.zy.utils.SessionUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    YtUserinfo loginUser = SessionUtil.getCurrentUser(request);
    if (loginUser == null)
        out.print("请登录系统");
    YtRole role = loginUser.getRole();
    String rolename = "", deptname = "";
    if (role != null)
        rolename = role.getRolename();

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <%-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">--%>
    <!-- Ionicons -->
    <%-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">--%>
    <!-- jvectormap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/skins/_all-skins.min.css">

    <style type="text/css">
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
            background: rgba(0, 255, 0, 0.1);
            -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.5);
        }

        ::-webkit-scrollbar-thumb:window-inactive {
            background: rgba(255, 0, 0, 0.4);
        }

        /* 设置滚动条的样式 */

        /* 滚动槽 */
        ::-ms-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
        }

        /* 滚动条滑块 */
        ::-ms-thumb {
            border-radius: 10px;
            background: rgba(0, 255, 0, 0.1);
            -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.5);
        }

        ::-ms-thumb:window-inactive {
            background: rgba(255, 0, 0, 0.4);
        }

        ul {
            padding: 20px;
            font-size: 16px;
        }

        li {
            border-bottom: 1px solid #eee;
            list-style: none;
            margin: 10px;
            padding: 10px;
        }

        li span {
            padding-right: 96px;
        }
    </style>


</head>
<body class="hold-transition skin-blue sidebar-mini">

<!-- Main content -->
<section class="content">
    <!-- Info boxes -->
    <!-- Main row -->
    <div class="row">
        <!-- Left col -->
        <div class="col-md-6" style="width:50%;">
            <!-- MAP & BOX PANE -->
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title">账号信息</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                class="fa fa-minus"></i>
                        </button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <div class="row">
                        <div style="height:665px;padding:0 20px;">
                            <ul>
                                <%--<li><span>用户ID:</span><span><%=loginUser.getUserid() %></span></li>--%>
                                <li><span>用户账号:</span><span><%=loginUser.getUseren() %></span></li>
                                <li><span>所属角色:</span><span><%=rolename %></span></li>
                                <li><span>所属机构:</span><span><%=deptname %></span></li>
                                <li><span>用户名称:</span><span><%=loginUser.getUsername() %></span></li>
                            </ul>
                        </div>

                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.box-body -->
            </div>

            <!-- /.box -->
        </div>
        <!-- /.col -->


        <!-- /.box -->
    </div>
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->
</body>
</html>
