---
layout: default
---
article '.post', ->
	section '.meta', ->
		p @document.author
		p ->
			time datetime: @postDatetime(@document.date), @postDatetime(@document.date, 'MMMM DD, YYYY')
#		p ->
#			a href: '#comments', title: '#{comments##}', '#{comments##} comments'

	header ->
		h1 @document.title

	text @content

#	section '#addthis', ->
#		@getAddThisBlock('std', 'right:13px; top:115px;', true)
