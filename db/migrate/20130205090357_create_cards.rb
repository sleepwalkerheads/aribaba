class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :player_name
      t.string :game_title
      t.string :character
      t.text :comment
      t.string :user
      t.float :latitude
      t.float :longitude
      t.boolean :active

      t.timestamps
    end
  end
end
