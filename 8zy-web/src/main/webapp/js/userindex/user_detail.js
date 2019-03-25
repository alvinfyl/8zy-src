$(function() {
	
	
	//业务敏感词鼠标移入时间
		$('#blackName5').mouseover(function () {
			$('.blackTap5').show();
		});
		$('#blackName5').mouseout(function () {
			$('.blackTap5').hide();
		});
		
		$('#blackName6').mouseover(function () {
			$('.blackTap6').show();
		});
		$('#blackName6').mouseout(function () {
			$('.blackTap6').hide();
		});
    
//	查看详情
    $('#btn_searchuser').click(function () {
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

        $("#userindfoeditform").data('bootstrapValidator').resetForm();
        $('#userindfoeditform')[0].reset();

        $.ajax({
            url : basePath + "/user/editUser",
            contentType: 'application/json',
            type : 'post',
            data :JSON.stringify({
                'userid':id
            }),
            success : function(userinfo) {
//              console.info(userinfo);
                $("#userindfoeditform").find("[name='id']").val(userinfo.id);
                $("#userindfoeditform").find("[name='useren']").val(userinfo.useren);
                $("#userindfoeditform").find("[name='userid']").val(userinfo.userid);
                $("#userindfoeditform").find("[name='username']").val(userinfo.username);
                $("#userindfoeditform").find("[name='password']").val(userinfo.password);
                $("#userindfoeditform").find("[name='mobile']").val(userinfo.mobile);
                $("#userindfoeditform").find("[name='roleid']").val(userinfo.roleid);
                $("#userindfoeditform").find("[name='deptid']").val(userinfo.deptid);
                $("#userindfoeditform").find("[name='dname']").val(userinfo.dept.deptname);
                $("#userindfoeditform").find("[name='status']").val(userinfo.status);
                $("#userindfoeditform").find("[name='sign']").val(userinfo.sign);
                $("#userindfoeditform").find("[name='code']").val(userinfo.code);
                $("#oldcode").val(userinfo.code);
                $("#userindfoeditform").find("[name='sublength']").val(userinfo.sublength);
                $("#userindfoeditform").find("[name='userip']").val(userinfo.userip);
                $("#userindfoeditform").find("[name='reportflag']").val(userinfo.reportflag);
                $("#userindfoeditform").find("[name='reporturl']").val(userinfo.reporturl);
                $("#userindfoeditform").find("[name='mourl']").val(userinfo.mourl);
                $("#userindfoeditform").find("[name='protype']").val(userinfo.protype);
                $("#userindfoeditform").find("[name='priority']").val(userinfo.priority);
                $("#userindfoeditform").find("[name='maxsend']").val(userinfo.maxsend);
                $("#userindfoeditform").find("[name='remark']").val(userinfo.remark);

            }
        });
        $("#userindfodetail").modal();
    });
    

});



