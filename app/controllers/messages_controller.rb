class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def create
  	@conversation = Conversation.find(params[:conversation_id])

  	if @conversation.nil? 
			render status: 500, json: "TODO: allow composition of new messages"
		else
			message = Message.new
	  	message.body = params[:body]
	  	message.conversation = @conversation
	  	message.user = current_user

	  	if message.valid?
	  		message.save!
	  		render partial:'shared/messageDisplay', locals:{:msg => message}
  		else
  			render status: 500, json: message.errors.full_messages
	  	end
		end
  end

  def show
  	@conversation = Conversation.find(params[:id])
  	@messages = @conversation.messages
  end

  def delete
  	@conversation = Conversation.find(params[:id])
  	@conversation.mark_delete(current_user)
  end

end
