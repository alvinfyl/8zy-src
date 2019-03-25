$(function() {
   // inittime();
    init();
    //	  日期时间
     $(".form_datetime").jeDate({
        isinitVal:true,
	    initDate:[{hh:00,mm:00,ss:00},false],
	    minDate: '2016-06-16',
	    maxDate: '2025-06-16',
	    format:"YYYY-MM-DD hh:mm:ss",
	    zIndex:3000
    });
    $(".form_datetime2").jeDate({
        isinitVal:true,
	    initDate:[{hh:23,mm:59,ss:59},false],
	    minDate: '2016-06-16',
	    maxDate: '2025-06-16',
	    format:"YYYY-MM-DD hh:mm:ss",
	    zIndex:3000
    });
    
    //重置按钮
    $("#resetBtn").click(function(){ 
			$('#formSearch')[0].reset();
			$('#userid').val("");
			$(".form_datetime").jeDate({
		        isinitVal:true,
			    initDate:[{hh:00,mm:00,ss:00},false],
			    minDate: '2016-06-16',
			    maxDate: '2025-06-16',
			    format:"YYYY-MM-DD hh:mm:ss",
			    zIndex:3000
		    });
		    $(".form_datetime2").jeDate({
		        isinitVal:true,
			    initDate:[{hh:23,mm:59,ss:59},false],
			    minDate: '2016-06-16',
			    maxDate: '2025-06-16',
			    format:"YYYY-MM-DD hh:mm:ss",
			    zIndex:3000
		    });
       });
});




function init() {
     $("#tb_keword").bootstrapTable({
        url : basePath + "/loginlog/searchloginlog",
        method : "post",
        toolbar: '#toolbar',
        striped: true,
        cache: false,
        pagination: true,
        sortable: false,
        sidePagination: "server",
        pageNumber:1,
        pageSize: 10,
        pageList: [10, 20, 200, 500],
        search: false,
        showColumns: true,
        showRefresh: true,
        minimumCountColumns: 2,
        clickToSelect: true,
        uniqueId: "id",
        showToggle:true,
        queryParams:queryParams,			//点击分页
        onDblClickRow : function(rowData, rowIndex){
            //seedetail(rowData);
        },
         columns : [ [ {
             checkbox : true,
         },{
             field : 'userinfo.useren',
             title : '用户名',
             width : 100
         },{
             field : 'uname',
             title : '用户名称',
             width : 100
         }, {
             field : 'failedcount',
             title : '失败次数',
             align : 'center',
             width : 80
         },{
             field : 'logintime',
             title : '登录时间',
             width : 120
         },{
             field : 'loginip',
             title : '登录IP',
             width : 120
         },{
             field : 'remark',
             title : '描述',
             width : 140
         }] ]
    });
}

function doDelete() {
    var tokenstr=$("#token").val();
     var ids = [];
     var checkmanages = $("#tb_keword").bootstrapTable('getSelections');
     for (var i = 0; i < checkmanages.length; i++) {
         console.info(checkmanages[i]);
         ids.push(checkmanages[i].id);
     }
     console.info(ids.join(","));
     if (ids.length == 0) {
         toastr.warning('必须选择需要删除的数据');
         return;
     }
     var id = ids.toString();
     if (id != null) {
        show_confirm("提示框","您确定要删除吗",function (result) {
         	if (result) {
         		$.ajax({
                    url : basePath + '/loginlog/del/' + id,
                    data:{token:tokenstr},
                    success : function(data) {
                        if (data == 'success') {
                            toastr.success("删除成功");
                            $('#tb_keword').bootstrapTable('refresh');
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
function queryParams(params) {
	    var temp = {
	        limit: params.limit,  //页面大小
	        offset: params.offset, //页码
			userid : $('#uname12212').val(),
			startTime : $('#notrigger').val(),
            endTime : $('#notrigger2').val()
	    };
	    return temp;
	}

	
// 查询
function serchstrk() {
    $('#tb_keword').bootstrapTable('destroy');
    init();
}

