# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready =->
	$('.ui.checkbox').checkbox()
	$("#helpWantedToggle").on 'click', (event) => helpWantedClick()
	$("#deleteProfilePic").on 'click', (event) => deleteProfilePicClick()
	$('#writeReviewBtn').on 'click', (event) => writeReview()

helpWantedClick =->
	if $("#helpWantedToggle").hasClass("checked")
		$("#helpWantedDates").show();
	else
		$("#helpWantedDates").hide();

deleteProfilePicClick =->
	$("#petProfilePicUpload").show();
	$("#petProfilePic").hide();

	
composeMsg =->
	$(".ui.modal#message").modal('show');

writeReview =->
	$(".ui.modal#review").modal('show');
	$('.ui.rating').rating();


$(document).ready(ready);
$(document).on('turbolinks:load', ready)



