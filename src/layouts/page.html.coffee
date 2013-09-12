---
layout: default
---
article '.page', ->
	header ->
		h1 @document.headline

		aside '.meta', ->
			text @document.subHeadline

	text @content
