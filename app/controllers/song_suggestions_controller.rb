class SongSuggestionsController < ApplicationController
  def show
    @results = nil
    if params[:q]
      @tracks = RSpotify::Track.search(params[:q], limit: 20, offset: 0, market: 'US')
    end
  end

  def index
    @songsuggestion = SongSuggestion.all
  end
end
