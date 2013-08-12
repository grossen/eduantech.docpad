---
title: Posts
menuShow: true
isPage: true
layout: page
menuOrder: 0
---
for post in @getCollection('posts').toJSON()

	for year in post.date
		h1 @moment(post.date).format('YYYY')

		for month in post.date
			h2 @moment(post.date).format('MMMM')
			ul ->
				li ->
					@postDatetime(post.date, 'll') + ' » '
					a href:'post.url', post.title
