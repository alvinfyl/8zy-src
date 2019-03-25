$(function() {
    getSelect("#roleid",basePath+"/role/search1",null,'rolename','id');
    getSelect("#cpid",basePath+"/channelGroup/queryallcg",null,'cgname','id');
    getSelect("#feedeptid",basePath+"/feeDept/queryallFeeDept",null,'dept','id');
    $("#btn_adduser").click(function () {

    });
});
function saveuser1() {
	var dnameVal = $("#dname").val();
	console.log(dnameVal);
	
	if(dnameVal){
		$(".help-blocks").css("display","none");
		$.ajax({
            url : basePath + '/user/add',
            contentType: 'application/json',
            type : 'post',
            data : JSON.stringify($('#userindfoaddform2').serializeJSON()),
            success : function(data) {
                subadd = true;
                if(data == "success") {
                    toastr.success("添加成功");
                    $('#userindfoadd').modal('hide');
                    $('#tb_departments').bootstrapTable('refresh');
                    $("#userindfoaddform2").data('bootstrapValidator').resetForm();
                    $('#userindfoaddform2')[0].reset();
                } else {
                    toastr.warning(data);
                }
            }
        });
	} else {
		$(".help-blocks").css("display","block");
	}
        
}
	
   