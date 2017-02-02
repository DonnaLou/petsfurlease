# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App.Pets =
	helpWantedClick: ->
		if $("#helpWantedToggle").hasClass("checked")
			$("#helpWantedDates").show()
		else
			$("#helpWantedDates").hide()

	deleteProfilePic: ->
		$("#petProfilePicUpload").show()
		$("#petProfilePic").hide()


$(document).on "click", "#deleteProfilePic", =>
	App.Pets.deleteProfilePic()

$(document).on "click", "#helpWantedToggle", =>
	App.Pets.helpWantedClick()
