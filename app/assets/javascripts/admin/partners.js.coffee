# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  $('#sheng').change ->
    $("#shi,#xian").html("")
    $.ajax(
      url: '/admin/regions/' + $(this).find("option:selected").val(),
      success: (data) ->
        str = ""
        $.each(data, (key, value) ->
          # alert(key + "      " + value.id)
          str += "<option value='#{value.id}'>#{value.region_name}</option>"
        );

        $("#shi").html(str)
    )


  $("#shi").change ->  
    $.ajax(
      url: '/admin/regions/' + $(this).find("option:selected").val(),
      success: (data) ->
        str = ""
        $.each(data, (key, value) ->
          str += "<option value='#{value.id}'>#{value.region_name}</option>"
        );

        $("#xian").html(str)
    ) 


  return  
