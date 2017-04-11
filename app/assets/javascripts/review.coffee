# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
	
App.Review = 
	init: ->
		$("a.delete_review[data-remote]").on "ajax:success", (e, data, status, xhr) ->
			review_id = "#review_" + data
			divider_id = "#divider_" + data
			$(review_id).remove()
			$(divider_id).remove()
			review_count = parseInt($("#authored_review_count").html())
			$("#authored_review_count").html(--review_count)

	changeTab: (event) ->
		$("#reviewsGrid .teal.label").removeClass("teal")
		$(event.target).find(".label").addClass("teal")

	postReview: ->
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
			success: App.Review.postReviewSuccess,
			error: App.Review.postReviewError
		})

	postReviewSuccess: (response) ->
		$("#noReviewMsg").hide()
		$("#reviewSegment").append(response)
		$('.ui.rating.readOnlyRating').rating('disable')

	postReviewError: (response) ->
		if(response.status == 422)
			alert("User Profile is required to leave a review. Please create a profile before continuing.")
		else
			alert("Writing review failed. Please try again later")

	writeReview: ->
		$(".ui.modal#review").modal('show')
		$(".ui.star.rating#writeRating").rating('enable')

$(document).on "click", "#reviewsGrid .tabular .item", (event) =>
	App.Review.changeTab(event)

$(document).on "click", "#postReviewBtn", =>
	App.Review.postReview()

$(document).on "click", "#writeReviewBtn", =>
	App.Review.writeReview()
