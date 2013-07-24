# Add 'inline-code' class to any code tag not inside a pre tag.
$("code").filter(->
	not $(this).closest("pre").length
).addClass "inline-code"
