$(function () {
    init();
    //业务敏感词鼠标移入时间
    $('#blackName').mouseover(function () {
        $('.blackTap2').show();
    });
    $('#blackName').mouseout(function () {
        $('.blackTap2').hide();
    });

    $('#blackTwo').mouseover(function () {
        $('.blackTap').show();
    });
    $('#blackTwo').mouseout(function () {
        $('.blackTap').hide();
    });

    //重置按钮
    $("#resetBtn").click(function () {
        $('#formSearch')[0].reset();
        serchstrk();
    });


    $('#btn_unlock').click(function () {
        var tokenstr = $("#token").val();
        var ids = [];
        var checkmanages = $("#tb_departments").bootstrapTable('getSelections');
        console.info(checkmanages);
        for (var i = 0; i < checkmanages.length; i++) {
            console.info(checkmanages[i]);
            ids.push(checkmanages[i].userid);
        }
        console.info(ids.join(","));
        if (ids.length == 0) {
            toastr.warning('必须选择需要删除的数据');
            return;
        }
        var id = ids.toString();
        if (confirm("确认解锁用户?")) {
            $.ajax({
                url: basePath + "/user/unlock",
                contentType: 'application/json',
                type: 'post',
                data: JSON.stringify({
                    'userid': id
                }),
                success: function (result) {
                    if (result == 'success') {
                        toastr.success("解锁成功");
                        $('#tb_departments').bootstrapTable('refresh');
                    }

                }
            });
        }


    });


});

function init() {
    //初始化Table
    $('#tb_departments').bootstrapTable({
        url: basePath + "/user/queryCondition",         //请求后台的URL（*）
        method: 'post',                      //请求方式（*）
        toolbar: '#toolbar',                //工具按钮用哪个容器
        striped: true,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        sortable: false,                     //是否启用排序
        sortOrder: "asc",                   //排序方式
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 10,                       //每页的记录行数（*）
        pageList: [10, 50, 100, 500],        //可供选择的每页的行数（*）
        search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
        strictSearch: true,
        showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        minimumCountColumns: 2,             //最少允许的列数
        clickToSelect: true,                //是否启用点击选中行
        //height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "id",                     //每一行的唯一标识，一般为主键列
        showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
        //showExport: true,                     //是否显示导出
        singleSelect: true,                   //是否单选
        exportDataType: "all",              //basic', 'all', 'selected'.
        exportTypes: ['excel'],  //导出文件类型
        exportOptions: {
            ignoreColumn: [0],  //忽略某一列的索引
            fileName: '用户数据',  //文件名称设置
            worksheetName: 'sheet1',  //表格工作区名称
            tableName: '用户数据',
            excelstyles: ['background-color', 'color', 'font-size', 'font-weight'],
        },

        queryParams: queryParams,
        onDblClickRow: function (rowData, rowIndex) {
            console.log(rowData.username);
        },
        columns: [{
            checkbox: true
        }, {
            field: 'useren',
            title: '用户帐号',
            width: 80
        }, {
            field: 'username',
            title: '用户姓名',
            width: 80
        }, {
            field: 'mobile',
            title: '联系电话',
            width: 80
        }, /*{
				field : 'balance',
				title : '余额',
			},*/{
            field: 'sign',
            title: '签名',
            width: 80
        }, {
            field: 'cpid',
            title: '关联通道组',
            width: 100
        },
            {
                field: 'deptid',
                title: '所属机构',
            	width: 80,
                formatter: function (value, row, index) {
                    if (row.dept) {
                        return row.dept.deptname;
                    } else {
                        return '';
                    }
                }
            }, {
                field: 'roleid',
                title: '用户角色',
            	width: 80,
                formatter: function (value, row, index) {
                    if (row.role) {
                        return row.role.rolename;
                    } else {
                        return '';
                    }
                }
            }, {
                field: 'protype',
                title: '用户类型',
            	width: 80,
                formatter: function (value, row, index) {
                    if (row.protype == 0) {
                        return '管理员';
                    } else if (row.protype == 1) {
                        return '管理用户';
                    } else if (row.protype == 2) {
                        return '接口用户';
                    } else if (row.protype == 3) {
                        return 'CMPP用户';
                    }
                }
            }, {
                field: 'status',
                title: '用户状态',
            	width: 80,
                formatter: function (value, row, index) {
                    if (row.status == 2) {
                        return '启用';
                    } else if (row.status == 3) {
                        return '禁用';
                    } else if (row.status == 0) {
                        return '删除';
                    } else if (row.status == 1) {
                        return '初始';
                    }
                }
            },
            {
                field: 'userid',
                title: '操作',
            	width: 120,
            	align: 'left',
                width:'200px',
                formatter: function (value, row, index) {
                    return "<span class=\"btn btn-primary\" onclick=\"tzmurl('" + value + "')\">特征码设置 </span>" + "<span class=\"btn btn-primary\" style=\"margin-left:5px;\" onclick=\"tzmurl11('" + value + "')\">业务类型 </span>";
                }
            },

        ]
    });
//  滚动条
    /*var tableHeight = $("body").height() - $(".selectBox").height() * 2 - $(".fixed-table-toolbar").height() - $(".fixed-table-pagination").height() - 13 + 'px';
    $(".fixed-table-body").height(tableHeight);
    $(".fixed-table-body").css("overflow-y","scroll");*/
};

