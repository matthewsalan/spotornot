class AddSongstoplaylists < ActiveRecord::Migration
  def change
    add_column :song_suggestions, :playlist_id, :integer
  end
end
