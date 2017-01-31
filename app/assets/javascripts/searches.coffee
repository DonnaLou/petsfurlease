changeTab =->
	if window.location.pathname.indexOf("user") > -1
		$.tab('change tab', 'findSitter')
		$("#findSitterTab").addClass('active')
		$("#findPetTab").removeClass('active')

	
initialize =->
	$(".tabular.menu .item").tab()
	changeTab()
	

$(document).ready ->
    $("#petSearchForm")
		.on("ajax:success", (e, data, status, xhr) ->
				if(e.target.id == "petSearchForm")
					$("#petSearchResults").html(xhr.responseText)
				else if(e.target.id == "userSearchForm")
					$("#profileSearchResults").html(xhr.responseText))
		.on("ajax:error", (e, xhr, status, error) ->
		  alert("Error: " + xhr.responseText))

$(document).on('turbolinks:load', initialize)