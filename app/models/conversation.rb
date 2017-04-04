class Conversation < ActiveRecord::Base
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, :scope => :recipient_id
  
  scope :between, -> (sender_id,recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end

  def mark_delete user
    if self.sender == user
      self.sender_delete = true
    elsif self.recipient == user
      self.recipient_delete = true
    end

    self.save! if self.changed?
  end

  def mark_read user
    self.messages.each do |m|
      if m.user != user
        m.read = true
        m.save!
      end
    end
  end

  def unread user
    self.messages.each do |m|
      if m.user != user && !m.read
        return true
      end
    end
    return false
  end


end