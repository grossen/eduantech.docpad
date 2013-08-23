---
layout: default
---
article '.post', ->
	header ->
		h1 @document.title

		section '.meta', ->
			text 'Written by '
			a href: @postAuthorUrl(), @postAuthor()
			text ' on '
			time datetime: @postDatetime(@document.date), @postDatetime(@document.date, 'DD MMMM YYYY')
			text '.'

	text @content
