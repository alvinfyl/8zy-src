<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">  
.loading{  
    width:200px;  
    height:56px;  
    position: absolute;  
   /*  top:50%; */
    margin-top:40%;  
    left:40%;  
    line-height:56px;  
    color:#fff;  
    padding-left:60px;  
    font-size:15px;  
    background: #000 url(../../../dist/img/loading.gif) no-repeat 10px 50%;  
    opacity: 0.7;  
    z-index:9999;  
    -moz-border-radius:20px;  
    -webkit-border-radius:20px;  
    border-radius:20px;  
    filter:progid:DXImageTransform.Microsoft.Alpha(opacity=70);  
}  
</style> 
<div class="modal fade" id="loading" tabindex="1" role="dialog" aria-labelledby="myModalLabel" data-backdrop='static' style="z-index: 9998;">
  <div class="modal-dialog" role="document">
      <div id="loading2" class="loading"></div>
  </div>
</div>
<script type="text/javascript">
	$("#loading").on("hidden.bs.modal ",function(){
		$(document.body).addClass("modal-open");
	});
</script>