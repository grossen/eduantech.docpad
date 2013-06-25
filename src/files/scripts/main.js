// Add 'inline-code' class to any code tag not inside a pre tag.
$('code').filter(function(){
	return !$(this).closest('pre').length;
}).addClass('inline-code');



isDesktop = Modernizr.mq('all and (min-width: 1025px)');
isTablet = Modernizr.mq('all and (min-width: 641px) and (max-width: 1024px)');
isMobile = Modernizr.mq('all and (max-width: 640px)');
if (isDesktop) {
	headerWidth = $('header[role=\'banner\']').width();
	$('header[role=\'banner\'] img').prop('height', headerWidth);
	$('header[role=\'banner\'] img').prop('width', headerWidth);
}
if (isTablet) {
	headerHeight = $('header[role=\'banner\']').height();
	$('header[role=\'banner\'] img').prop('height', headerHeight);
	$('header[role=\'banner\'] img').prop('width', headerHeight);
}
if (isMobile) {
	//headerWidth = $('header[role=\'banner\']').width();
	$('header[role=\'banner\'] img').prop('height', 150);
	$('header[role=\'banner\'] img').prop('width', 150);
}

/*
$(window).resize(function(){
	isDesktop = Modernizr.mq('all and (min-width: 1025px)');
	isTablet = Modernizr.mq('all and (min-width: 641px) and (max-width: 1024px)');
	isMobile = Modernizr.mq('all and (max-width: 640px)');
	if (isDesktop) {
		headerWidth = $('header[role=\'banner\']').width();
		$('header[role=\'banner\'] img').prop('height', headerWidth);
		$('header[role=\'banner\'] img').prop('width', headerWidth);
	}
	if (isTablet) {
		headerHeight = $('header[role=\'banner\']').height();
		$('header[role=\'banner\'] img').prop('height', headerHeight);
		$('header[role=\'banner\'] img').prop('width', headerHeight);
	}
	if (isMobile) {
		headerWidth = $('header[role=\'banner\']').width();
		$('header[role=\'banner\'] img').prop('height', headerWidth);
		$('header[role=\'banner\'] img').prop('width', headerWidth);
	}
});
*/
