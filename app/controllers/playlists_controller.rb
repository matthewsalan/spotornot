class PlaylistsController < ApplicationController

  def index
    # @playlist = Playlist.last
    @songs = Vote.all


  end
  
end