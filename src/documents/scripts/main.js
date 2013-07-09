// Add 'inline-code' class to any code tag not inside a pre tag.
$('code').filter(function(){
	return !$(this).closest('pre').length;
}).addClass('inline-code');


// Logo size control stuff
/*
function resizeLogo() {
	isDesktop = Modernizr.mq('all and (min-width: 1025px)');
	isTablet = Modernizr.mq('all and (min-width: 641px) and (max-width: 1024px)');
	isMobile = Modernizr.mq('all and (max-width: 640px)');
	if (isDesktop) {
		headerWidth = $('header[role=\'banner\']').width();
		$('header[role=\'banner\'] img').prop('height', headerWidth);
		$('header[role=\'banner\'] img').prop('width', headerWidth);
	} else if (isTablet) {
		headerHeight = $('header[role=\'banner\']').height();
		$('header[role=\'banner\'] img').prop('height', headerHeight);
		$('header[role=\'banner\'] img').prop('width', headerHeight);
		$('header[role=\'banner\'] nav').prop('margin-left', headerHeight);
	} else if (isMobile) {
		headerHeight = $('header[role=\'banner\']').height();
		$('header[role=\'banner\'] img').prop('height', headerHeight);
		$('header[role=\'banner\'] img').prop('width', headerHeight);
	}
}
resizeLogo();

$(window).resize(function(){
	resizeLogo();
});
*/
