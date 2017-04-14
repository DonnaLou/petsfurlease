class ConversationsController < ApplicationController
	before_action :authenticate_user!

	def index
	end

	def create
	end

	def mark_read
		conversation = Conversation.find(params[:id])
		if conversation
			conversation.mark_read(current_user)
		end
		render status: 200, json: true
	end

	def delete
		conversation = Conversation.find(params[:id])
		if conversation
			conversation.mark_delete(current_user)
			if conversation.recipient_delete && conversation.sender_delete
				conversation.destroy!
			end
			render status: 200, json: conversation.id
		else
			render status: 500, json: "Conversation with id #{conversation.id} doesn't exist."
		end
	end
	
end
