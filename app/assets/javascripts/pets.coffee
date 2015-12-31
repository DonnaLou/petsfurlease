# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready =->
	$('.ui.checkbox').checkbox()
	$('.menu .item').tab()
	$("#helpWantedToggle").on 'click', (event) => 
		helpWantedClick()
	$("#deleteProfilePic").on 'click', (event) => 
		deleteProfilePicClick()

helpWantedClick =->
	if $("#helpWantedToggle").hasClass("checked")
		$("#helpWantedDates").show()
	else
		$("#helpWantedDates").hide()

deleteProfilePicClick =->
	$("#petProfilePicUpload").show()
	$("#petProfilePic").hide()

$(document).ready(ready)
$(document).on('page:load', ready)



