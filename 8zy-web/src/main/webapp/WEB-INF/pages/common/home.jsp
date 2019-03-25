<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv=”X-UA-Compatible” content=”IE=edge,chrome=1″ />
<title>消息中心</title>
<!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/ext/portal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/default.css">	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.portal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath }/js/echarts/build/dist/echarts.js"></script>
	
<script type="text/javascript">
	$(function() {
		panels = [ {
			id : 'p1',
			title : '账号信息',
			height : 480,
			collapsible : true,
			href:'../portal/zhanghao'
		},{
			id : 'p3',
			title : '昨日发送',
			height : 160,
			collapsible : true,
			href:'../portal/gonggao'
		}, {
			id : 'p4',
			title : '七天发送情况',
			height :310,
			collapsible : true,
			href:'../portal/bug'
		}];
		 $('#layout_portal_portal').portal({
			border : false,
			fit : true
		 });
		var state = state = 'p1,p2:p3,p4';/*冒号代表列，逗号代表行*/

		addPortalPanels(state);
		$('#layout_portal_portal').portal('resize');
	
	});
	
	function getPanelOptions(id) {
		for ( var i = 0; i < panels.length; i++) {
			if (panels[i].id == id) {
				return panels[i];
			}
		}
		return undefined;
	}
	function getPortalState() {
		var aa=[];
		for(var columnIndex=0;columnIndex<2;columnIndex++) {
			var cc=[];
			var panels=$('#layout_portal_portal').portal('getPanels',columnIndex);
			for(var i=0;i<panels.length;i++) {
				cc.push(panels[i].attr('id'));
			}
			aa.push(cc.join(','));
		}
		return aa.join(':');
	}
	function addPortalPanels(portalState) {
		var columns = portalState.split(':');
		for (var columnIndex = 0; columnIndex < columns.length; columnIndex++) {
			var cc = columns[columnIndex].split(',');
			for (var j = 0; j < cc.length; j++) {
				var options = getPanelOptions(cc[j]);
				if (options) {
					var p = $('<div/>').attr('id', options.id).appendTo('body');
					p.panel(options);
					$('#layout_portal_portal').portal('add', {
						panel : p,
						columnIndex : columnIndex
					});
				}
			}
		}
	}

//alert('${pageContext.request.contextPath }');
$(function(){
	$.ajax({
		url :'${pageContext.request.contextPath }' + '/manual/queryMeLastDay',
		type : "post",
		dataType : "json",
		success : function(data) 
		{
			if (data !=null&&data!=undefined&&data.length>0) 
			{
				$("#submitno").html(data[0].submitstatistics);
				$("#sendno").html(data[0].send);
				$("#returnno").html(data[0].returnstatistics);
				$("#succno").html(data[0].successnumber);
				$("#errno").html(data[0].errornumber);
			}
		}
	});
	$.ajax({
		url :'${pageContext.request.contextPath }' + '/manual/queryMeLastWeek',
		type : "post",
		dataType : "json",
		success : function(data) 
		{
			if (data !=null&&data!=undefined&&data.length>0) 
			{
				//alert(data.length);
				var tmpx=[];
				var tmpy=[];
				for(var i=0;i<data.length;i++)
				{
					tmpx[i]=data[i].deptname;
					tmpy[i]=data[i].send;
				}
				
				//使用
				require(
				 [
				     'echarts',
				     'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
				     'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
				 ],
				  function (ec) {
					//alert(tmpx);
				        // 基于准备好的dom，初始化echarts图表
				        var myChart = ec.init(document.getElementById('main')); 
				        
				        option = {
				        	    tooltip : {
				        	        trigger: 'axis'
				        	    },
				        	    legend: {
				        	        data:['发送数量']
				        	    },
				        	    toolbox: {
				        	        show : true,
				        	        feature : {
				        	            magicType : {show: true, type: ['line', 'bar']}
				        	        }
				        	    },
				        	    calculable : true,
				        	    xAxis : [
				        	        {
				        	            type : 'category',
				        	            boundaryGap : false,
				        	            data : tmpx
				        	        }
				        	    ],
				        	    yAxis : [
				        	        {
				        	            type : 'value',
				        	            axisLabel : {
				        	                formatter: '{value} '
				        	            }
				        	        }
				        	    ],
				        	    series : [
				        	        {
				        	            name:'发送数量',
				        	            type:'line',
				        	            data:tmpy,
				        	            
				        	            markLine : {
				        	                data : [
				        	                    {type : 'average', name: '平均值'}
				        	                ]
				        	            }
				        	        }
				        	    ]
				        	};
				        	                    

				        // 为echarts对象加载数据 
				        myChart.setOption(option); 
				    }
				);
			}
		}
	});
	
});

// 路径配置
require.config({
    paths: {
        echarts: '${pageContext.request.contextPath }/js/echarts/build/dist'
    }
});



</script>
</head>
<body>
	<div id="layout_portal_portal" style="position:relative;height:100%;">
		<div></div>
		<div></div>
	</div>
</body>
</html>