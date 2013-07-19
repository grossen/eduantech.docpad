---
layout: default
---
article '.post', ->
	div '.meta', ->
		p @document.author
		p ->
			time datetime: @postDatetime(@document.date), @postDate(@document.date)
#		p ->
#			a href: '#comments', title: '#{comments##}', '#{comments##} comments'

	header ->
		h1 @document.title

	text @content

#	div '#addthis', ->
#		@getAddThisBlock('std', 'right:13px; top:115px;', true)
