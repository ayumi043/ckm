# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

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
	  	$("#container").css "z-index", "-1"
	  -> 
	  	$(this).stop().removeClass("mhover").find(".moremenu").slideUp()
	  	$("#container").css "z-index", "0"
	)  