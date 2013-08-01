---
layout: default
---
article '.post', ->
	header ->
		h1 @document.title

		section '.meta', ->
			text @document.author + ', '
			time datetime: @postDatetime(@document.date), @postDatetime(@document.date, 'DD-MM-YYYY')

	text @content

#	section '#addthis', ->
#		@getAddThisBlock('std', 'right:13px; top:115px;', true)
