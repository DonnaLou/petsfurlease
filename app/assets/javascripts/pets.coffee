# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready =->
	$('.ui.checkbox').checkbox()
	$("#helpWantedToggle").on 'click', (event) => helpWantedClick()
	$("#deleteProfilePic").on 'click', (event) => deleteProfilePicClick()
	$('#writeReviewBtn').on 'click', (event) => writeReview()
	$('#sendPetReview').on 'click', (event) => postReview() 

helpWantedClick =->
	if $("#helpWantedToggle").hasClass("checked")
		$("#helpWantedDates").show()
	else
		$("#helpWantedDates").hide()

deleteProfilePicClick =->
	$("#petProfilePicUpload").show()
	$("#petProfilePic").hide()

writeReview =->
	$(".ui.modal#review").modal('show')
	$('.ui.rating').rating()

postReview =->
	starCount = $(".ui.star.rating").rating('get rating')
	comment = $("#comments").val();
	alert("test post pet review")

$(document).on('turbolinks:load', ready)



