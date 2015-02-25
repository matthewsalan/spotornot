class CreateSongSuggestions < ActiveRecord::Migration
  def change
    create_table :song_suggestions do |t|
      t.integer :user_id
      t.string :artist
      t.string :title
      t.string :spotify_id
      t.text :votes
      t.boolean :vetoed
      t.timestamps null: false
    end
  end
end
