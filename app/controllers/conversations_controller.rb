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
	
end
