---
layout: default
---
article '.home', ->
	text @content

	# for post in @getCollection('posts').toJSON()
	# 	article '.post', ->
	# 		h1 post.title
	# 		text post.contentRenderedWithoutLayouts