//特征码设置
function tzmurl(userid) {
    location.href = basePath + '/userConCode/toUserConCode/' + userid;
}
function tzmurl11(userid) {
    location.href = basePath + '/user/toBusUserType/' + userid;
}
function queryParams(params) {
    var username = $('#txt_search_username').val();
    var statu = $('#departid').val();
    var temp = {
        limit: params.limit,  //页面大小
        offset: params.offset, //页码
        username: username,
        deptid: statu
    };
    return temp;
}


function serchstrk() {
    $("#tb_departments").bootstrapTable('destroy');
    init();
    //$('#tb_departments').bootstrapTable('refresh');
}

//禁用/启用
function setStatus(){
     var ids = [];
     var checkmanages = $("#tb_departments").bootstrapTable('getSelections');
     for (var i = 0; i < checkmanages.length; i++) {
         ids.push(checkmanages[i].id);
     }

     if (ids.length == 0) {
         toastr.warning( '必须选择一个进行禁用或启用');
         return;
     }
     if (ids.length >1) {
         toastr.warning('只能选择一个进行禁用或启用');
         return;
     }
     //var id = ids.toString();
     var id = checkmanages[0].userid;
     var status = checkmanages[0].status;
     
     show_confirm("提示框","确认启动/禁用吗?",function (result) {
			if (result) {
				$.ajax({
	                url: basePath + '/user/setStatus/',
	                data: {id: id,status:status},
	                success: function (data) {
	                    if (data == 'success') {
	                        toastr.success("更新状态成功");
	                        $('#tb_departments').bootstrapTable('refresh');
	                    }
	                    else {
	                        toastr.warning('提示修改状态失败,' + data);
	                    }
	                }
	            });
			}
		});
 }

function doDelete() {
    var tokenstr = $("#token").val();
    var ids = [];
    var checkmanages = $("#tb_departments").bootstrapTable('getSelections');
    console.info(checkmanages);
    for (var i = 0; i < checkmanages.length; i++) {
        console.info(checkmanages[i]);
        ids.push(checkmanages[i].userid);
    }
    console.info(ids.join(","));
    if (ids.length == 0) {
        toastr.warning('必须选择需要删除的数据');
        return;
    }
    var id = ids.toString();
    if (id != null) {
        show_confirm("提示框", "确认删除吗?", function (result) {
            if (result) {
                $.ajax({
                    url: basePath + '/user/del/' + id,
                    data: {token: tokenstr},
                    success: function (data) {
                        if (data == 'success') {
                            toastr.success("删除成功");
                            $('#tb_departments').bootstrapTable('refresh');
                        }
                        else {
                            toastr.warning('提示 删除失败,' + data);
                        }
                    }
                });
            }
        });
    }
}