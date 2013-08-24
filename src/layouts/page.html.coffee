---
layout: default
---
article '.page', ->
	header ->
		h1 @document.title

		aside '.meta', ->
			text @document.subHeadline

	text @content
