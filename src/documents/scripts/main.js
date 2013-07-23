// Add 'inline-code' class to any code tag not inside a pre tag.
$('code').filter(function(){
	return !$(this).closest('pre').length;
}).addClass('inline-code');


//
