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
		link href:'http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,400,300,600|Libre+Baskerville:400,700,400italic', rel:'stylesheet', type:'text/css'
		link rel: 'stylesheet', href: '/styles/all.min.css'
		script src: '/scripts/prefixfree.min.js'

		# IE, HTML5 shiv
		ie 'IE', ->
			script src: 'http://html5shiv.googlecode.com/svn/trunk/html5.js'

	body ->
		div '#wrapper', ->
			header role: 'banner', ->
				# Navigation
				nav role: 'navigation', ->
						a href: '/', title: 'EduanTech', 'Home'
						for page in @getCollection('pages').findAllLive({layout:'page'}).toJSON()
							# Check to be able to tell the user which is the current menu option (as in currently in it)
							pageMatch = page.match or page.url
							documentMatch = @document.match or @document.url
							cssname = if documentMatch.indexOf(pageMatch) is 0 then 'menu-current' else 'not-menu-current'
							a 'class':cssname, href: page.url, title: page.title, page.title

			# Content
			main role: 'main', ->
				@content

			# Footer
			footer role: 'contentinfo', ->
#				# Navigation
#				nav role: 'navigation', ->
#						a href: '/', title: 'EduanTech', 'Home'
#						for page in @getCollection('pages').findAllLive({layout:'page'}).toJSON()
#							# Check to be able to tell the user which is the current menu option (as in currently in it)
#							pageMatch = page.match or page.url
#							documentMatch = @document.match or @document.url
#							cssname = if documentMatch.indexOf(pageMatch) is 0 then 'menu-current' else 'not-menu-current'
#							a 'class':cssname, href: page.url, title: page.title, page.title

				# Footer
				div '#footer', ->
					p ->
						a href:'https://github.com/Greduan/eduantech.docpad/blob/master/LICENSE.md', title:'License Terms', 'License Terms'
						text '. Powered by '
						a href:'http://docpad.org/', 'DocPad'
						text ' and '
						a href:'http://realiseweb.nl', 'Realiseweb'
						text '.'

		# DocPad plugins' scripts
		text @getBlock('scripts').toHTML()
		# My scripts
		script src: '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'
		script src: '/scripts/all.min.js'
