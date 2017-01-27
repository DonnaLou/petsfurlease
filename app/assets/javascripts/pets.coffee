# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready =->
	$('.ui.checkbox').checkbox()
	$('.ui.rating.readOnlyRating').rating('disable')
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
	$('.ui.rating#writeRating').rating('enable')
	$('.ui.rating.readOnlyRating').rating('disable')

postReview =->
	postReviewUrl = "/review"
	data = {}
	data.rating = $(".ui.rating#writeRating").rating('get rating')
	data.comments = $("#comments").val()
	data.review_subject_id = review_subject.id
	data.review_subject_type = review_subject.type
	$.ajax({
		type: "POST",
		url: postReviewUrl,
		data: data,
		success: postReviewSuccess,
		error: postReviewError
	})

postReviewSuccess =->
	alert("yay")

postReviewError =->
	alert("boo")

$(document).on('turbolinks:load', ready)



