# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@userZipSearch = (x) ->
	url = "/search/user/" + $("#zip").val();
	window.location = url;

@petZipSearch = (x) ->
	url = "/search/pet/" + $("#petSpecies").val() + "/" + $("#petZip").val();
	window.location = url;

$(document).on "keydown", ".ui.action.input", (event) =>
	if(event.keyCode == 13)
		$(event.target).siblings(".ui.icon.button").click()