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
		link rel: 'stylesheet', href: '/styles/all.css'

		# IE, HTML5 shiv
		ie 'IE', ->
			script src: 'http://html5shiv.googlecode.com/svn/trunk/html5.js'

	body ->
		# Navigation
		header role: 'banner', ->
			a '#title', href: '/', title: 'EduanTech', 'EduanTech'
			nav role: 'navigation', ->
				ul ->
					for page in @getCollection('pages').toJSON()
						# Check to be able to tell the user which is the current menu option (as in currently in it)
						pageMatch = page.match or page.url
						documentMatch = @document.match or @document.url
						cssname = if documentMatch.indexOf(pageMatch) is 0 then 'menu-current' else 'not-menu-current'
						li ->
							a 'class':cssname, href: page.url, title: page.menuTitle, page.menuTitle

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
		script src: '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'
		script src: '/scripts/main.js'
