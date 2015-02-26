class SongSuggestion < ActiveRecord::Base
  belongs_to :user
  has_many :playlists
  has_many :votes
  has_many :users, through: :votes
end


