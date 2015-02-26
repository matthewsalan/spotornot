class AlbumCol < ActiveRecord::Migration
  def change
    add_column :song_suggestions, :album, :string
  end
end
