<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
   <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">-->
  <!-- Ionicons
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">-->
  <!-- jvectormap -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/skins/_all-skins.min.css">
  <style type="text/css">
  	/* 设置滚动条的样式 */
  	::-webkit-scrollbar {    width: 3px;}
  	/* 滚动槽 */
  	::-webkit-scrollbar-track {    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);    border-radius: 10px;}
  	/* 滚动条滑块 */
  	::-webkit-scrollbar-thumb {    border-radius: 10px;    background: rgba(0,255,0,0.1);    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5);}
  	::-webkit-scrollbar-thumb:window-inactive {    background: rgba(255,0,0,0.4);}
  	
  	
  	/* 设置滚动条的样式 */
  	
  	/* 滚动槽 */
  	::-ms-track {    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);    border-radius: 10px;}
  	/* 滚动条滑块 */
  	::-ms-thumb {    border-radius: 10px;    background: rgba(0,255,0,0.1);    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5);}
  	::-ms-thumb:window-inactive {    background: rgba(255,0,0,0.4);}
  </style>


  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">


    <!-- Main content -->
    <section class="content">
    	<div class="row">
        <div class="col-md-12">
          <div class="box">
            
            <div style="display: flex;justify-content: space-around;">
			    		<div style="height:400px;width:40%;margin-top:20px;padding:20px 0;float:left;" id="main2"></div>
			    		<div style="height:400px;width:50%;margin-top:20px;padding:20px 0;float:right;" id="main3"></div>
			    	</div>
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
    	
    	<div class="row">
        <div class="col-md-12">
          <div class="box">
          
            <div style="height:500px;width:100%;margin-top:20px;padding:20px 0;" id="main1"></div>
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
    	
    </section>
    <!-- /.content -->

<!-- jQuery 2.2.3 -->
<script src="${pageContext.request.contextPath }/plugins/jQuery/jquery-1.9.1.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath }/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath }/dist/js/app.min.js"></script>
<!-- Sparkline -->
<script src="${pageContext.request.contextPath }/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="${pageContext.request.contextPath }/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${pageContext.request.contextPath }/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="${pageContext.request.contextPath }/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="${pageContext.request.contextPath }/plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${pageContext.request.contextPath }/dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath }/dist/js/demo.js"></script>
<script src="${pageContext.request.contextPath }/plugins/echarts/echarts.js"></script>

<script src="${pageContext.request.contextPath }/js/basepath.js"></script>
</body>

<script type="text/javascript">

//饼状图数据加载。(同步加载！)
var YtSmsVoData=[];
var YtSmsVo_item = [];
$.ajax({
    url : basePath + "/mainPage/query",
    contentType: 'application/json',
    type : 'post',
    async: false,
    data:[],
    success : function(YtSmsVo) {
        var jsonObj = eval('(' + YtSmsVo + ')');
        if(jsonObj.toString()!=""){
	        for(var i in jsonObj){
	        	var obj_item = {};
	        	obj_item.value=jsonObj[i].smscount;
	        	obj_item.name=jsonObj[i].smsname;
	        	YtSmsVoData.push(obj_item);
	        	YtSmsVo_item.push(jsonObj[i].smsname);
	        }
        }
    }
});

//昨日发短信数据统计(同步加载！)
var YesTodayData_item = [];
$.ajax({
    url : basePath + "/deptStatistics/queryYesTodayData",
    contentType: 'application/json',
    type : 'post',
    async: false,
    data:[],
    success : function(YesTodayData) {
        var jsonObj = eval('(' + YesTodayData + ')');
        if(jsonObj.toString()!=""){
        	YesTodayData_item.push(jsonObj[0].submitstatistics)
            YesTodayData_item.push(jsonObj[0].send)
            YesTodayData_item.push(jsonObj[0].returnstatistics)
            YesTodayData_item.push(jsonObj[0].successnumber)
            YesTodayData_item.push(jsonObj[0].errornumber)
        }
        
    }
});


//一个月数据加载。(同步加载！)
var OneMouth_title=[];
var OneMouth_item = [];
$.ajax({
   url : basePath + "/returnReport/queryOneMouthData",
   contentType: 'application/json',
   type : 'post',
   async: false,
   data:[],
   success : function(data) {
       var jsonObj = eval('(' + data + ')');
       if(jsonObj.toString()!=""){
	       for(var i in jsonObj){
	       	OneMouth_title.push(jsonObj[i].error);
	       	OneMouth_item.push(jsonObj[i].num);
	       }
       }
   }
});

