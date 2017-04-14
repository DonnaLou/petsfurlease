class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_exist?, only:[:create, :delete]

  def index
  end

  def create
  	ActiveRecord::Base.transaction do
	  	if (params[:conversation_id].present?)
	  		conversation = Conversation.find(params[:conversation_id])
				conversation.revive

				message = create_message(params[:body], conversation)

		  	if message.valid?
		  		message.save!
		  		render partial:'shared/messageDisplay', locals:{:msg => message}
	  		else
	  			render status: 500, json: message.errors.full_messages
		  	end
	  	elsif (params[:recipient_profile_id].present?)
				profile =  Profile.find(params[:recipient_profile_id])

				if (!profile.nil?)
					conversation = Conversation.between(current_user.id, profile.user.id)

					if(conversation.length < 1)
						conversation = create_conversation profile
					else
						conversation = conversation.first
					end
					conversation.revive

					message = create_message(params[:body], conversation)
		  		if message.valid?
						message.save!
						render status: 200, json: true
					else
	  				render status: 500, json: message.errors.full_messages
					end
				end
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

  private

  def create_message body, conversation
		message = Message.new
		message.user = current_user
		message.body = body
		message.conversation = conversation
		return message
  end

  def create_conversation profile
  	conversation = Conversation.new
		conversation.sender = current_user
		conversation.recipient = profile.user
		conversation.save!
		return conversation
  end

end