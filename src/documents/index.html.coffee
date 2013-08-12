---
title: Home
layout: page
---
ul ->
	for post in @getCollection('posts').toJSON()
		li ->
			#time datetime: @postDatetime(post.date), @postDatetime(post.date, 'DD MMMM YYYY') + ' » '
			a href:post.url, post.title
