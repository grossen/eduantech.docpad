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
		link rel: 'stylesheet', href: '/styles/solarized-dark.css'
		# My styles
		link rel: 'stylesheet', href: '/styles/main.css'
		link rel: 'stylesheet', media: 'all and (min-width: 1025px)', href: '/styles/desktop.css'
		link rel: 'stylesheet', media: 'all and (min-width: 641px) and (max-width: 1024px)', href: '/styles/tablet.css'
		link rel: 'stylesheet', media: 'all and (max-width: 640px)', href: '/styles/mobile.css'

	body ->

		# Wrapper
		div '#wrapper', ->
			# Header
			header role: 'banner', ->
				# Logo
				img src: '/images/logo.png', alt: 'logo', height: '140', width: '140'

				# Navigation
				nav role: 'navigation', ->
					ul ->
						for page in @getCollection('pages').toJSON()
							# Check to be able to tell the user which is the current menu option (as in currently in it)
							pageMatch = page.match or page.url
							documentMatch = @document.match or @document.url
							cssname = if documentMatch.indexOf(pageMatch) is 0 then 'menu-current' else 'not-menu-current'
							li 'id':cssname, ->
								a href: page.url, title: page.title, page.title

			# Content
			main role: 'main',
				-> @content

			# Footer
			footer role: 'contentinfo', ->
				div -> """
					<p>Copyright &copy; 2013 Eduan Lavaque, All Rights Reserved.</p>
					"""
				div ->
					img src: '/images/logo', alt: 'logo', height: '20', width: '20'
				div -> """
					<p>Powered by <a href="http://docpad.org/">DocPad</a> and <a href="http://realiseweb.nl">Realiseweb</a>.</p>
					"""


		# DocPad plugins' scripts
		text @getBlock('scripts').toHTML()
		# My scripts
		script src: '/scripts/jquery-1.10.1.min.js'
		script src: '/scripts/main.js'
