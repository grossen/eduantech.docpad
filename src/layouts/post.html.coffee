---
layout: default
---
article ->
	div '.meta', ->
		p @document.author
		p @document.date

	header ->
		h1 @document.title

	text @content

	div '#addthis', ->
		@getAddThisBlock('std', 'right:13px; top:115px;', true)

	#div '#back-to-top', ->
		#a href: '#', title: 'Back to Top', 'Back to Top'
