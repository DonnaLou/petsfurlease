window.App ||= {}

App.init =->
	$('.ui.accordion').accordion()
	$('.iconPopUp').popup()
	$('.ui.checkbox').checkbox()
	$('.ui.tabular .item').tab()

	#set disable for rating that are read only
	$('.ui.rating.readOnlyRating').rating('disable')

	if $(".searches").length > 0
		searches = new App.Searches
		searches.initSearchTabs()
		searches.initSearchForms()


$(document).on "turbolinks:load", ->
	App.init()
