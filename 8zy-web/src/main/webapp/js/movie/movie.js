$(function () {
    init();
	//重置按钮事件
      $(function () {
      	$("#resetBtn").click(function(){ 
			$('#formSearch')[0].reset();
            serchstrk()
        });  
     })
});

function init() {
    //初始化Table
        $('#gateTable').bootstrapTable({
            url: basePath + '/movie/querymovie',        //请求后台的URL（*）
            method: 'post',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 20, 200, 500],        //可供选择的每页的行数（*）
            search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            //height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
            //showExport: true,                     //是否显示导出
            singleSelect: true,                   //是否单选
            exportDataType: "basic",              //basic', 'all', 'selected'.
            onDblClickRow : function(rowData, rowIndex){
            	console.log(rowData.username);
            },
            columns: [{
				checkbox : true
			}, {
				field : 'title',
				title : '标题',
				align : 'center',
				width : 100
			}, {
				field : 'describe',
				title : '描述',
				align : 'center',
				width : 100
			},{
				field : 'lDirector',
				title : '导演',
				align : 'center',
				width : 100
			},{
				field : 'lType',
				title : '类型',
				align : 'center',
                width : 100
			/*	width : 80,
				formatter : function(value, row, index) {
					if (value == "1") {
						return "是";
					} else {
						return "否";
					}
				}*/
			}, {
				field : 'updatetime',
				title : '更新日期',
				align : 'center',
				width : 100
			}, {
				field : 'clicks',
				title : '点击量',
				align : 'center',
				width : 100
			}
          ]
        });
};

function serchstrk() {
    var gateway = $('#txt_search_gateway').val();
    var gatewayname = $('#txt_search_gatewayname').val();
    var opertype = $('#operType_search').val();
    $('#gateTable').bootstrapTable('refresh', {
        query:{
        	gateway:gateway,
        	gatewayname:gatewayname,
        	opertype:opertype
         }
    });
}



function doDelete() {
    var ids = [];
    var checkmanages = $("#gateTable").bootstrapTable('getSelections');
    console.info(checkmanages);
    for (var i = 0; i < checkmanages.length; i++) {
        console.info(checkmanages[i]);
        ids.push(checkmanages[i].id);
    }
    if (ids.length == 0) {
        toastr.warning('必须选择需要删除的数据');
        return;
    }
    var id = ids.toString();
    if (id != null) {
        show_confirm("提示框","确定要删除吗?",function (result) {
        	if (result) {
        		$.ajax({
	                url : basePath + '/passway/del/',
	                data:{id:id},
	                type:"post",
	                success : function(data) {
	                    if (data == 'success') {
	                        toastr.success("删除成功");
	                        $('#gateTable').bootstrapTable('refresh');
	                    }
	                    else
	                    {
	                        toastr.warning('提示 删除失败,'+data);
	                    }
	                }
	            });
        	}
        });
    }
}


