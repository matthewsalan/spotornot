class RemoveVetoedFromCreateSongSuggestions < ActiveRecord::Migration
  def up
    remove_column :song_suggestions, :vetoed
  end

  def down
    add_column :song_suggestions, :vetoed, :boolean
  end
end
