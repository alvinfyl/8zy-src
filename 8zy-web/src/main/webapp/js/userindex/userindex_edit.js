$(function() {
    //editvalr();
    getSelect("#eroleid",basePath+"/role/search1",null,'rolename','id');
    getSelect("#ecpid",basePath+"/channelGroup/queryallcg",null,'cgname','id');
    getSelect("#refeedeptid",basePath+"/feeDept/queryallFeeDept",null,'dept','id');
//  转义
    function htmlDecode(value) {
        if (value) {
            return $('<div />').html(value).text();
        } else {
            return '';
        }
    }

    //业务敏感词鼠标移入时间
		$('#blackName3').mouseover(function () {
			$('.blackTap3').show();
		});
		$('#blackName3').mouseout(function () {
			$('.blackTap3').hide();
		});
		
		$('#blackName4').mouseover(function () {
			$('.blackTap4').show();
		});
		$('#blackName4').mouseout(function () {
			$('.blackTap4').hide();
		});
//	修改
    $('#btn_edituser').click(function () {
        var ids = [];
        var checkmanages = $("#tb_departments").bootstrapTable('getSelections');
        for (var i = 0; i < checkmanages.length; i++) {
            ids.push(checkmanages[i].id);
        }

//      console.info(ids.join(","));
        if (ids.length == 0) {
            toastr.warning( '必须选择一个进行查看或编辑');
            return;
        }
        if (ids.length >1) {
            toastr.warning('只能选择一个进行查看或编辑');
            return;
        }
        //var id = ids.toString();
        var id = checkmanages[0].userid;
        $("#userid").val(id);

        $("#userindfoeditform2").data('bootstrapValidator').resetForm();
        $('#userindfoeditform2')[0].reset();

        $.ajax({
            url : basePath + "/user/editUser",
            contentType: 'application/json',
            type : 'post',
            data :JSON.stringify({
                'userid':id
            }),
            success : function(userinfo) {
//              console.info(userinfo);
                $("#userindfoeditform2").find("[name='id']").val(htmlDecode(userinfo.id));
                $("#userindfoeditform2").find("[thename='useren']").val(htmlDecode(userinfo.useren));
                $("#userindfoeditform2").find("[name='userid']").val(htmlDecode(userinfo.userid));
                $("#userindfoeditform2").find("[name='username']").val(htmlDecode(userinfo.username));
                $("#userindfoeditform2").find("[name='password']").val(htmlDecode(userinfo.password));
                $("#userindfoeditform2").find("[name='mobile']").val(htmlDecode(userinfo.mobile));
                $("#userindfoeditform2").find("[name='contact']").val(htmlDecode(userinfo.contact));
                $("#userindfoeditform2").find("[name='roleid']").val(htmlDecode(userinfo.roleid));
                $("#userindfoeditform2").find("[name='deptid']").val(htmlDecode(userinfo.deptid));
                if(userinfo.dept&&userinfo.dept.deptname){
                    $("#userindfoeditform2").find("[thename='dname']").val(htmlDecode(userinfo.dept.deptname));
                }
                $("#userindfoeditform2").find("[name='status']").val(htmlDecode(userinfo.status));
                $("#userindfoeditform2").find("[name='sign']").val(htmlDecode(userinfo.sign));
                $("#userindfoeditform2").find("[name='signtype']").val(htmlDecode(userinfo.signtype));
                $("#userindfoeditform2").find("[thename='code']").val(htmlDecode(userinfo.code));
                $("#userindfoeditform2").find("[name='cpid']").val(htmlDecode(userinfo.cpid));
                $("#userindfoeditform2").find("[name='feedeptid']").val(htmlDecode(userinfo.feedeptid));
                $("#userindfoeditform2").find("[name='userip']").val(htmlDecode(userinfo.userip));
                $("#userindfoeditform2").find("[name='sublength']").val(htmlDecode(userinfo.sublength));
                $("#userindfoeditform2").find("[name='userip']").val(htmlDecode(userinfo.userip));
                $("#userindfoeditform2").find("[name='reportflag']").val(userinfo.reportflag);
                $("#userindfoeditform2").find("[name='reporturl']").val(htmlDecode(userinfo.reporturl));
                $("#userindfoeditform2").find("[name='mourl']").val(htmlDecode(userinfo.mourl));
                $("#userindfoeditform2").find("[name='protype']").val(htmlDecode(userinfo.protype));
                $("#userindfoeditform2").find("[name='priority']").val(htmlDecode(userinfo.priority));
                $("#userindfoeditform2").find("[name='maxsend']").val(htmlDecode(userinfo.maxsend));
                $("#userindfoeditform2").find("[name='remark']").val(htmlDecode(userinfo.remark));
                $("#userindfoeditform2").find("[name='saleman']").val(htmlDecode(userinfo.saleman));
                $("#userindfoeditform2").find("[name='createtime']").val(htmlDecode(userinfo.createtime));
                $("#userindfoeditform2").find("[name='empid']").val(htmlDecode(userinfo.empid));
                $("#userindfoeditform2").find("[name='cardid']").val(htmlDecode(userinfo.cardid));
                $("#userindfoeditform2").find("[name='email']").val(htmlDecode(userinfo.email));

            }
        });
        $("#userindfoedit").modal();
    });
    
    

});

function editsavekuser() {
	var dnameVal = $("#dname2").val();
	console.log(dnameVal);
	if(dnameVal){
		$(".help-blocks2").css("display","none");
		 $.ajax({
		        url : basePath + '/user/update',
		        contentType: 'application/json',
		        type : 'post',
		        data : JSON.stringify($('#userindfoeditform2').serializeJSON()),
		        success : function(data) {
		            subadd = true;
		            if(data == "success") {
		                toastr.success("修改成功");
		                $('#userindfoedit').modal('hide');
		                $('#tb_departments').bootstrapTable('refresh');
		                $("#userindfoeditform2").data('bootstrapValidator').resetForm();
		                $('#userindfoeditform2')[0].reset();
		                $("#userindfoedit").modal('hide');
		            } else if(data == "密码为空"){
		            	toastr.warning("密码为空");
		            } else if(data == "登录密码必须在6到20位之间"){
		            	toastr.warning("登录密码必须在6到20位之间");
		            } else{
		            	toastr.warning("修改失败");
		            }
		        }
		    });
	} else {
		$(".help-blocks2").css("display","block");
	}
   
}


