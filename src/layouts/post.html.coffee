---
layout: default
---
article ->
	header ->
		h1 @document.title

		div '#post-meta', -> """
		Posted on #{@document.date} <em>by</em> #{@document.author}.
		Tagged as #{@document.tags.join(', ')}.
		"""
	text @content

	div '#addthis', ->
		@getAddThisBlock('std', 'right:13px; top:115px;', true)

	#div '#back-to-top', ->
		#a href: '#', title: 'Back to Top', 'Back to Top'
