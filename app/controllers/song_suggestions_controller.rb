class SongSuggestionsController < ApplicationController
  def show
    @results = nil
    if params[:q]
      @tracks = RSpotify::Track.search(params[:q], limit: 20, offset: 0, market: 'US')
    end
  end

  def index
   @song_suggestions = SongSuggestion.all
   render :index
  end
end
