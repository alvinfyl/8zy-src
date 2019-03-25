<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    function mhcxgjmchange() {
        var scar = $("#mhcxgjm").val();
        $("#inccodeadd option").each(function () {
            var val = $(this).val();
            var text = $(this).text();
            //dep += '<option value="' + $(this).val() + '">' + $(this).text() + '</option>';
            if (text.indexOf(scar) != -1) {
                $("#inccodeadd").val(val);
            }
        })
    }

    function toaddlabel(formid,nameid,titlename,url,cname,cval,cname2) {

        $("#myModaladd [customstr='tname']").html(titlename);
        getSelectcommon("#inccodeadd",basePath+url,null,cname,cval,cname2);

        $('#myModaladd').modal('show');

        $("#addtoinput").click(function () {
            var tobj = $("#"+formid+" [name='"+nameid+"']");
            if(tobj.val()==""){
                tobj.val($("#inccodeadd").val());
            }else{
                tobj.val(tobj.val()+","+$("#inccodeadd").val());
            }
        })

    }


</script>
<div class="modal fade" id="myModaladd" tabindex="-1" data-backdrop="static" role="dialog"
     aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" >
                    添加<span customstr="tname">手机号</span>
                </h4>
            </div>
            <div class="modal-body">
                <form id="addStaffForm">
                    <div style="display: flex;justify-content: flex-start;align-items: center;">
                        <span customstr="tname">国家代码：</span>
                        <select class="form-control" name="inccodeadd" id="inccodeadd"
                                style="padding:5px;resize: none;width:200px;overflow: auto;margin-right:10px;">

                        </select>
                        <input class="form-control" style="width: 100px;" type="text" id="mhcxgjm"
                               oninput="mhcxgjmchange()" placeholder="模糊查询">
                        <button id="addtoinput" class="btn btn-primary" type="button">添加</button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<style type="text/css">
    .normal_top {
        box-shadow: none;
    }
</style>