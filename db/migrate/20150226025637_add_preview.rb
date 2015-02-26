class AddPreview < ActiveRecord::Migration
  def change
    add_column :song_suggestions, :preview, :string
  end
end
