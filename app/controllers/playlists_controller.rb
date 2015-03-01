class PlaylistsController < ApplicationController

  def index
    @week = Playlist.all[-2]
    @voted = @week.song_suggestions
    render :index
  end
end