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
    return profile.full_name unless self.profile.nil?
    return self.email
  end

  def conversations
    Conversation.where("(sender_id = ? AND sender_delete = ?) OR (recipient_id = ? AND recipient_delete = ?)", self.id,false, self.id,false)
  end

  def conversation_unread_count
    count = 0
    self.conversations.each do |c|
      if c.unread self
        count += 1
      end
    end
    return count
  end

  def sent_conversations
    sent_conversations = Message.where(user: self)
    .map{|msg| con = msg.conversation}
    .uniq
    .sort{|a,b| b.updated_at <=> a.updated_at}

    sent_conversations.select{|con| !con.is_deleted self}
  end
end
