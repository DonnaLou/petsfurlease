class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id
	validates :body, length: {maximum: 1000}

  scope :unread, -> { where read: false}

  def message_time
  	created_at.strftime("%b %d, %Y %H:%M %P")
  end
end