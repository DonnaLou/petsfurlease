# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@userZipSearch = (x) ->
	url = "/search/user/" + $("#zip").val();
	window.location = url;

@petZipSearch = (x) ->
	url = "/search/pet/" + $("#petZip").val() + "/" + $("#petSpecies").val();
	window.location = url;
