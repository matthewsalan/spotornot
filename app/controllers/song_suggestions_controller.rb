class SongSuggestionsController < ApplicationController
  def show
    @results = nil
    if params[:q]
      tracks = RSpotify::Track.search(params[:q], limit: 20, offset: 0, market: 'US')
      binding.pry
      @results = JSON.parse(tracks.body)['results']
    end
    render :show
  end

  def index
    @songsuggestion = SongSuggestion.all
    render :index
  end
end
