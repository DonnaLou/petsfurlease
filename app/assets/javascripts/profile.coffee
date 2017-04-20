# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App.Profiles =
	deleteProfilePic: ->
		$("#userProfilePic").hide()
		$("#profilePicUpload").show()
		$("#delete_image").val(1)

	showMessageModal: ->
		$(".ui.modal#message").modal({
			onApprove : () -> 
				msgBody = $("textarea#messageText").val()
				if msgBody.length < 1
					alert "Message body is required."
					return false
				else
					App.Messages.sendMessageFromDialog()
    }).modal('show')


$(document).on "click", "#deleteProfilePic", =>
	App.Profiles.deleteProfilePic()

$(document).on "click", "#composeMsg", =>
	App.Profiles.showMessageModal()		
