class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def create

  end

  def show
  	@conversation = Conversation.find(params[:id])
  	@messages = @conversation.messages
  end

end
