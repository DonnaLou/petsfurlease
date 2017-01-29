# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready =->
	$('.ui.checkbox').checkbox()
	$('.ui.star.rating.readOnlyRating').rating('disable')
	$("#helpWantedToggle").on 'click', (event) => helpWantedClick()
	$("#deleteProfilePic").on 'click', (event) => deleteProfilePicClick()
	$('#writePetReviewBtn').on 'click', (event) => writePetReview()
	$('#sendPetReview').on 'click', (event) => postPetReview() 

helpWantedClick =->
	if $("#helpWantedToggle").hasClass("checked")
		$("#helpWantedDates").show()
	else
		$("#helpWantedDates").hide()

deleteProfilePicClick =->
	$("#petProfilePicUpload").show()
	$("#petProfilePic").hide()

writePetReview =->
	$(".ui.modal#review").modal('show')
	$(".ui.star.rating#writeRating").rating('enable')

postPetReview =->
	postReviewUrl = "/review"
	data = {}
	data.rating = $(".ui.star.rating#writeRating").rating('get rating')
	data.comments = $("#comments").val()
	data.review_subject_id = review_subject.id
	data.review_subject_type = review_subject.type
	$.ajax({
		type: "POST",
		url: postReviewUrl,
		data: data,
		success: postPetReviewSuccess,
		error: postPetReviewError
	})

postPetReviewSuccess =->
	alert("yay")

postPetReviewError =->
	alert("boo")

$(document).on('turbolinks:load', ready)



