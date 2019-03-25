$(function () {
    addvalrUser();
    editvalr();
});


function addvalrUser() {
    $('#userindfoaddform2').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            useren: {
                validators: {
                    notEmpty: {
                        message: '用户帐号不能为空'
                    },
                    stringLength: {
                        min: 3,
                        max: 20,
                        message: '用户帐号必须在3到20位之间'
                    },
                    threshold :  3 ,
                    remote: {
                        url: basePath + "/user/checkUserEn",
                        message: '用户已存在',
                        delay :  2000,
                        type: 'POST'
                    }
                }
            },
            username: {
                validators: {
                    notEmpty: {
                        message: '用户姓名不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 20,
                        message: '用户姓名必须在1到20位之间'
                    },
                    callback: {
                        message: '用户名称包含非法字符',
                        callback:function(value, validator,$field){
                            return !(value.indexOf(">")>-1||value.indexOf("<")>-1);
                        }
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: '登录密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 20,
                        message: '登录密码必须在6到20位之间'
                    },
                    callback: {
                        message: '用户名称包含非法字符或密码过于简单',
                        callback:function(value, validator,$field){
                            return (!(isTrueName(value)))||(!(value.indexOf(">")>-1||value.indexOf("<")>-1));
                        }
                    }
                }
            },
           /* mobile: {
                validators: {
                    notEmpty: {
                        message: '联系电话不能为空'
                    },
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: '联系电话必须为11位之间'
                    },
                    regexp: {
                        regexp: /^1[0-9]{10}$/,
                        message: '手机号码非法的运营商号段，请重新输入！'
                    }
                }
            },*/
           /* cardid: {
                validators: {
                    notEmpty: {
                        message: '身份证号不能为空'
                    },
                    stringLength: {
                        min: 15,
                        max: 18,
                        message: '身份证号必须为15-18位之间'
                    },
                    regexp: {
                        regexp: /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,
                        message: '身份证号输入格式不对，请重新输入！'
                    }
                }
            },*/
            /*email: {
                validators: {
                    notEmpty: {
                        message: '邮箱不能为空'
                    },
                    regexp: {
                        regexp: /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                        message: '邮箱输入格式不对，请重新输入！'
                    }
                }
            },*/
            empid: {
                validators: {
                    notEmpty: {
                        message: '员工编码不能为空'
                    }
                }
            },
            roleid: {
                validators: {
                    notEmpty: {
                        message: '角色不能为空'
                    }
                }
            },
            /*dname: {
                validators: {
                    notEmpty: {
                        message: '所属机构不能为空'
                    }
                }
            },*/
            status: {
                validators: {
                    notEmpty: {
                        message: '用户状态不能为空'
                    }
                }
            },
            sign: {
                validators: {
                    notEmpty: {
                        message: '签名不能为空'
                    }
                }
            },
            code: {
                validators: {
                    notEmpty: {
                        message: '特服号不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 5,
                        message: '特服号必须在1到5位之间'
                    },
                    remote: {
                        url: basePath + "/user/checkCode",
                        message: '特服号已存在',
                        delay :  2000,
                        type: 'POST'
                    },
                    numeric: {
                        message: '必须为数字'
                    }
                }
            },
            sublength: {
                validators: {
                    notEmpty: {
                        message: '可扩展长度不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 5,
                        message: '可扩展长度为0-5的正整数'
                    },
                    numeric: {
                        message: '必须为数字'
                    }
                }
            },
            userip: {
                validators: {
                    stringLength: {
                        min: 0,
                        max: 20,
                        message: '用户IP必须在1到20位之间'
                    }
                }
            },
            reportflag: {
                validators: {
                    notEmpty: {
                        message: '报告权限不能为空'
                    }
                }
            },
            reporturl: {
                validators: {
                }
            },
            mourl: {//	上行地址
                validators: {
                }
            },
            protype: {
                validators: {
                    notEmpty: {
                        message: '用户类型不能为空'
                    }
                }
            },
            priority: {
                validators: {
                    notEmpty: {
                        message: '优先级不能为空'
                    }
                }
            },
            feedeptid: {
                validators: {
                    notEmpty: {
                        message: '计费部门描述不能为空'
                    }
                }
            },
            maxsend: {
                validators: {
                callback: {
                    message: 'CMPP用户 最大发送速度必填！',
                    callback:function(value, validator,$field){
                       if($(validator.$form.context).find("[name='protype']").val()==3&&value==''){
                            return false;
                       }
                       return true;
                    }
                }
                }
            },
            remark: {
                validators: {
                    stringLength: {
                        min: 0,
                        max: 249,
                        message: '最大长度为249!'
                    }
                }
            }
        }
    }).on("success.form.bv",function(e){
        saveuser1();
        return false;
    });
}

