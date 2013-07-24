# DocPad Configuration File
# http://docpad.org/docs/config

# Import
moment = require('moment')

# Define the DocPad Configuration
docpadConfig = {
	# Used to minify our assets with grunt
	writeAfter: (opts,next) ->
		# Prepare
		safeps = require('safeps')
		pathUtil = require('path')
		docpad = @docpad
		rootPath = docpad.getConfig().rootPath
		gruntPath = pathUtil.join(rootPath, 'node_modules', '.bin', 'grunt')

		# Perform the grunt `min` task
		# https://github.com/gruntjs/grunt/blob/0.3-stable/docs/task_min.md
		command = [gruntPath, 'min']

		# Execute
		spafeps.spawn(command, {cwd:rootPath,output:true}, next)

		# Chain
		@

	plugins:
		stylus:
			compress: true
			environment:
				development:
					compress: false
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
				greduan, eduan, eduán, eduan lavaque, lavaque, lávaque, hacker, linux, wordpress, s2member, web development, code
				"""

		# Meta helpers
		getPreparedTitle: -> if @document.title then "#{@document.title} - #{@site.title}" else @site.title
		getPreparedAuthor: -> @document.author or @site.author
		getPreparedEmail: -> @document.email or @site.email
		getPreparedDescription: -> @document.description or @site.description
		getPreparedKeywords: -> @site.keywords.concat(@document.keywords or []).join(', ')

		# Post meta
		postDatetime: (date, format="YYYY-MM-DD") -> return moment(date).format(format)
		postDate: (date, format="MMMM DD, YYYY") -> return moment(date).format(format)

	localeCode: "en"

	collections:
		posts: ->
			@getCollection('html').findAllLive({relativeOutDirPath:'archives'},[{date:-1}]).on 'add', (model) ->
				dateUrl = '/archives' + moment(model.get('date')).format('/YYYY/MM/DD') + '/' + model.get('basename')
				model.addUrl(dateUrl).setMetaDefaults({url: dateUrl})
				model.setMetaDefaults({layout: 'post'})

		pages: ->
			@getCollection('documents').findAllLive({menuOrder:$exists:true},[menuOrder:1])
}

# Export the DocPad Configuration
module.exports = docpadConfig
