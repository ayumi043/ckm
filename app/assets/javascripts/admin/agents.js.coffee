$ ->
  $('#sh').change ->
    region_id = $(this).find("option:selected").val()
    return unless region_id
    $.ajax
      url: '/admin/showpartners/' + region_id,
      success: (data) ->
        str = ""
        $.each(data, (key, value) ->
          # alert(key + "      " + value.id)
          str += "<li><input type='radio' name='partner_id' value='#{value.id}'> #{value.name}</li>"
        );

        $("#agentname").html(str)
    
  return