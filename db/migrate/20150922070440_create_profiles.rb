class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstName
      t.string :lastName
      t.string :city
      t.string :state
      t.string :zip
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
