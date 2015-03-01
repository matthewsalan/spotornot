class PlaylistsController < ApplicationController

  def index
    @voted = Vote.all.where(veto: false)
    render :index
  end
end