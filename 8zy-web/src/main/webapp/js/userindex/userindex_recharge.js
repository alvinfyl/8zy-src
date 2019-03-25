$(function() {
    $("#btn_recharge").click(function () {
    	alert('充值页面');
        getSelect("#roleid",basePath+"/role/search",null,'rolename','id');
        
    });
});
