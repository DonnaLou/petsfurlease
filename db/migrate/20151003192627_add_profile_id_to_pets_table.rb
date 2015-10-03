class AddProfileIdToPetsTable < ActiveRecord::Migration
  def change
    add_column :pets, :profile_id, :integer
    remove_column :pets, :user_id, :integer
  end
end
