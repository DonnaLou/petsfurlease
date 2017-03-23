# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
	
App.Review = 
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
		$("#reviewSegment").append(response)
		$('.ui.rating.readOnlyRating').rating('disable')

	postReviewError: (response) ->
		alert("post review error")

	writeReview: ->
		$(".ui.modal#review").modal('show')
		$(".ui.star.rating#writeRating").rating('enable')

$(document).on "click", "#reviewsGrid .tabular .item", (event) =>
	App.Review.changeTab(event)

$(document).on "click", ".postReviewBtn", =>
	App.Review.postReview()

$(document).on "click", ".writeReviewBtn", =>
	App.Review.writeReview()