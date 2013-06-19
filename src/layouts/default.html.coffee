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
		link rel: 'stylesheet', href: '/styles/github.css'
		# My styles
		link rel: 'stylesheet', href: '/styles/main.css'
		link rel: 'stylesheet', href: '/styles/unsemantic-grid-base.css'
		# Adapt.min.js
		script src: '/scripts/adapt.min.js'

	body ->
		# Wrapper
		div '#wrapper', ->

			# Header
			div '#top', ->
				header role: 'banner', ->
					h1 ->
						a href: '/', ->
							'EduanTech'

				nav role: 'navigation', ->
					for page in @getCollection('pages').toJSON()
						pageMatch = page.match or page.url
						documentMatch = @document.match or @document.url
						cssname = if documentMatch.indexOf(pageMatch) is 0 then 'menu-current' else 'not-menu-current'
						a 'id':cssname, href: page.url, ->
							page.title

			# Content
			div '.grid-container', ->
				div '.sides.grid-15.mobile-grid-0.tablet-grid-10', 'giiiiiiiiiiin'
				main '.grid-70.mobile-grid-100.tablet-grid-80', role: 'main',
					-> @content
				div '.sides.grid-15.mobile-grid-0.tablet-grid-10', 'giiiiiiiiiiin'

				# Footer pusher
				div '#push-footer', ''

		# Footer
		footer '.grid-container', role: 'contentinfo', ->
			div '.grid-33.mobile-grid-100.tablet-grid-33', -> """
				<p>Copyright &copy; 2013 Eduan Lavaque, All Rights Reserved.</p>
				"""
			div '.grid-33.mobile-grid-100.tablet-grid-34', ->
				'stuff'
			div '.grid-33.mobile-grid-100.tablet-grid-33', -> """
				<p>Powered by <a href="http://docpad.org/">DocPad</a> and <a href="http://realiseweb.nl">Realiseweb</a>.</p>
				"""


		# DocPad plugins' scripts
		text @getBlock('scripts').toHTML()
		# My scripts
		script src: '/scripts/jquery-1.10.1.min.js'
		script src: '/scripts/main.js'
