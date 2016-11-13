# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initialize =->
	$('.ui.checkbox').checkbox()
	$('.menu .item').tab()
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


$(document).ready ->
  $("#petSearchForm")
	.on("ajax:success", (e, data, status, xhr) ->
    	$("#petSearchResults").html(xhr.responseText))
	.on("ajax:error", (e, xhr, status, error) ->
   	alert("Error: " + xhr.responseText))

$(document).ready(initialize);
$(document).on('page:load', initialize);



