# DocPad Configuration File
# http://docpad.org/docs/config

# Import
moment = require('moment')

# Define the DocPad Configuration
docpadConfig = {
	watchOptions:
		preferredMethods:
			['watchFile','watch']
	plugins:
		highlightjs:
			replaceTab: null
		coffeekup:
			coffeecup:
				format: false

	templateData:
		site:
			url: "http://greduan.github.io/"
			title: "EduanTech"
			author: "Eduan Lavaque"
			email: "eduanlavaque@gmail.com"
			description: """
				A hacker's advice for Mac OS X, s2Member and web development.
				"""
			keywords: """
				greduan, eduan, eduán, eduan lavaque, lavaque, lávaque, hacker, mac, osx, os x, mac os x, mac osx, s2member, web development, code
				"""

		# Meta helpers
		getPreparedTitle: -> if @document.title then "#{@document.title} - #{@site.title}" else @site.title
		getPreparedAuthor: -> @document.author or @site.author
		getPreparedEmail: -> @document.email or @site.email
		getPreparedDescription: -> @document.description or @site.description
		getPreparedKeywords: -> @site.keywords.concat(@document.keywords or []).join(', ')

		# Post meta
		postAuthorUrl: () -> if @document.authorUrl then "#{@document.authorUrl}" else @site.url
		postAuthor: () -> if @document.author then "#{@document.author}" else @site.author
		postAuthorEmail: () -> if @document.authorEmail then "#{@document.authorEmail}" else @site.email
		postDatetime: (date, format="YYYY-MM-DD") -> return moment(date).format(format)

	localeCode: "en"

	collections:
		posts: ->
			@getCollection('documents').findAllLive({relativeDirPath:'posts'},[{date:-1}]).on 'add', (model) ->
				model.setMetaDefaults({layout:'post'})

		pages: ->
			@getCollection('documents').findAllLive({isPage:true},[menuOrder:1])

	events:
		# Write After
		# Run some Grunt on this stuff
		writeAfter: (opts,next) ->
			# Prepare
			safeps = require('safeps')
			pathUtil = require('path')
			docpad = @docpad
			rootPath = docpad.getConfig().rootPath
			gruntPath = pathUtil.join(rootPath, 'node_modules', '.bin', 'grunt')

			# Perform the grunt `min` task
			command = [gruntPath]

			# Execute
			safeps.spawn(command, {cwd:rootPath,output:false}, next)

			# Chain
			@
}

# Export the DocPad Configuration
module.exports = docpadConfig
