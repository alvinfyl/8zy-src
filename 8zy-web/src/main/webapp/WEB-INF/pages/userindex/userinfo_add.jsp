<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 添加 模态框（Modal） -->
<div class="modal fade" id="userindfoadd" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:800px;position:relative;">
        <div class="modal-content" style="width:800px;position:absolute;" id="modalContent">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    新增
                </h4>
            </div>
            <div class="modal-body" id="modal-body">
                <form id="userindfoaddform2"  autocomplete="off">
                    <table class="table table-striped" style="font-size:14px;">
                        <tbody>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="euseren" class="col-sm-4 control-label">用户帐号:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control " name="useren" id="euseren"  autocomplete="off">
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="epassword" class="col-sm-4 control-label">用户密码:</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control " name="password" id="epassword"  autocomplete="off">
                                    </div>
                                </div>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="eusername" class="col-sm-4 control-label">用户姓名:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control " name="username" id="eusername">
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="emobile" class="col-sm-4 control-label">联系电话:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control " name="mobile" id="emobile">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">身份证号:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control " name="cardid" id="cardid">
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">联系人邮箱:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control " name="email" id="email">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                        <td>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">联系人名称:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control " name="contact" >
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">计费部门:</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="feedeptid" id="feedeptid" style="margin-left: 10px;">

                                        </select>
                                    </div>
                                </div>
                            </td>
                            
                        </tr>
                        
                        <tr>
<td>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">员工编号:</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control " name="empid" id="empid">
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="edname" class="col-sm-4 control-label">所属部门:</label>
                                    <div class="col-sm-8">
                                        <input type="hidden" name="deptid" id="dept"/>
                                        <input type="text" class="form-control " name="dname" placeholder="点击选择"
                                               onclick="choosedeptmentid('#dept',this,null)" id="dname" readonly>
                                               <div class="help-blocks" style="color: #a94442;display:none;">所属机构不能为空</div>
                                    </div>
                                </div>
                            </td>
                            
                        </tr>
                        <tr>
								<td>
                                <div class="form-group">
                                    <label for="roleid" class="col-sm-4 control-label">用户角色:</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="roleid" id="roleid" style="margin-left: 10px;">

                                        </select>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="sign" class="col-sm-4 control-label">用户签名:</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="sign" id="sign" style="margin-left: 10px;">

                                        </select>
                                    </div>
                                </div>
                            </td>
                            
                        </tr>
                        <tr>
                        <td>
                                <div class="form-group">
                                    <label for="signtype" class="col-sm-4 control-label">签名位置:</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="signtype" id="signtype" style="margin-left: 10px;">
                                            <option value="12" selected="selected">12-客户后置【】</option>
                                            <option value="11">11-客户前置【】</option>
                                            <option value="14">14-前置[]</option>
                                            <option value="15">15-后置[]</option>
                                        </select>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="protype" class="col-sm-4 control-label">用户类型:</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="protype" id="protype" style="margin-left: 10px;">
                                            <option value="2" selected="selected">接口用户</option>
                                            <option value="1">管理用户</option>
                                          <%--  <option value="3">CMPP用户</option>--%>
                                        </select>
                                    </div>
                                </div>
                            </td>
                            
                        </tr>
                        <%--<tr>
                            <td> <div class="form-group" style="position: relative;">
                                <span class="blackTap" style="font-size:12px;position:absolute;left:135px;top:-15px;color:red;display:none;">
                                    开启后该用户将过系统敏感词和业务敏感词
                                </span>
                                <label for="eprotype" class="col-sm-4 control-label" id="blackTwo">业务敏感词:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control " name="" id="" value="点击选择" onclick="chooseBusiness('#departid',this,null)" readonly="readonly"/>
                                </div>
                            </div></td>
                            <td> <div class="form-group" style="position: relative;">
                                <span class="blackTap2" style="font-size:12px;position:absolute;left:135px;top:-15px;color:red;display:none;">
                                    开启后该用户将过系统敏感词和业务敏感词
                                </span>
                                <label for="epriority" class="col-sm-4 control-label" id="blackName">业务黑名单:</label>
                                <div class="col-sm-8">
                                    <input class="form-control " type="text" name="" id="" value="点击选择" onclick="chooseBusiness('#departid',this,null)" readonly/>
                                </div>
                            </div></td>
                        </tr>
                        <tr>
                            <td> <div class="form-group">
                                <label for="eprotype" class="col-sm-4 control-label" >短信模板:</label>
                                <div class="col-sm-8">
                                    <input class="form-control " type="text" name="" id="" value="点击选择" onclick="chooseTemplate('#departid',this,null)" readonly="readonly"/>
                                </div>
                            </div></td>
                            <td> <div class="form-group">
                                <label for="epriority" class="col-sm-4 control-label">免审数量:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control " name="sign" id="esign" placeholder="1000">
                                </div>
                            </div></td>
                        </tr>--%>

                        <tr>
                        
                        <td>
                                <div class="form-group">
                                    <label for="cpid" class="col-sm-4 control-label">通道组:</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="cpid" id="cpid" style="margin-left: 10px;">

                                        </select>
                                    </div>
                                </div>
                            </td>
                            
                            <td>
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">报告权限:</label>
                                    <div class="col-sm-8">
                                        <select class="form-control moreCheck" name="reportflag" id="reportflag" style="margin-left: 10px;">
                                            <option value="0" selected="selected">无</option>
                                            <option value="1">推送上行</option>
                                            <option value="2">推送报告</option>
                                            <option value="3">推送报告和上行</option>
                                            <option value="4">获取报告和上行</option>
                                        </select>
                                    </div>
                                </div>
                            </td>
                            
                        </tr>
                        
                        <tr>
                        <td>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">是否有拓展:</label>
                                    <div class="col-sm-8">
                                        <select class="form-control moreCheck" name="saleman" style="margin-left: 10px;">
                                            <option value="0" selected="selected">无</option>
                                            <option value="1">有</option>
                                        </select>
                                    </div>
                                </div>
                            </td>
                          </tr>
                            
                        <tr>
                            <td colspan="2">
                                <div class="form-group">
                                    <label for="eremark" class="col-sm-2 control-label">报告地址:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control " style="margin-left:5px;" name="reporturl"
                                                placeholder="例如:http://baidu.com">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="form-group">
                                    <label for="eremark" class="col-sm-2 control-label">上行地址:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control " name="mourl" style="margin-left:5px;"
                                               placeholder="例如:http://baidu.com">
                                    </div>
                                </div>
                            </td>
                        </tr>
                       <%-- <tr>
                            <td colspan="2">
                                <div class="form-group">
                                    <label for="eremark" class="col-sm-2 control-label">IP白名单:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control " style="margin-left:5px;" name="userip"
                                               id="userip"  placeholder="111.111.111.111">
                                    </div>
                                </div>
                            </td>
                        </tr>--%>

                        <tr>
                            <td colspan="2">
                                <div class="form-group">
                                    <label for="eremark" class="col-sm-2 control-label">备注:</label>
                                    <div class="col-sm-10">
                                        <textarea type="text" class="form-control " style="margin-left:5px;"
                                                  name="remark" id="eremark"></textarea>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="$('#userindfoaddform2').submit()">
                    保存
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<jsp:include page="../deptment/chooseBusiness.jsp"></jsp:include>
<jsp:include page="../deptment/chooseTemplate.jsp"></jsp:include>