//用于使chart自适应高度和宽度,通过窗体高宽计算容器高宽
var resizeWorldMapContainer = function () {
    main1.style.width = window.innerWidth+'px';
};
//设置容器高宽
resizeWorldMapContainer();
// 初始化图表标签
    var echart=echarts.init(document.getElementById('main1'));
		var option={
			//定义标题
			title:{
				text:'近一个月 短信状态 top10',
				x:'center'
//				subtext:'虚拟数据'
			},
			/* legend:{
				data:['上行数量','下行数量'],
				x:'left'
			}, */
			//X轴 ,Y轴设置
			xAxis:{
				data:OneMouth_title
			},
			yAxis:{

			},
			tooltip:{
				show:true,
				formatter:'系列名:{a}<br />类目:{b}<br />数值:{c}'
			},
			//name=legend.data的时候才能显示图例
			series:[{
				name:'上行数量',
				type:'bar',
				barWidth : 50,//柱图宽度
			 	itemStyle:{  
        	normal:{
//      		color:'#ab78ba',   //柱状颜色

            label : {
                show : true,  //柱头数字
                position : 'top',
                textStyle : {
                    fontSize : '20',
                    fontFamily : '微软雅黑',
                    fontWeight : 'bold'
                }
            }
          }  
        },
				data:OneMouth_item,
			    /* markPoint: {
	                data: [
	                    {type: 'max', name: '最大值'},
	                    {type: 'min', name: '最小值'}
	                ]
	            }, */
	            /* markLine:{
	            	data:[
	            		{type:'average',name:'平均值',itemStyle:{
	            			normal:{
	            				color:'green'
	            			}
	            		}}
	            	]
	            }*/
			}, 
			{
				name:'下行数量',
				type:'line',
				data:OneMouth_item,
				/* markPoint: {
	                data: [
	                    {type: 'max', name: '最大值'},
	                    {type: 'min', name: '最小值'}
	                ]
	            }, */
	           /*  markLine:{
	            	data:[
	            		{type:'average',name:'平均值',itemStyle:{
	            			normal:{
	            				color:'blue'
	            			}
	            		}}
	            	]
	            } */
			}]
		};
		echart.setOption(option);
		//用于使chart自适应高度和宽度
		window.onresize = function () {
		    //重置容器高宽
		    resizeWorldMapContainer();
		    echart.resize();
		};
		
//		饼状图

    var echart2=echarts.init(document.getElementById('main2'));
   	var option2 = {
	    title : {
	        text: '近7日 发送类型统计',
	        x:'center'
	    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient: 'vertical',
        left: 'left',
        data: YtSmsVo_item
    },
    series : [
        {
            name: '短信类型',
            type: 'pie',
            radius : '55%',
            center: ['50%', '60%'],
            
            data:YtSmsVoData,
            labelLine: {
                normal: {
                    length: 20,
                    length2: 70,
                    lineStyle: {
                        color: '#333'
                    }
                }

            },
            label: {
                normal: {
                    formatter: '{b|{b}}{a|{d}%}\n\n',
                    borderWidth: 20,
                    borderRadius: 4,
                    // shadowBlur:3,
                    // shadowOffsetX: 2,
                    // shadowOffsetY: 2,
                    // shadowColor: '#999',
                    padding: [0, -70],
                    rich: {
                        a: {
                            color: 'blue',
                            fontSize: 12,
                            lineHeight: 20
                        },
                        b: {
                            fontSize: 12,
                            lineHeight: 20,
                            color: '#ab78ba'
                        }
                    }
                }
            },
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    ]
};
echart2.setOption(option2);

//每天发送情况
// 初始化图表标签
    var echart3=echarts.init(document.getElementById('main3'));
		var option3={
			//定义标题
			title:{
				text:'昨日短信发送情况',
				x:'center'
//				subtext:'虚拟数据'
			},
			//X轴 ,Y轴设置
			xAxis:{
				data:['提交总计','发送总计','返回总计','成功总计','失败总计']
			},
			yAxis:{

			},
			tooltip:{
				show:true,
				formatter:'系列名:{a}<br />类目:{b}<br />数值:{c}'
			},
			//name=legend.data的时候才能显示图例
			series:[{
				name:'上行数量',
				type:'bar',
				barWidth : 30,//柱图宽度
			 	itemStyle:{  
        	normal:{
        		color:'#ab78ba',   //柱状颜色
            label : {
                show : true,  //柱头数字
                position : 'top',
                textStyle : {
                    fontSize : '20',
                    fontFamily : '微软雅黑',
                    fontWeight : 'bold'
                }
            }
          }  
        },
				data:YesTodayData_item,
			    /* markPoint: {
	                data: [
	                    {type: 'max', name: '最大值'},
	                    {type: 'min', name: '最小值'}
	                ]
	            }, */
	            /* markLine:{
	            	data:[
	            		{type:'average',name:'平均值',itemStyle:{
	            			normal:{
	            				color:'green'
	            			}
	            		}}
	            	]
	            }*/
			}] 
		};
		echart3.setOption(option3);
</script>
</html>
