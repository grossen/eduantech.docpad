# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
	enabledPlugins:
		sass: false

	plugins:
		menu:
			menuOptions:
				optimize: false
				skipEmpty: true
		sitemap:
			cachetime: 600000
			changefreq: 'hourly'
			priority: 0.5
			sitemap: true
		highlightjs:
			replaceTab: null

	environments:
		debug:
			# Enable debug mode for "frontend-assets" plugin:
			# generates files with '-debug' suffix with
			# assets sources
			frontendDebug: true


	templateData:
		site:
			url: "http://eduantech.com"
			title: "EduanTech"
			description: """
				A hacker's advice for Linux (and a lot of stuff that works on Linux), WordPress, s2Member and web development.
				"""
			keywords: """
				hacker, linux, wordpress, s2member, vim, tmux, web development, code
				"""

		getPreparedTitle: ->
			# if we have a document title, then we should use that and suffix the site's title onto it
			if @document.title
				"#{@document.title} | #{@site.title}"
			# if our document does not have it's own title, then we should just use the site's title
			else
				"Untitled | #{@site.title}"

		# Get the prepared site/document description
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.description or @site.description

		# Get the prepared site/document keywords
		getPreparedKeywords: ->
			# Merge the document keywords with the site keywords
			@site.keywords.concat(@document.keywords or []).join(', ')

	localeCode: "en"

	collections:
		posts: ->
			@getCollection("html").findAllLive({relativeOutDirPath: 'archives'},[{date:-1}]).on "add", (model) ->
				model.setMetaDefaults({layout: "post"})
}

# Export the DocPad Configuration
module.exports = docpadConfig
