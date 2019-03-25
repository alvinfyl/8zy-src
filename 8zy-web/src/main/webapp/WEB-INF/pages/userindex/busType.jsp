<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 添加 模态框（Modal） -->
<div class="modal fade" id="busType" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width:800px;position:relative;">
        <div class="modal-content" style="width:800px;position:absolute;" id="modalContent">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">业务类型配置</h4>
            </div>
            <div class="modal-body" id="modal-body">
                <div style="height:80%;overflow-x:hidden;overflow-y:auto;">
                    <table id="grid" class="table table-hover table-striped">
                        <thead>
                        <tr>
                            <th style="text-align: center;width:100px; " data-field="groupname">
                                <div class="th-inner ">业务类型</div>
                                <div class="fht-cell"></div>
                            </th>
                            <th style="text-align: left; min-width:400px;" data-field="contactname">
                                <div class="th-inner ">描述</div>
                                <div class="fht-cell"></div>
                            </th>
                        </tr>
                        </thead>
                        <tbody id="busBody">

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="savebustype()">
                    保存
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<style>
    tr {
        border-top: 1px solid #ddd;
    }

    th {
        text-align: center;
        border: 1px solid #dddddd;
    }

    td {
        white-space: initial;
        text-overflow: initial;
        border: 1px solid #dddddd;
    }
</style>
<script>
    var tuseriddd;

    //业务类型
    function busType(userid) {
        tuseriddd = userid;
        $("#busType").modal('show');
        loadadd();
        $("#busBody").find("input[name='son_btSelectItem']").prop('checked', false);;
        $.ajax({
            url: basePath + "/user/loadusercodebus",
            contentType: 'application/json;charset=UTF-8',
            type: "POST",
            data: JSON.stringify({
                "userid": tuseriddd
            }),
            success: function (data) {
                if (data != "") {
                    var maps = JSON.parse(data);
                   // console.info(maps);
                    $.each(maps, function (i, map) {
                      //  console.info(map);
                        $("#" + map.codebusid).prop('checked', true);
                    })

                    var child_size = $("#busBody").find("input[name='son_btSelectItem']").length;
                    var child_check_size = $("#busBody").find("input[name='son_btSelectItem']:checked").length;
                    if (child_size == child_check_size) {
                        // 父亲选中
                        $("#busBody").find("[name='par_btSelectItem']").prop('checked', true);
                    } else {
                        // 父亲不选
                        $("#busBody").find("[name='par_btSelectItem']").prop('checked', false);
                    }

                }
            }
        });

    }

    var resultre = [];

    function loadadd() {
       // console.info(resultre.length);
        if (resultre.length == 0) {
            $.ajax({
                url: basePath + "/code/queryAllBus",
                async: false,
                type: "POST",
                date: null,
                success: function (result1) {
                    var maps = JSON.parse(result1);
                    $.each(maps, function (i, map) {
                        var objv = new Object();
                        objv.marks = map["codename"];
                        objv.busid = map["id"];
                        resultre.push(objv);
                    })
                }
            });
            getBusTable(resultre);
        }
    }


    function getBusTable(tbusMark) {
        var data = [
            {
                busname: '全选',
                busMark: tbusMark,
            }
        ];
        for (var n = 0; n < data.length; n++) {
            var idx = "inputAll" + n;
            var str = '<tr>';

            str += '<td style="text-align: left; "><input  name="par_btSelectItem"  type="checkbox" onclick="busnameClick(this)"  class="inputAll">' + data[n].busname + '</td>';
            var busMark = data[n].busMark;
            str += '<td style="text-align: left;" class="inputBox"><div style="max-height:500px;overflow-y:scroll;overflow-x:hidden;">';
            for (var j = 0; j < busMark.length; j++) {
                var idx = "cname" + n + j;
                str += '<span style="margin:0 20px 10px 0;"><input  name="son_btSelectItem" onclick="markClick(this)" id="' + busMark[j].busid + '"  value="' + busMark[j].busid + '"  type="checkbox"><lable for="' + idx + '">' + busMark[j].marks + '</lable></span>';
            }
            str += '</td></div>';
            str += '</tr>';
            $('#busBody').append(str);
        }


    }


    //	点击组名CheckBox
    function busnameClick(input) {
        var child = $(input).parent().siblings().find("[name='son_btSelectItem']");
        if ($(input).is(":checked")) {
            // 子项不选
            for (var i = 0; i < $(child).length; i++) {
                $(child)[i].checked = true;
            }
        } else {
            // 子项全选
            for (var i = 0; i < $(child).length; i++) {
                $(child)[i].checked = false;
            }
        }
    }

    //	点击联系人CheckBox
    function markClick(input) {
        var parent = $(input).parent().parent().parent().siblings().find("[name='par_btSelectItem']");
        if ($(input).is(":checked")) {
            // 判断所有子项是否已经全选
            var child_size = $(input).parent().parent().parent().find("[name='son_btSelectItem']").length;
            var child_check_size = $(input).parent().parent().parent().find("[name='son_btSelectItem']:checked").length;
            if (child_size == child_check_size) {
                // 父亲选中
                $(parent)[0].checked = true;
            } else {
                // 父亲不选
                $(parent)[0].checked = false;
            }
        } else {
            // 父亲不选
            $(parent)[0].checked = false;
        }
    }


    function savebustype() {
        // alert(tuseriddd);
        var ids = [];
        var chckboxss = $("#busBody").find("input[name='son_btSelectItem']:checkbox:checked");
       // console.info(chckboxss);
        $.each(chckboxss, function (i, objd) {
            ids.push($(objd).val());
        });
      //  console.info(ids);
        if (ids.length == 0) {
            toastr.warning('请选择业务类型!');
            return;
        }
        ids.join(",");
        var par = new Object();
        par.tids = ids;
        par.userid = tuseriddd;

        $.ajax({
            url: basePath + "/user/usercodebus",
            contentType: 'application/json;charset=UTF-8',
            type: "POST",
            data: JSON.stringify({
                "ids": ids,
                "userid": tuseriddd
            }),
            success: function (data) {
                if (data == "success") {
                    toastr.success("保存成功");
                    $("#busType").modal('hide');
                    return;
                }
                toastr.success("保存失败");
            }
        });


    }


</script>