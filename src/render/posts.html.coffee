---
title: Posts
layout: page
headline: Posts
subHeadline: Explore all my posts
menuShow: true
isPage: true
menuOrder: 0
---
# KUDOS to Steve Mc for figuring this out for me:
# http://stackoverflow.com/users/126540/steve-mc

yr = -1 # temporary vars for storing current year value in loop
mnth = -1 #same for month value
monthNames = ["January","February","March","April","May","June","July","August","September","October","November","December"]

div '.posts-list', ->
	for post in @getCollection('posts').toJSON()
		if post.date.getFullYear() isnt yr
			yr = post.date.getFullYear()
			mnth = -1 
			h1 yr.toString()
		if post.date.getMonth() isnt mnth
			mnth = post.date.getMonth() 
			h2 monthNames[mnth]
			ul ->
				li ->
					time datetime: @postDatetime(post.date), @postDatetime(post.date, 'DD MMM YYYY') + ' ⋅ '
					a href:post.url, post.title
