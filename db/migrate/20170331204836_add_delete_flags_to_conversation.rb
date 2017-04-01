class AddDeleteFlagsToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :recipient_delete, :boolean, :default => false
    add_column :conversations, :sender_delete, :boolean, :default => false
  end
end
