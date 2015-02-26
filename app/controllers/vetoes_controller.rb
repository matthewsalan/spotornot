class VetoesController < ApplicationController
  def create
    @song = SongSuggestion.find(params[:id])
    @week = Playlist.last
    used_veto = current_user.votes.find_by(veto: true)
    veto = Vote.new
    unless used_veto  
      veto.veto = true
      veto.user_id = current_user.id
      veto.song_suggestion_id = @song.id
      flash[:notice] = "You have used your veto"
    else
      flash[:alert] = "You have already used your veto"
    end
    veto.save
    redirect_to song_suggestions_index_path
  end
end









