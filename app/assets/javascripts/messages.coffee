# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
	
App.Messages = 
	changeTab: (event) ->
		$("#inboxGrid .teal.label").removeClass("teal")
		$(event.target).find(".label").addClass("teal")

	sendMessage: (event) ->
		postMsgUrl = "/messages"
		data = {}
		data.body = $("#messageBody").val()
		data.conversation_id = $("#conversation_id").val()
		$.ajax({
			type: "POST",
			url: postMsgUrl,
			data: data,
			success: App.Messages.postMessageSuccess,
			error: App.Messages.postMessageError
		})

	postMessageSuccess: (response) ->
		$("#messageSegment").append(response)
		$("#messageBody").val("")

	postMessageError: (response) ->
		alert("Sending message failed. Please try again later.")

	sendMessageFromDialog: (event) =>
		postMsgUrl = "/messages"
		data = {}
		data.body = $("textarea#messageText").val()
		data.recipient_profile_id = $("#profile_id").val()
		$.ajax({
			type: "POST",
			url: postMsgUrl,
			data: data,
			success: App.Messages.postMessageDialogSuccess,
			error: App.Messages.postMessageError
		})

	postMessageDialogSuccess: (response) ->
		alert("Message sent")


$(document).on "click", "#inboxGrid .tabular .item", (event) =>
	App.Messages.changeTab(event)

$(document).on "click", "button#sendMessage", (event) =>
	App.Messages.sendMessage(event)

$(document).on "click", "#sendMsgDialogBtn", (event) =>
	App.Messages.sendMessageFromDialog(event)
