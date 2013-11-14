doctype 5
html lang: 'en', ->
	head ->
		# Standard meta
		meta charset: 'utf-8'
		meta 'http-equiv': 'X-UA-Compatible', content: 'ie=edge,chrome=1'
		meta 'http-equiv': 'content-type', content: 'text/html; charset=utf-8'
		meta name: 'viewport', content: 'width=device-width, initial-scale=1'
		link rel: 'shortcut icon', href: '/favicon.ico', type: 'image/x-icon'
		# DocPad plugins' meta
		text @getBlock('meta').toHTML()

		# Feed
		link rel: 'alternate', type: 'application/rss+xml', title: 'RSS', href: '/atom.xml'

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
		link rel: 'stylesheet', href: '/css/all.min.css'

		# IE, HTML5 shiv
		ie 'IE', ->
			script src: 'http://html5shiv.googlecode.com/svn/trunk/html5.js'

	body ->
		div '#wrapper', ->
			div '#header', ->
				header role: 'banner', ->
					nav role: 'navigation', ->
						ul ->
							for page in @getCollection('pages').toJSON()
								# Check to be able to tell the user which is the current menu option (as in currently in it)
								pageMatch = page.match or page.url
								documentMatch = @document.match or @document.url
								cssname = if documentMatch.indexOf(pageMatch) is 0 then 'menu-current' else 'not-menu-current'
								li ->
									a 'class': cssname, href: page.url, title: page.title, page.title
									div '.arrow', ''
					div '.nav-placeholder', ''

			div '#content', ->
				main role: 'main', ->
					@content

			div '#footer', ->
				footer role: 'contentinfo', ->

					div '.social-icons', ->
						a '.icon-twitter', href: 'https://twitter.com/EduanLavaque', title: 'Eduán Lávaque (EduanLavaque) on Twitter', ''
						a '.icon-gplus', href: 'https://plus.google.com/u/0/101160916170411335097', title: 'Eduardo Lávaque (Greduan) - Google+', ''
						a '.icon-youtube', href: 'http://www.youtube.com/user/eduantech', title: 'eduantech - YouTube', ''
						a '.icon-github-circled', href: 'https://github.com/Greduan', title: 'Greduan (Eduán Lávaque)', ''
						a '.icon-gittip', href: 'https://www.gittip.com/Greduan/', title: 'Greduan - Gittip', ''
						a '.icon-rss', href: '/atom.xml', title: 'EduanTech RSS', ''

					p ->
						a href:'https://github.com/Greduan/eduantech.docpad/blob/master/LICENSE.md', title:'License Terms', 'License Terms'
						text '. Powered by '
						a href:'http://docpad.org/', 'DocPad'
						text '.'

		# DocPad plugins' scripts
		text @getBlock('scripts').toHTML()
		# My scripts
		script src: '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'
		script src: '/js/all.min.js'
