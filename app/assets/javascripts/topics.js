$(document).ready(function() {
	$('#new_comment').bind('ajax:success',function(evt, data, status, xhr){
		$(this).find('input[type=text]').val('');
	}).bind("ajax:error",function() {
		console.log('failure');
	});
});