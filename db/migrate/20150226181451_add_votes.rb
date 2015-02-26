class AddVotes < ActiveRecord::Migration
  def change
    remove_column :song_suggestions, :votes
    create_table :votes do |t|
      t.integer :user_id
      t.integer :song_suggestion_id
      t.timestamps
    end
    add_index :votes, :user_id
    add_index :votes, :song_suggestion_id
  end
end
