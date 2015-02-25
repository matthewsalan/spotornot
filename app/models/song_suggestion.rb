class SongSuggestion < ActiveRecord::Base
  belongs_to :user
  has_many :playlists

  serialize :votes
end


