<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 添加 模态框（Modal） -->
<div class="modal fade" id="confirm" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 1088 !important;">
	<div class="modal-dialog modal-dialog-confirm" style="width:800px">		
		
	</div>
</div>

<script type="text/javascript">
	function show_confirm(title,info,callback) {
		 $('#confirm').modal('hide');
		 $('#confirm').modal();
		var content = '<div class="modal-content" style="width:800px;">'
			+ '<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button><h4 class="modal-title" id="myModalLabel">' + title + '</h4></div>'
			+ '<div class="modal-body" style="margin-left:52px;"><form id="templateForm" style="border-bottom: none;font-size:16px;">' + info + '</form></div>'
			+ '<div class="modal-footer"><button type="button" class="btn btn-sure btn-primary">确定</button><button type="button" class="btn btn-cancel btn-primary" data-dismiss="modal">取消</button></div>'
			+ '</div>';
		$('.modal-dialog-confirm').empty();
		$('.modal-dialog-confirm').append(content);
		$('.modal-footer').click(function(e){
	     if(e.target==$(".btn-sure")[0]){
	           $('#confirm').modal('hide');
	           callback.call(this,true);
	     }else if(e.target==$(".btn-cancel")[0]){
		    $('#confirm').modal('hide');
		 	callback.call(this,false);    
	     }
	   });
	}
</script>