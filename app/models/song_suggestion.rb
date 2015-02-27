class SongSuggestion < ActiveRecord::Base
  belongs_to :user
  belongs_to :playlist
  has_many :votes
  has_many :users, through: :votes
end


