// 站内搜索
$(document).ready(function(){
                    $('#zn_search_btn').click(function(){
                        $('#zn_search_box').val($('#search-box').val());
                        $('#zn_search_form').submit();
                    });
                  });

//  cookie 代码
//取得cookie  
function getCookie(name) {  
 var nameEQ = name + "=";  
 var ca = document.cookie.split(';');    //把cookie分割成组  
 for(var i=0;i < ca.length;i++) {  
 var c = ca[i];                      //取得字符串  
 while (c.charAt(0)==' ') {          //判断一下字符串有没有前导空格  
 c = c.substring(1,c.length);      //有的话，从第二位开始取  
 }  
 if (c.indexOf(nameEQ) == 0) {       //如果含有我们要的name  
 return unescape(c.substring(nameEQ.length,c.length));    //解码并截取我们要值  
 }  
 }  
 return false;  
}    
//清除cookie  
function clearCookie(name) {  
 setCookie(name, "", -1);  
}    
//设置cookie  
function setCookie(name, value, seconds) {  
 seconds = seconds || 0;   //seconds有值就直接赋值，没有为0，这个根php不一样。  
 var expires = "";  
 if (seconds != 0 ) {      //设置cookie生存时间  
 var date = new Date();  
 date.setTime(date.getTime()+(seconds*1000));  
 expires = "; expires="+date.toGMTString();  
 }  
 document.cookie = name+"="+escape(value)+expires+"; path=/";   //转码并赋值  
}  
//  cookie 代码结束

//  迅雷下载链接 checkbox js
function unselectall(){
if(document.myform.chkAll.checked){
document.myform.chkAll.checked = document.myform.chkAll.checked&0;
}
}
function CheckAll(form){
for (var i=0;i<form.elements.length;i++){
var e = form.elements[i];
if (e.Name != 'chkAll'&&e.disabled==false)
e.checked = form.chkAll.checked;
}
}
//  end

//  start 迅雷下载全选
var checkflag = "true";
function check(field) {
if (checkflag == "false") {
for (i = 0; i < field.length; i++) {
field[i].checked = true;}
checkflag = "true";
return "全选"; }
else {
for (i = 0; i < field.length; i++) {
field[i].checked = false; }
checkflag = "false";
return "全选"; }
}
//  end
function set_tablist(i,p){
	var n = p.parent().parent().attr('id')
	$('#'+n+' .me2').removeClass('dspn dspb')
	$('#'+n+' .me2').addClass('dspn')
	$('#'+n+' ul.me2:eq('+i+')').addClass('dspb')

	if(i>0){
		//alert("/_resource/ajaxdata/sidebar_content"+i+".txt")
		backinfo = $.ajax({
			  //url: "/ajax/ajax_request/index_sidebar_content_request/"+i,
			  url: "/_resource/ajaxdata/sidebar_content"+i+".txt",
			  cache:true,
			  global: false,
			  type: "GET",
			  dataType: "html",
			  async:false
		   }
		).responseText;	
		$('#'+n+' ul.me2:eq('+i+')').html(backinfo)
	}
	
	$('#'+n+' .navtab').removeClass('holdnav')
	$('#'+n+' .navtab:eq('+i+')').addClass('holdnav')
}
//
function setscroll()
{
	n	= $('.olplist1').length;
	obj	= $('.olplist1');
	for(i=0;i<n;i++){
		if(obj.height()>240){
			obj.addClass('olpscroll');
		}
		obj	= obj.next();
	}
}

function show_all_juji(i)
{
	$("#jilist"+i).removeClass('ji_close');
	$("#jilist_zy"+i).removeClass('ji_close_zy');	
	$("#sa_button"+i).css('display','none');
}

function close_all_juji(i)
{
	$("#jilist"+i).addClass('ji_close');
	$("#jilist_zy"+i).addClass('ji_close_zy');		
	$("#sa_button"+i).css('display','');
}

function ttf(no){
	var num = $('#menulist li').length;
	for(i = 1;i<=num;i++){
		document.getElementById('tt'+i).className = 'tth';
	}
	$('#menulist li').removeClass('tb1');
	document.getElementById('tt'+no).className = 'tts';
	$('#menulist li').eq((no-1)).addClass('tb1');
}





