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

  def full_name
    return profile.full_name  unless self.profile.nil?
    return self.email
  end

  def conversations
    Conversation.where("sender_id = ? OR recipient_id = ?", self.id, self.id)
  end

  def conversation_unread_count
    conversations.select{|c| c.is_unread?}.count
  end

  def sent_conversations
    Message.where(user: self).map{|msg| msg.conversation}.uniq.sort{|a,b| b.updated_at <=> a.updated_at}
  end

end
