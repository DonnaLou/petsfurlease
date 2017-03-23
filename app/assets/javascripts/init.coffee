window.App ||= {}

App.init =->
	$('.ui.accordion').accordion({exclusive: false})
	$('.iconPopUp').popup()
	$('.ui.checkbox').checkbox()
	$('.ui.tabular .item').tab()

	#set disable for rating that are read only
	$('.ui.rating.readOnlyRating').rating('disable')

	if $(".searches").length > 0
		searches = new App.Searches
		searches.initSearchTabs()
		searches.initSearchForms()

	#initialize datepicker
	if $("#pet_helpStartDate").length > 0
		$("#pet_helpStartDate").datepicker({dateFormat: 'yy-mm-dd'})
		$("#pet_helpEndDate").datepicker({dateFormat: 'yy-mm-dd'})

$(document).on "turbolinks:load", ->
	App.init()
