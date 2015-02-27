class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @week = Playlist.last
    @votes = current_user.voted_songs.
             where(created_at: @week.created_at..@week.created_at + 1.weeks)
    @song = SongSuggestion.find(params[:song_id])
    if @song.users.exclude?(current_user) && @votes.size <= 20
      @song.users << current_user
      flash[:notice] = "Vote recorded."
    elsif @votes.size > 20
      flash[:alert] = "You've used all 20 of your votes already."
    else
      flash[:alert] = "You've already voted for that song!"
    end
    redirect_to song_suggestions_index_path
  end
end