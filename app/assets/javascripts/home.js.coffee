$ ->
	$(".next").click ->
		$("#services .ani").animate "margin-left": (-336 * 2) + "px"

	$(".pre").click ->
		$("#services .ani").animate "margin-left": "0px"

	$(".menu li").hover(
	  -> $(this).addClass("mhover")
	  -> $(this).removeClass("mhover")
	)  

	$("#about,#jiameng,#zs,#service").hover(
	  -> 
	  	$(this).stop().addClass("mhover").find(".moremenu").slideDown()
	  	$("#container").hide() if !window.XMLHttpRequest
	  -> 
	  	$(this).stop().removeClass("mhover").find(".moremenu").slideUp()
	  	$("#container").show() if !window.XMLHttpRequest
	)  