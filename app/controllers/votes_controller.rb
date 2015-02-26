class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @song = SongSuggestion.find(params[:song_id])
    if @song.users.include?(current_user)
      @song.users << current_user
    end
  end
end