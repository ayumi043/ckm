$ ->
	$(".next").click ->
		$(".ani").animate "margin-left": (-336 * 2) + "px"

	$(".pre").click ->
		$(".ani").animate "margin-left": "0px"

	$(".menu li").hover(
	  -> $(this).addClass("mhover")
	  -> $(this).removeClass("mhover")
	)  

	$("#about,#jiameng,#zs,#service").hover(
	  -> 
	  	$(this).stop().addClass("mhover").find(".moremenu").slideDown()
	  	$(".mapwrap").css("z-index", "-1")  if !window.XMLHttpRequest
	  -> 
	  	$(this).stop().removeClass("mhover").find(".moremenu").slideUp()
	  	$(".mapwrap").css("z-index", "99") if !window.XMLHttpRequest
	)  