$(function () {
	addvalrGateway();
    editvalrGateway();
});

function addvalrGateway() {
    $('#AddForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        }
    }).on("success.form.bv",function(e){
    	saveadd();
        return false;
    });
}

var codeajax = true;
function editvalrGateway() {
    $('#gatewayEditForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            gateway: {
                validators: {
                    notEmpty: {
                        message: '通道编号不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 3,
                        message: '通道编号不能超过3'
                    },
                    threshold :  6 
                    
                }
            }
        }
    }).on("success.form.bv",function(e){
        saveedit();
        return false;
    });
}

function isTrueName(s)
{
    var patrn=/^[0-9]{6,12}$/;
    if (!patrn.exec(s))
        return false;
    return true;
}