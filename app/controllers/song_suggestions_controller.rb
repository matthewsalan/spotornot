class SongSuggestionsController < ApplicationController
  before_action :authenticate_user!
  def show
    @results = nil
    if params[:q]
      @tracks = RSpotify::Track.search(params[:q], limit: 20, offset: 0, market: 'US')
    end
  end

  def index
    @songsuggestion = SongSuggestion.all
  end

  def create
    @track = RSpotify::Track.find(params[:id])
    @song = SongSuggestion.new(user_id: current_user.id, artist: @track.artists.first.name,
                               title: @track.name, spotify_id: params[:id])
    binding.pry
  end

  def destroy
  end
end
