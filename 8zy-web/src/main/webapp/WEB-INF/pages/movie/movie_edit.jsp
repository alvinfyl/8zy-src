<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 添加 模态框（Modal） -->
<div class="modal fade" id="gateway_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width:800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" id="closeEdit" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title editUser" id="emyModalLabel">
                    修改
                </h4>
            </div>
            <div class="modal-body">
                  <form id="gatewayEditForm">
                    <input type="hidden" name="othergateway" id="othergateway" value="0"/>
					<input type="hidden" name="iscm" id="iscm" value="0"/>
					<input type="hidden" name="iscu" id="iscu" value="0"/>
					<input type="hidden" name="isct" id="isct" value="0"/>
					<input type="hidden" name="id" id="id" value=""/>
                    <table class="table table-striped" style="font-size:14px;">
                        <tbody>
                        	<tr>
	                            <td>
	                                <div class="form-group">
	                                    <label class="col-sm-5 control-label">网关编号:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"  name="gateway" id="gateway" readonly="readonly">
	                                    </div>
	                                </div>
	                            </td>
	                            <td>
	                                <div class="form-group">
	                                    <label class="col-sm-5 control-label">网关名称:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control " name="gatewayname" id="gatewayname">
	                                    </div>
	                                </div>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <div class="form-group">
	                                    <label for="username" class="col-sm-5 control-label">网关账号:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control " name="username" id="username">
	                                    </div>
	                                </div>
	                            </td>
	                            <td>
	                                <div class="form-group">
	                                    <label for="password" class="col-sm-5 control-label">网关密码:</label>
	                                    <div class="col-sm-7">
	                                        <input type="password" class="form-control " name="password" id="password">
	                                    </div>
	                                </div>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <div class="form-group">
	                                    <label for="ip" class="col-sm-5 control-label">网关IP:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control " name="ip" id="ip">
	                                    </div>
	                                </div>
	                            </td>
	                            <td>
	                                <div class="form-group">
	                                    <label for="port" class="col-sm-5 control-label">网关端口:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control" name="port" id="port">
	                                    </div>
	                                </div>
	                            </td>
	                        </tr>
	                         <tr>
	                            <td>
	                                <div class="form-group">
	                                    <label for="longcode" class="col-sm-5 control-label">长号码:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control" name="longcode" id="longcode" maxlength="20" onkeyup="this.value=this.value.replace(/[^\d]/g,'') ">
	                                    </div>
	                                </div>
	                            </td>
	                            <td>
	                                <div class="form-group">
	                                    <label for="sendspeed" class="col-sm-5 control-label">下发速度:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control" name="sendspeed" id="sendspeed" maxlength="4" onkeyup="this.value=this.value.replace(/[^\d]/g,'') ">
	                                    </div>
	                                </div>
	                            </td>
	                        </tr>
	                         <tr>
	                            <td>
	                                <div class="form-group">
	                                    <label for="maxcount" class="col-sm-5 control-label">单批最大条数:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control" maxlength="3" name="maxcount" id="maxcount" onkeyup="this.value=this.value.replace(/[^\d]/g,'') ">
	                                    </div>
	                                </div>
	                            </td>
	                            <td>
	                                <div class="form-group">
	                                    <label for="operType_edit" class="col-sm-5 control-label">运营商类型:</label>
	                                    <div class="col-sm-7">
	                                        <select class="form-control"  id="operType_edit">
	                                            <option value="5">全部</option>
	                                            <option value="1">移动</option>
	                                            <option value="2">联通</option>
	                                            <option value="3">电信</option>
	                                            <option value="4">国际</option>
	                                        </select>
	                                    </div>
	                                </div>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <div class="form-group">
	                                    <label  class="col-sm-5 control-label">目标通道:</label>
	                                    <div class="col-sm-7">
	                                    	<input type="text" class="form-control" name="targetway" id="targetway">
	                                        <!-- <select class="form-control" id="cc2" name="targetway">
	                                        </select> -->
	                                    </div>
	                                </div>
	                            </td>
	                            <td>
	                                <div class="form-group">
	                                    <label class="col-sm-5 control-label">多签名:</label>
	                                    <div class="col-sm-7">
	                                        <select class="form-control" name="hassign">
	                                            <option value="1" selected="selected">是</option>
	                                            <option value="0">否</option>
	                                        </select>
	                                    </div>
	                                </div>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <div class="form-group">
	                                    <label class="col-sm-5 control-label">协议类型:</label>
	                                    <div class="col-sm-7">
	                                    	<input type="text" class="form-control" name="protocolversion" id="protocolversion">
	                                        <!-- <select class="form-control" name="protocolversion" id="protocolversion">
	                                            <option value="12" selected="selected">11</option>
	                                            <option value="11">22</option>
	                                        </select> -->
	                                    </div>
	                                </div>
	                            </td>
	                            <td>
	                                <div class="form-group">
	                                    <label class="col-sm-5 control-label">滑动窗口大小:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control" name="controlsize" id="controlsize">
	                                    </div>
	                                </div>
	                            </td>
	                        </tr>
	                      
	                        <tr>
	                            <td>
	                                <div class="form-group">
	                                    <label  class="col-sm-5 control-label">上行IP:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control "  name="moip" id="moip">
	                                    </div>
	                                </div>
	                            </td>
	                            <td>
	                                <div class="form-group">
	                                    <label class="col-sm-5 control-label">上行端口:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control" name="moport" id="moport">
	                                    </div>
	                                </div>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <div class="form-group">
	                                    <label  class="col-sm-5 control-label">上行账号:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control "  name="mousername" id="mousername">
	                                    </div>
	                                </div>
	                            </td>
	                            <td>
	                                <div class="form-group">
	                                    <label class="col-sm-5 control-label">上行密码:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control" name="mopassword" id="mopassword">
	                                    </div>
	                                </div>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <div class="form-group">
	                                    <label  class="col-sm-5 control-label">联通业务类型:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control "  name="servicetype" id="servicetype">
	                                    </div>
	                                </div>
	                            </td>
	                            <td>
	                                <div class="form-group">
	                                    <label class="col-sm-5 control-label">联通nodeID:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control" name="nodeid" id="nodeid">
	                                    </div>
	                                </div>
	                            </td>
	                        </tr>
	                        
	                        <tr>
	                            <td>
	                                <div class="form-group">
	                                    <label  class="col-sm-5 control-label">企业服务号:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control" name="serviceid" id="serviceid">
	                                    </div>
	                                </div>
	                            </td>
	                            <td>
	                               
	                            </td>
	                        </tr>
	                        <tr style="height: 64px;">
	                            <td colspan="2">
	                                <div class="form-group" style="position: relative;">
	                                    <label for="remark" class="control-label" style="width:23%;position: absolute;top: 0px;left:16px;">备注:</label>
	                                    <div style="width:75%;position: absolute;top: 0px;left: 167px;">
	                                        <textarea type="text" class="form-control "  name="remark" id="remark"></textarea>
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
                <button type="button" class="btn btn-primary" id="gatewawEdit" onclick="$('#gatewayEditForm').submit()">
                    保存
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


