class Playlist < ActiveRecord::Base
  has_many :song_suggestions

  def range
    self.created_at..self.created_at + 1.week
  end

  def alphas
    result = Hash.new { |h, k| h[k] = [] }
    SongSuggestion.where(created_at: self.range).each do |s|
      result[s.title.downcase[0].to_sym] << [s, s.votes.count] unless 
      s.votes.where(veto: true).count > 0
    end
    result.each_key.map do |l|
      result[l].sort_by {|x| x[1]}.reverse[0][0]
    end
  end

  def process
    alphas.each do |song|
      self.song_suggestions << song
    end
  end

  def list
    self.song_suggestions.sort_by {|s| s.title}
  end
end
