# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
	
App.Messages = 
	changeTab: (event) ->
		$("#inboxGrid .teal.label").removeClass("teal")
		$(event.target).find(".label").addClass("teal")

$(document).on "click", "#inboxGrid .tabular .item", (event) =>
	App.Messages.changeTab(event)

