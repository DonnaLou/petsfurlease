class AddDetailsToPets < ActiveRecord::Migration
  def change
    add_column :pets, :weight, :string
    add_column :pets, :gender, :string
  end
end
