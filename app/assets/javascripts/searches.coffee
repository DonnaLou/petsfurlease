# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App.Searches =->
	initSearchTabs: ->
		if window.location.pathname.indexOf("user") > -1
			$.tab('change tab', 'findSitter')
			$("#findSitterTab").addClass('active')
			$("#findPetTab").removeClass('active')
			params = window.location.pathname.split("/")
			zip = params[params.length - 1]
			$("#zip").val(zip)
		else if window.location.pathname.indexOf("pet") > -1
			params = window.location.pathname.split("/")
			zip = params[params.length - 2]
			animal = params[params.length - 1]
			$("#petZip").val(zip)
			$("#petSpecies").val(decodeURIComponent(animal))


	initSearchForms: ->
		$("#petSearchForm")
		.on("ajax:success", (e, data, status, xhr) ->
			$("#petSearchResults").html(xhr.responseText))
		.on("ajax:error", (e, xhr, status, error) ->
		  alert("Error: " + xhr.responseText))

		$("#userSearchForm")
		.on("ajax:success", (e, data, status, xhr) ->
			$("#profileSearchResults").html(xhr.responseText))
		.on("ajax:error", (e, xhr, status, error) ->
		  alert("Error: " + xhr.responseText))
