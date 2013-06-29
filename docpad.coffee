# DocPad Configuration File
# http://docpad.org/docs/config

# Import
moment = require('moment')

class App
constructor: ->
	# Anchor Change Event
	@$window.on('anchorchange', @anchorChange)

	# State Change Event
	@$window.on('statechangecomplete', @stateChange)

anchorChange: =>
	hash = History.getHash()
	return  unless hash
	el = document.getElementById(hash)
	return  unless el
	if el.tagName.toLowerCase() is 'h2'
		$(el).trigger('select')
	else
		$(el).ScrollTo(@config.sectionScrollOpts)

stateChange: =>
	$('h1,h2,h3,h4,h5,h6').each ->
		return  if @id
		id = @innerText.toLowerCase().replace(/\s+/g,' ').replace(/[^a-zA-Z0-9]+/g,'-').replace(/--+/g,'-').replace(/^-|-$/g,'')
		return  if document.getElementById(id)
		@id = id
		@setAttribute('data-href', '#'+@id)  unless @getAttribute('data-href')
		@className += 'hover-link'  unless @className.indexOf('hover-link') isnt -1

# Define the DocPad Configuration
docpadConfig = {

	plugins:
		stylus:
			compress: true
		sitemap:
			cachetime: 600000
			changefreq: 'hourly'
			priority: 0.5
			sitemap: true
		highlightjs:
			replaceTab: null

	templateData:
		site:
			url: "http://eduantech.com"
			title: "EduanTech"
			author: "Eduan Lavaque"
			email: "eduan@snapsimpletech.com"
			description: """
				A hacker's advice for Linux (and a lot of stuff that works on Linux), WordPress, s2Member and web development.
				"""
			keywords: """
				greduan, eduan, eduan lavaque, lavaque, hacker, linux, wordpress, s2member, vim, tmux, web development, code
				"""

		# Meta helpers
		getPreparedTitle: -> if @document.title then "#{@document.title} - #{@site.title}" else @site.title
		getPreparedAuthor: -> @document.author or @site.author
		getPreparedEmail: -> @document.email or @site.email
		getPreparedDescription: -> @document.description or @site.description
		getPreparedKeywords: -> @site.keywords.concat(@document.keywords or []).join(', ')

	localeCode: "en"

	collections:
		posts: ->
			@getCollection("html").findAllLive({relativeOutDirPath: 'archives'},[{date:-1}]).on "add", (model) ->
				model.setMetaDefaults({layout: "post"})

			#@getCollection('documents').findAllLive({relativeOutDirPath:'archives'},[{date:-1}]).on 'add', (model) ->
				#dateUrl = '/archives' + moment(model.get('date')).format("/YYYY/MM") + '/' + model.get('basename')
				#model.addUrl(dateUrl).setMetaDefaults({url:dateUrl})

		pages: ->
			@getCollection('documents').findAllLive({menuOrder:$exists:true},[menuOrder:1])
}

# Export the DocPad Configuration
module.exports = docpadConfig
