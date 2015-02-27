class VetoesController < ApplicationController
  before_action :authenticate_user!

  def create
    @song = SongSuggestion.find(params[:id])
    @week = Playlist.last
    used_veto = current_user.votes.find_by(veto: true)
    @vote = Vote.new
    if used_veto  
      flash[:alert] = "You have already used your veto"
    else
      @vote.veto = true
      @vote.user_id = current_user.id
      @vote.song_suggestion_id = @song.id
      @vote.save
      flash[:notice] = "You have used your veto"
    end
    redirect_to song_suggestions_index_path
  end
end

