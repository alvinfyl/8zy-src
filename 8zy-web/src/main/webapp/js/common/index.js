
	
	var basePath = getRootPath();
	
	getMenus();
	
	// 根据用户权限加载用户左侧树
	function getMenus() {
		$.ajax({
			url : basePath + "/function/queryMenuByUser",
			dataType : 'json',
			type : 'POST',
			// async:false,
			success : function(data) {
				_menus = data;
				
				var str='<ul  class="sidebar-menu">';
				/*str+='<li style="color:#fff;cursor:pointer;" onclick="onselecttab()" class="treeview"><a ><i class="glyphicon glyphicon-th-large"></i><span>首页</span></a>';*/
				for (var n = 0; n < data.length; n++) {
					str+='<li style="color:#fff;cursor:pointer;" class="treeview"><a ><i class="'+data[n].icon+'"></i><span>'+data[n].text+'</span></a>';
					str +='<ul class="treeview-menu">';
					var childNodes = data[n].nodes;
					if(childNodes){
						for(var j = 0; j < childNodes.length; j++) {
							var idx = n + '' + j; 
							str += '<li class="childLi" style="cursor:pointer;" onclick=\'onselecttab(' + idx + ',\"'+childNodes[j].text+'\",\"'+childNodes[j].href+'\",\"'+childNodes[j].icon+'\");\'><a><i class="'+childNodes[j].icon+'"></i><span>' + childNodes[j].text  + '</span></a></li>';
						}
					}
					
					str += '</ul></li>';
					
				}
				str +='</ul>';
				
				$('#nav').append(str);
			}
		});

	}
	
	function onselecttab(nodeid, tabtile, url,tabicon) {
		if(url != "#") {
			addTab({
				tabMainName: "myTab",
				tabName: nodeid,
				tabTitle: tabtile,
				tabUrl: basePath + url,
				tabContentMainName: "myTabContent",
				tabIcon:tabicon
			});
		}
	}
	
	/**
	 * 增加标签页
	 */
	function addTab(options) {
	    //option:
	    //tabMainName:tab标签页所在的容器
	    //tabName:当前tab的名称
	    //tabTitle:当前tab的标题
	    //tabUrl:当前tab所指向的URL地址
	    //tabIcon:当前tab所指向的icon
	    var exists = checkTabIsExists(options.tabMainName, options.tabName);
	    if(exists){
	        $("#tab_a_"+options.tabName).click();
	    } else {
	        $("#"+options.tabMainName).append('<li id="tab_li_'+options.tabName+'"><a href="#tab_content_'+options.tabName+'" data-toggle="tab" id="tab_a_'+options.tabName+'" style="overflow:hidden;"><span class="'+options.tabIcon+'" style="padding-right:3px;color:#888;"></span><button class="close closeTab" type="button" onclick="closeTab(this);">×</button>'+options.tabTitle+'</a></li>');
	         
	        //固定TAB中IFRAME高度
	        mainHeight = $(document.body).height() - 5;
	         
	        var content = '';
	        if(options.content){
	            content = option.content;
	        } else {
	            content = '<iframe src="' + options.tabUrl + '" width="100%" height="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes"></iframe>';
	        }
	        $("#"+options.tabContentMainName).append('<div id="tab_content_'+options.tabName+'" style="height: 100%;" role="tabpanel" class="tab-pane" id="'+options.tabName+'">'+content+'</div>');
	        $("#tab_a_"+options.tabName).click();
	    }
	}
	
	 
	 
	/**
	 * 判断是否存在指定的标签页
	 * @param tabMainName
	 * @param tabName
	 * @returns {Boolean}
	 */
	function checkTabIsExists(tabMainName, tabName){
	    var tab = $("#"+tabMainName+" > #tab_li_"+tabName);
	    //console.log(tab.length)
	    return tab.length > 0;
	}
	
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
	//	return (localhostPaht + projectName);

        if("/pages"==projectName){
            return localhostPaht;
		}
        return (localhostPaht + projectName);


	}

	function getSelect(obj,url,params,name,val) {
	    $.ajax({
	        url : url,
	        async : false,
	        type : "POST",
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


/**
 * 关闭标签页
 * @param button
 */
function closeTab (button) {
     
    //通过该button找到对应li标签的id
    var li_id = $(button).parent().parent().attr('id');
    var id = li_id.replace("tab_li_","");
    //如果关闭的是当前激活的TAB，激活他的前一个TAB
    if ($("li.active").attr('id') != li_id) {
        $(button).parent().parent().prev().find("a").click();
    }
     
    //关闭TAB
    $("#" + li_id).remove();
    $("#tab_content_" + id).remove();
    
    var oUl = document.getElementById('myTab');
	if(ulTop >= 0 || ulTop+225>0){
		ulTop = 0;
		oUl.style.left = ulTop + 'px';
	} else {
		ulTop += 100;
		oUl.style.left = ulTop + 'px';
	}
};

/**
 * 右击标签页
 * @param button
 */
$(function () {
	//修改密码
	$("#btnPwd").click(function () {
        $("#changePwdForm").data('bootstrapValidator').resetForm();
        $("#changePwdForm").data('bootstrapValidator').destroy();
        changePwdForm();
        $('#changePwdForm')[0].reset();
        $('#loginout').modal('show');
    });
		    
		    
	var Accordion = function(el, multiple) {
		this.el = el || {};
		this.multiple = multiple || false;

		// Variables privadas
		var links = this.el.find('.link');
		// Evento
		links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
	}

	Accordion.prototype.dropdown = function(e) {
		var $el = e.data.el;
			$this = $(this),
			$next = $this.next();

		$next.slideToggle();
		$this.parent().toggleClass('open');

		if (!e.data.multiple) {
			$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
		};
	}	

	var accordion = new Accordion($('#accordion'), false);
})

// 添加事件
function addEvent (obj,type,fn) { // type = 'click'

	if (obj.addEventListener) {
		// 高版本
		obj.addEventListener(type,fn,false);
	} else {
		//低版本
		obj.attachEvent('on'+type,fn);
	}

}
// 移除事件
function removeEvent (obj,type,fn) {
	if (obj.removeEventListener) {
		obj.removeEventListener(type,fn,false);
	} else {
		obj.detachEvent('on'+type,fn);
	}
}
// ready
function ready(fn) {
	if (document.addEventListener) {
		document.addEventListener('DOMContentLoaded',fn,false);
	} else {
		document.onreadystatechange = function () {
			if (document.readyState == 'complete') {
			// 获取DOM
				fn();
			}
		}
	}
}

// 添加滚轮事件
function addMouseWheel (obj,fn) {
		if (navigator.userAgent.indexOf('Firefox') != -1) {
			// 专门给火狐
			obj.addEventListener('DOMMouseScroll',fn,false);
		} else {
			//除了火狐
			obj.onmousewheel = fn;
		}
}

// 滚轮向上还是向下
function isUp (evt) {
	var up = true; // up向上滚 
	if (evt.wheelDelta) { // 除了火狐
		if (evt.wheelDelta < 0) {
			up = false;
		} else {
			up = true;
		}

	} else { // 火狐
		if (evt.detail < 0) {
			up = true;
		} else {
			up = false;
		}
	}
	return up;
}
// 绝对位置
function getPos (obj) {
	var left = 0,top = 0;

	while (obj) {
		left += obj.offsetLeft;
		top += obj.offsetTop;
		obj = obj.offsetParent;
	}
	return {
		left: left,
		top: top
	}
}

var ulTop = 0;
ready(function () {
		var oDiv= document.getElementById('box');
		var oUl = document.getElementById('myTab');
		var oBar = document.getElementById('bar');
		
		
		// top值
		var dis = 0;
		// 滚动条的最大值
		var maxBarWidth = oDiv.offsetWidth - oBar.offsetWidth; 
		// ul的最大值
		var maxUlWidth = oDiv.offsetWidth - oUl.offsetWidth;
		// 拖拽
		/*oBar.onmousedown = function (evt) {
			//记录位置
			evt = evt || window.event;
			var disX = evt.clientX;
			console.log(disX);
			document.onmousemove = function (evt) {
				evt = evt || window.event;

				dis = evt.clientX - disX - oDiv.offsetLeft;
				if (dis <= 0) {
					dis = 0;
				}
				if (dis >= maxBarWidth) {
					dis = maxBarWidth;
				}
				// 比例
				var scale = dis / maxBarWidth;
				// 算ul的top
				var ulTop = - scale * maxUlWidth;
				oBar.style.left = dis + 'px';
				oUl.style.left =  ulTop + 'px';
				console.log(dis);
				console.log(ulTop);
			}
			document.onmouseup = function () {
				document.onmousemove = null;
			}
			oBar.onmouseup = function () {
				document.onmousemove = null;
			}
			return false;
		}*/

		// 鼠标滚动事件
		addMouseWheel(oDiv,function (evt) {
			evt = evt || window.event;
			if (isUp(evt)) {
				dis += 50;
				if (dis >= 0) {
					dis = 0;
				}
			} else if((oUl.offsetWidth >= oDiv.offsetWidth) && (oUl.offsetLeft == oDiv.offsetWidth-oUl.offsetWidth)) {
				dis -= 50;
				if( oUl.offsetLeft != oDiv.offsetWidth-oUl.offsetWidth){
					var temp = dis; 
					oUl.offsetWidth=oDiv.offsetWidth-50;
					return temp;
				
				}
			}
			// 比例
			var scale = dis / maxBarWidth;
			// 算ul的top
			ulTop = scale * maxUlWidth;
			
			if(oUl.offsetWidth < oDiv.offsetWidth){
				console.log(dis);
				dis = 0;
				
			}
//			oBar.style.left = dis + 'px';
			oUl.style.left = ulTop + 'px';
			return false;
		});
	});
