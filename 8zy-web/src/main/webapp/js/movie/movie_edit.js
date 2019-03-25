$(function () {	
	//  转义
    function htmlDecode(value) {
        if (value) {
            return $('<div />').html(value).text();
        } else {
            return '';
        }
    }
    	//编辑
		$("#btn_editgateway").click(function () {
			var ids = [];
	        var checkmanages = $("#gateTable").bootstrapTable('getSelections');
	        for (var i = 0; i < checkmanages.length; i++) {
	            ids.push(checkmanages[i].id);
	        }
	        if (ids.length == 0) {
	            toastr.warning( '必须选择一个进行查看或编辑');
	            return;
	        }
	        if (ids.length >1) {
	            toastr.warning('只能选择一个进行查看或编辑');
	            return;
	        }
	        $('#gatewayEditForm')[0].reset();
	        $('#gatewayEditForm').find("[name='id']").val(htmlDecode(checkmanages[0].id));
	        $('#gatewayEditForm').find("[name='gateway']").val(htmlDecode(checkmanages[0].gateway));
	        $('#gatewayEditForm').find("[name='gatewayname']").val(htmlDecode(checkmanages[0].gatewayname));
	        $('#gatewayEditForm').find("[name='username']").val(htmlDecode(checkmanages[0].username));
	        $('#gatewayEditForm').find("[name='password']").val(htmlDecode(checkmanages[0].password));
	        $('#gatewayEditForm').find("[name='ip']").val(htmlDecode(checkmanages[0].ip));
	        $('#gatewayEditForm').find("[name='port']").val(htmlDecode(checkmanages[0].port));
	        $('#gatewayEditForm').find("[name='longcode']").val(htmlDecode(checkmanages[0].longcode));
	        $('#gatewayEditForm').find("[name='sendspeed']").val(htmlDecode(checkmanages[0].sendspeed));
	        $('#gatewayEditForm').find("[name='maxcount']").val(htmlDecode(checkmanages[0].maxcount));
	        $('#gatewayEditForm').find("[name='iscm']").val(htmlDecode(checkmanages[0].iscm));
	        $('#gatewayEditForm').find("[name='iscu']").val(htmlDecode(checkmanages[0].iscu));
	        $('#gatewayEditForm').find("[name='isct']").val(htmlDecode(checkmanages[0].isct));
	        $('#gatewayEditForm').find("[name='othergateway']").val(htmlDecode(checkmanages[0].othergateway));
	        if (checkmanages[0].iscm==1 && checkmanages[0].iscu==1&& checkmanages[0].isct==1&& checkmanages[0].othergateway==1) {
	        	$("#operType_edit").val(5);
			}else if (checkmanages[0].iscm==1) {
	        	$("#operType_edit").val(1);
			}else if (checkmanages[0].iscu==1) {
	        	$("#operType_edit").val(2);
			}else if (checkmanages[0].isct==1) {
	        	$("#operType_edit").val(3);
            }else{
				$("#operType_edit").val(4);
			}

			console.info(checkmanages);
	        $('#gatewayEditForm').find("[name='targetway']").val(htmlDecode(checkmanages[0].targetway));
	        $('#gatewayEditForm').find("[name='hassign']").val(checkmanages[0].hassign);
			$('#gatewayEditForm').find("[name='protocolversion']").val(htmlDecode(checkmanages[0].protocolversion));
			$('#gatewayEditForm').find("[name='controlsize']").val(htmlDecode(checkmanages[0].controlsize));
			$('#gatewayEditForm').find("[name='moip']").val(htmlDecode(checkmanages[0].moip));
			$('#gatewayEditForm').find("[name='moport']").val(htmlDecode(checkmanages[0].moport));
			$('#gatewayEditForm').find("[name='mousername']").val(htmlDecode(checkmanages[0].mousername));
			$('#gatewayEditForm').find("[name='mopassword']").val(htmlDecode(checkmanages[0].mopassword));
			$('#gatewayEditForm').find("[name='servicetype']").val(htmlDecode(checkmanages[0].servicetype));
			$('#gatewayEditForm').find("[name='nodeid']").val(htmlDecode(checkmanages[0].nodeid));
			$('#gatewayEditForm').find("[name='serviceid']").val(htmlDecode(checkmanages[0].serviceid));
			$('#gatewayEditForm').find("[name='remark']").val(htmlDecode(checkmanages[0].remark));
	        $('#gateway_edit').modal('show');
	    });
		$('#gateway_edit').on('show.bs.modal', function() {  
		    $("#gatewayEditForm").data('bootstrapValidator').destroy();
		    $('#gatewayEditForm').data('bootstrapValidator', null);
		    editvalrGateway();
		});
		$("#operType_edit").change(function(){ 
	  	    var value = $(this).val();
	  	    $('#gatewayEditForm').find("[name='iscm']").val(0);
			$('#gatewayEditForm').find("[name='iscu']").val(0);
			$('#gatewayEditForm').find("[name='isct']").val(0);
			$('#gatewayEditForm').find("[name='othergateway']").val(0);
		  	if(value==1){
				$('#gatewayEditForm').find("[name='iscm']").val(1);
			}
			if(value==2){
				$('#gatewayEditForm').find("[name='iscu']").val(1);
			}
			if(value==3){
				$('#gatewayEditForm').find("[name='isct']").val(1);
			}
			if(value==4){
				$('#gatewayEditForm').find("[name='othergateway']").val(1);
			}
			if(value==5){
				$('#gatewayEditForm').find("[name='iscm']").val(1);
				$('#gatewayEditForm').find("[name='iscu']").val(1);
				$('#gatewayEditForm').find("[name='isct']").val(1);
				$('#gatewayEditForm').find("[name='othergateway']").val(1);
			}
		});
	});
var notedit=true;
function saveedit() {
    if (notedit) {
        notedit = false;
        $.ajax({
            url:basePath + '/passway/save',
            contentType: 'application/json',
            type: 'post',
            data: JSON.stringify($('#gatewayEditForm').serializeJSON()),
            success: function (data) {
                notedit = true;
                if (data == "success") {
                    toastr.success("修改成功");
                    $('#gateway_edit').modal('hide');
                    $('#gateTable').bootstrapTable('refresh');
                } else {
                    toastr.warning("修改"+data);
                }
            }
        });
    }
}


