<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/plugins/bootstrap-table/bootstrap-table.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/plugins/treeview/bootstrap-treeview.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/bootstrapValidator.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/toastr.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/jedate.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap/css/xcConfirm.css"/>
    <script src="${pageContext.request.contextPath }/plugins/jQuery/respond.js"></script>
    <script src="${pageContext.request.contextPath }/js/basepath.js"></script>
	<script src="${pageContext.request.contextPath }/plugins/jQuery/jquery-1.9.1.min.js"></script>
	<!--bootstrap-->
	<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath }/plugins/treeview/bootstrap-treeview.min.js"></script>
    <script src="${pageContext.request.contextPath }/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
    <script src="${pageContext.request.contextPath }/bootstrap/js/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath }/bootstrap/js/toastr.min.js"></script>
    <!--日期时间-->
	<script src="${pageContext.request.contextPath }/bootstrap/js/jquery.jedate.min.js"></script>
	<!--弹框-->
	<script src="${pageContext.request.contextPath }/bootstrap/js/xcConfirm.js"></script>

    <script src="${pageContext.request.contextPath }/bootstrap/tableExport.min.js"></script>
    <script src="${pageContext.request.contextPath }/bootstrap/bootstrap-table-export.min.js"></script>
    <!--bootstrap兼容IE-->
    <script src="${pageContext.request.contextPath }/plugins/jQuery/jquery.placeholder.min.js"></script>
	
    <script type="text/javascript">
	    $(function () {
	        // Invoke the plugin
	        $('input, textarea').placeholder();
	    });

	    var contextPath = "${pageContext.request.contextPath }"
        basePath = contextPath;

        $.fn.serializeJson=function(){
            var serializeObj={};
            var array=this.serializeArray();
            // var str=this.serialize();
            $(array).each(function(){ // 遍历数组的每个元素
                if(serializeObj[this.name]){ // 判断对象中是否已经存在 name，如果存在name
                    if($.isArray(serializeObj[this.name])){
                        serializeObj[this.name].push(this.value); // 追加一个值 hobby
                    }else{
                        // 将元素变为 数组 ，hobby
                        serializeObj[this.name]=[serializeObj[this.name],this.value];
                    }
                }else{
                    serializeObj[this.name]=this.value; // 如果元素name不存在，添加一个属性 name:value
                }
            });
            return serializeObj;
        };


	</script>
	<style type="text/css">
		body{background:#ECF0F5;
            scrollbar-arrow-color:red; /*三角箭头的颜色*/

            　　scrollbar-face-color:green; /* 立体滚动条的颜色（包括箭头部分的背景色） */

            　　scrollbar-3dlight-color: blue; /* 立体滚动条亮边的颜色 */

            　　scrollbar-highlight-color: #ddd; /* 滚动条的高亮颜色（左阴影？） */

            　　scrollbar-shadow-color: pink;/* 立体滚动条阴影的颜色 */

            　　scrollbar-darkshadow-color: #ccc;/* 立体滚动条外阴影的颜色 */

            　　scrollbar-track-color: orange; /* 立体滚动条背景颜色 */

            　　scrollbar-base-color: yellow;/* 滚动条的基色 */}
		/* 设置滚动条的样式 */


        ::-webkit-scrollbar {
				width: 8px;
				height:5px;
			}
			/* 滚动槽 */
			
			::-webkit-scrollbar-track {
				-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
                scrollbar-dark-shadow-color:inset 0 0 6px rgba(0, 0, 0, 0.3);
				border-radius: 10px;
			}
			/* 滚动条滑块 */

			::-webkit-scrollbar-thumb {
				border-radius: 10px;
				background: #dfe5f3;
				-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.5);
                scrollbar-base-color: #dfe5f3;
			}

			::-webkit-scrollbar-thumb:window-inactive {
				background: rgba(255, 0, 0, 0.4);
			}
			.fixed-table-body {
	            height: auto;
	        }
			table{table-layout: fixed;word-break:break-all;overflow:auto;}
			td{
		  		overflow:hidden;white-space:nowrap;text-overflow:ellipsis;
		  	}
		  	td:hover {height: auto;white-space: normal;}
		  	th:hover {height: auto;white-space: normal;}
            iframe{border:none !important;}
	</style>
</head>

