var basePath = getRootPath();

//获取项目根路径
function getRootPath() {
	// 获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
	var curWwwPath = window.document.location.href;
	// 获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	// 获取主机地址，如： http://localhost:8083
	var localhostPaht = curWwwPath.substring(0, pos);
	// 获取带"/"的项目名，如：/uimcardprj
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	//return (localhostPaht + projectName);

    if("/pages"==projectName){
        return localhostPaht;
    }
    return (localhostPaht + projectName);

}

function getSelect(obj,url,params,name,val) {
    $.ajax({
        url : url,
        type: 'post',
        async: false,
        date : params,
        success : function(result) {
            $(obj).html("");
            var maps = JSON.parse(result);
            $.each(maps,function (i,map) {
                $(obj).append("<option value="+map[val]+">" + map[name] + "</option>");
            })
        }
    });
}
function getSelectHtml(url,params,name,val,name1) {
    var str = "<select class=\"form-control  input-sm\" name=\""+name1+"\">";
    $.ajax({
        url : url,
        async : false,
        type : "POST",
        date : params,
        success : function(result) {
            $.each(JSON.parse(result),function (i,map) {
                str+=("<option value="+map[val]+">" + map[name] + "</option>");
            })
        }
    });
    str+="</select>";
    return str;
}
function getSelectSource(url,params,name,val) {
    var list=new Array()
    $.post(url,params,function(result){
        var maps = JSON.parse(result);
        $.each(maps,function (i,map) {
            var ob = new Object();
            ob.value = map[val];
            ob.text = map[name];
            list[i]= ob;
        })
    });
    return list;
}

function getSelectdefault(obj, url, params,defaultname,defaultval, name1, val,name2) {
    $.ajax({
        url: url,
        contentType: 'application/json',
        type: "POST",
        async: false,
        success: function (result) {
            $(obj).html("");
            if(defaultname!=""){
                $(obj).append("<option  value=" + defaultval + ">" + defaultname+ "</option>");
            }
            var maps = JSON.parse(result);
            $.each(maps, function (i, map) {
                $(obj).append("<option value=" + map[val] + ">" + map[name1] + map[name2]+ "</option>");
            })
        }
    });
}
function getSelectcommon(obj, url, params, name1, val,name2) {
    getSelectdefault(obj, url, params,"","", name1, val);
}