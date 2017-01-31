# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

	
changeTab = (event) ->
	$("#reviewsGrid .teal.label").removeClass("teal")
	$(event.target).find(".label").addClass("teal")

ready =->
	$("#reviewsGrid .ui.vertical.tabular .item").tab
	$("#reviewsGrid .ui.vertical.tabular .item").on 'click', (event) => changeTab(event)

$(document).on('turbolinks:load', ready)