var codeajax = true;
function editvalr() {
    $('#userindfoeditform2').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            useren: {
                validators: {
                    notEmpty: {
                        message: '用户帐号不能为空'
                    },
                    stringLength: {
                        min: 3,
                        max: 20,
                        message: '用户帐号必须在3到20位之间'
                    },
                    callback: {
                        message: '用户名称包含非法字符或密码过于简单',
                        callback:function(value, validator,$field){
                            return (!(isTrueName(value)))||(!(value.indexOf(">")>-1||value.indexOf("<")>-1));
                        }
                    }
                }
            },
            username: {
                validators: {
                    notEmpty: {
                        message: '用户姓名不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 20,
                        message: '用户姓名必须在1到20位之间'
                    },
                    callback: {
                        message: '用户名称包含非法字符',
                        callback:function(value, validator,$field){
                            return !(value.indexOf(">")>-1||value.indexOf("<")>-1);
                        }
                    }
                }
            },
            /*password: {
                validators: {
                    notEmpty: {
                        message: '登录密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 20,
                        message: '登录密码必须在6到20位之间'
                    },
                    callback: {
                        message: '登录密码包含非法字符',
                        callback:function(value, validator,$field){
                            return !(value.indexOf(">")>-1||value.indexOf("<")>-1);
                        }
                    }
                }
            },*/
            /*mobile: {
                validators: {
                    notEmpty: {
                        message: '联系电话不能为空'
                    },
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: '联系电话必须为11位之间'
                    },
                    regexp: {
                        regexp: /^1[0-9]{10}$/,
                        message: '手机号码非法的运营商号段，请重新输入！'
                    }
                }
            },*/
            /*cardid: {
                validators: {
                    notEmpty: {
                        message: '身份证号不能为空'
                    },
                    stringLength: {
                        min: 15,
                        max: 18,
                        message: '联系电话必须为15-18位之间'
                    },
                    regexp: {
                        regexp: /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,
                        message: '身份证号输入格式不对，请重新输入！'
                    }
                }
            },*/
           /* email: {
                validators: {
                    notEmpty: {
                        message: '邮箱不能为空'
                    },
                    regexp: {
                        regexp: /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                        message: '邮箱输入格式不对，请重新输入！'
                    }
                }
            },*/
            empid: {
                validators: {
                    notEmpty: {
                        message: '员工编码不能为空'
                    }
                }
            },
            roleid: {
                validators: {
                    notEmpty: {
                        message: '角色不能为空'
                    }
                }
            },
            /*dname: {
                validators: {
                    notEmpty: {
                        message: '所属机构不能为空'
                    }
                }
            },*/
            status: {
                validators: {
                    notEmpty: {
                        message: '用户状态不能为空'
                    }
                }
            },
            sign: {
                validators: {
                    notEmpty: {
                        message: '签名不能为空'
                    }
                }
            },
           /* code: {
                validators: {
                    notEmpty: {
                        message: '特服号不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 5,
                        message: '特服号必须在1到5位之间'
                    },
                    numeric: {
                        message: '必须为数字'
                    },
                    callback: {
                        message: '特服号已存在',
                        callback:function(value, validator,$field){
                            console.info(value)
                            if(value==$("#oldcode").val()){
                                return true;
                            }
                            var resboo = false;
                            if(codeajax){
                                codeajax = false;
                                $.ajax({
                                    url: basePath + "/user/checkCode",
                                    type: 'post',
                                    async: false,
                                    data: {
                                        'code': value
                                    },
                                    success: function (result) {
                                        codeajax = true;
                                        resboo =  JSON.parse(result).valid;
                                    }
                                });
                            }

                            return resboo;
                        }
                    }
                }
            },*/
            sublength: {
                validators: {
                    notEmpty: {
                        message: '可扩展长度不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 5,
                        message: '可扩展长度为0-5的正整数'
                    },
                    numeric: {
                        message: '必须为数字'
                    }
                }
            },
            userip: {
                validators: {
                    stringLength: {
                        min: 0,
                        max: 20,
                        message: '用户IP必须在1到20位之间'
                    }
                }
            },
            reportflag: {
                validators: {
                    notEmpty: {
                        message: '报告权限不能为空'
                    }
                }
            },
            reporturl: {
                validators: {
                }
            },
            mourl: {//	上行地址
                validators: {
                }
            },
            protype: {
                validators: {
                    notEmpty: {
                        message: '用户类型不能为空'
                    }
                }
            },
            priority: {
                validators: {
                    notEmpty: {
                        message: '优先级不能为空'
                    }
                }
            },
            feedeptid: {
                validators: {
                    notEmpty: {
                        message: '计费部门描述不能为空'
                    }
                }
            },
            maxsend: {
                validators: {
                    callback: {
                        message: 'CMPP用户 最大发送速度必填！',
                        callback:function(value, validator,$field){
                            if($(validator.$form.context).find("[name='protype']").val()==3&&value==''){
                                return false;
                            }
                            return true;
                        }
                    }
                }
            },
            remark: {
                validators: {
                    stringLength: {
                        min: 0,
                        max: 249,
                        message: '最大长度为249!'
                    }
                }
            }
        }
    }).on("success.form.bv",function(e){
        editsavekuser();
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