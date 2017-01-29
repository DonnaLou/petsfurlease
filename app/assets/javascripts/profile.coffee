# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready =->
	$('#composeMsg').on 'click', (event) => $(".ui.modal#message").modal('show')
	$('#writeProfileReviewBtn').on 'click', (event) => writeProfileReview()
	$('.iconPopUp').popup();
	$("#deleteProfilePic").on 'click', (event) => deleteProfilePicClick()
	$('#sendProfileReview').on 'click', (event) => postProfileReview()
	$('.ui.star.rating.readOnlyRating').rating('disable')

writeProfileReview =->
	$(".ui.modal#review").modal('show')
	$('.ui.star.rating#writeRating').rating()

postProfileReview =->
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
		success: postProfileReviewSuccess,
		error: postProfileReviewError
	})

postProfileReviewSuccess =->
	alert("yay profile")

postProfileReviewError =->
	alert("boo profile")

deleteProfilePicClick =->
	$("#userProfilePic").hide()
	$("#profilePicUpload").show()

$(document).on('turbolinks:load', ready)



