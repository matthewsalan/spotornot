class SongSuggestionsController < ApplicationController
  def show
    @results = nil
    if params[:q]
      tracks = RSpotify::Track.search(query, limit: 20, offset: 0, market: 'US')
      @results = JSON.parse(tracks.body)['results']
    end
    render :show
  end

  def index
    @songsuggestion = SongSuggestion.all
    render :index
  end
end
