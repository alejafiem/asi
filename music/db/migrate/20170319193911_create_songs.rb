class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :author, null: false
      t.string :name, null: false
      t.string :key, null: false
      t.string :chord, null: false
      t.string :instrument, null: false
      t.integer :duration, null: false

      t.timestamps
    end
  end
end
