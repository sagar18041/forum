$(document).ready(function() {
	$(".add_comment").hide();
	$('#new_post').click(function(){
		$(".add_comment").slideToggle();
	});
	$('#new_comment').bind('ajax:success',function(evt, data, status, xhr){
		$(this).find('input[type=text]').val('');
	}).bind("ajax:error",function() {
		console.log('failure');
	});
});