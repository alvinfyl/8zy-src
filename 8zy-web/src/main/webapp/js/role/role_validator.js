$(function () {
    addvalr();
    editvalr();
});


function addvalr() {
    $('#roleaddform').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            rolename: {
                message: '请输入名称',
                validators: {
                    notEmpty: {
                        message: '名称不能为空'
                    },

                }
            }
        }
    }).on("success.form.bv",function(e){

        savek();
        return false;
    });
}

function editvalr() {
    $('#roleeditform').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            rolename: {
                message: '请输入名称',
                validators: {
                    notEmpty: {
                        message: '名称不能为空'
                    },

                }
            }
        }
    }).on("success.form.bv",function(e){
        editsavek22();
        return false;
    });
}