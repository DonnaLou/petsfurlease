# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready =->
	$('#composeMsg').on 'click', (event) => composeMsg()
	$('#writeReviewBtn').on 'click', (event) => writeReview()
	$('.iconPopUp').popup();
	$("#deleteProfilePic").on 'click', (event) => deleteProfilePicClick()
	$('#sendProfileReview').on 'click', (event) => postReview()



composeMsg =->
	$(".ui.modal#message").modal('show')

writeReview =->
	$(".ui.modal#review").modal('show')
	$('.ui.rating').rating()

postReview =->
	alert("test post profile review")

deleteProfilePicClick =->
	$("#userProfilePic").hide()
	$("#profilePicUpload").show()

$(document).on('turbolinks:load', ready)



