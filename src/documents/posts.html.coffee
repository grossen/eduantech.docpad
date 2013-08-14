---
title: Posts
menuShow: true
isPage: true
layout: page
menuOrder: 0
---
ul '.posts-list', ->
	for post in @getCollection('posts').toJSON()

		li ->
			time datetime: @postDatetime(post.date), @postDatetime(post.date, 'DD MMM YYYY') + ' ⋅ '
			a href:post.url, post.title

