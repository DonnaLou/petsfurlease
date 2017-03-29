class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :reviews
  has_many :pets, through: :profile

  def sitter?()
    self.is_sitter
  end

  def conversations
    Conversation.where("sender_id = ? OR recipient_id = ?", self.id, self.id)
  end

  def conversation_unread_count
    conversations.select{|c| c.is_unread?}.count
  end

end
