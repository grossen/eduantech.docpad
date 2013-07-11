doctype 5
html lang: 'en', ->
	head ->
		# Standard meta
		meta charset: 'utf-8'
		meta 'http-equiv': 'X-UA-Compatible', content: 'ie=edge,chrome=1'
		meta 'http-equiv': 'content-type', content: 'text/html; charset=utf-8'
		meta name: 'viewport', content: 'width=device-width, initial-scale=1'
		# DocPad plugins' meta
		text @getBlock('meta').toHTML()

		# Feed
		# https://github.com/balupton/balupton.docpad/blob/master/src/layouts/default.html.coffee#L19

		# SEO
		title @getPreparedTitle()
		meta name: 'title', content: @getPreparedTitle()
		meta name: 'author', content: @getPreparedAuthor()
		meta name: 'email', content: @getPreparedEmail()
		meta name: 'description', content: @getPreparedDescription()
		meta name: 'keywords', content: @getPreparedKeywords()

		# DocPad plugins' styles
		text  @getBlock('styles').toHTML()
		# My styles
		link rel: 'stylesheet', href: '/styles/main.css'

	body ->
		# Navigation
		header role: 'banner', ->
			#img src: '/images/etlogo-white.gif', alt: 'logo', height: '170', width: '170'
			nav role: 'navigation', ->
					for page in @getCollection('pages').toJSON()
						# Check to be able to tell the user which is the current menu option (as in currently in it)
						pageMatch = page.match or page.url
						documentMatch = @document.match or @document.url
						cssname = if documentMatch.indexOf(pageMatch) is 0 then 'menu-current' else 'not-menu-current'
						a 'id':cssname, href: page.url, title: page.menuTitle, page.menuTitle
			a '#title', href: '/', title: 'EduanTech', 'EduanTech'

#			# Social icons
#			div '#social-icons', ->
#				a href: 'https://github.com/Greduan', title: 'GitHub - Greduan', ->
#					span '.icon-github-squared', ''
#				a href: 'https://www.gittip.com/Greduan', title: 'Gittip - Greduan', ->
#					span '.icon-gittip', ''
#				a href: 'https://bitbucket.org/Greduan', title: 'BitBucket - Greduan', ->
#					span '.icon-bitbucket-squared', ''
#				a href: 'http://stackoverflow.com/users/1622940/eduan', title: 'StackOverflow - Greduan', ->
#					span '.icon-stackoverflow', ''
#				a href: 'https://plus.google.com/u/0/101160916170411335097/', title: 'Eduan Lávaque (Eduan) - Google+', ->
#					span '.icon-gplus-squared', ''
#				a href: 'http://www.youtube.com/user/eduantech', title: 'Eduan Lávaque - YouTube', ->
#					span '.icon-youtube-squared', ''
#				a href: 'http://steamcommunity.com/id/greduan/', title: 'Steam Community - Greduan', ->
#					span '.icon-steam', ''
#				a href: '', title: 'RSS Feed', ->
#					span '.icon-rss-squared', ''

		# Content
		main role: 'main',
			-> @content

		# Footer
		footer role: 'contentinfo', ->
			div -> """
				<p><a href="https://github.com/Greduan/eduantech.docpad/blob/master/LICENSE.md" title="License Terms">License Terms</a> | Powered by <a href="http://docpad.org/">DocPad</a> and <a href="http://realiseweb.nl">Realiseweb</a>.</p>
				"""


		# DocPad plugins' scripts
		text @getBlock('scripts').toHTML()
		# My scripts
		script src: '/scripts/jquery-1.10.1.min.js'
		script src: '/scripts/modernizr.js'
		script src: '/scripts/pushy.js'
		script src: '/scripts/main.js'
