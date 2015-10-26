class AddHelpWantedToPets < ActiveRecord::Migration
  def change
    add_column :pets, :helpWanted, :boolean
    add_column :pets, :helpStartDate, :Date
    add_column :pets, :helpEndDate, :Date
  end
end
