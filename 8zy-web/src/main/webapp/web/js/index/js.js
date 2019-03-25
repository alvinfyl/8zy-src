//LAZY.init();LAZY.run();

//内容页广告区跟随滚动
/*
$("#adad2").scrollFollow({
    marginTop:0,marginBottom:0,zindex:99
  });
 */
//列表页tag相关页面广告区跟随滚动
$(".tag_ad").scrollFollow({
    marginTop:0,marginBottom:0,zindex:99
  });

//移动端访问显示进入wap站链接
if(navigator.userAgent.match(/(Android|iPhone|iPad|iPod|webOS)/))
{
	$('#wap-enter').show();
	$('#wap-enter').parent().css('height','500px');
}

//移动端访问，选择访问哪个版本
if(navigator.userAgent.match(/(Android|iPhone|iPad|iPod|webOS)/)) {
	$('#wap-selector').show();
}

$('#wap-selector-pc').click(function(){
	$.cookie('pc_fan', 1, { expires: 1, path: '/' });
	$('#wap-selector').hide();
});

$('#wap-selector-wap').click(function(){
	$.cookie('pc_fan', 0, { expires: 1, path: '/' });
});

// wap站过来的就是pc fan
if(document.referrer.indexOf('m.80s.tw') != -1) {
	$.cookie('pc_fan', 1, { expires: 1, path: '/' });
}

// pc站按钮转wap站，就不是pc fan了
$('#wap-enter a').click(function(){
	$.cookie('pc_fan', 0, { expires: 1, path: '/' });
});