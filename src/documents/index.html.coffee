---
title: EduanTech
layout: page
subHeadline: My corner of the internet
---
ul '.posts-list', ->
	for post in @getCollection('posts').toJSON()

		li ->
			time datetime: @postDatetime(post.date), @postDatetime(post.date, 'DD MMM YYYY') + ' ⋅ '
			a href:post.url, post.title
