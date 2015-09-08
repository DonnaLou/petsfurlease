class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.integer :user_id
      t.string :name
      t.string :species
      t.string :breed
      t.integer :age
      t.integer :human_interaction_rating
      t.integer :animal_interaction_rating
      t.string :personality
      t.text :details

      t.timestamps null: false
    end
  end
end
