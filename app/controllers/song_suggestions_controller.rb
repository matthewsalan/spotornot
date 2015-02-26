class SongSuggestionsController < ApplicationController
  before_action :authenticate_user!
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

  def create
    @this_week = Playlist.last
    @playlist = SongSuggestion.where(spotify_id: params[:id],
                created_at: @this_week.created_at..@this_week.created_at + 1.weeks)
    if @playlist.size < 1
      @track = RSpotify::Track.find(params[:id])
      @suggestion = SongSuggestion.create(user_id: current_user.id,
                                          artist: @track.artists.first.name,
                                          title: @track.name,
                                          spotify_id: params[:id],
                                          preview: @track.preview_url)
      flash[:notice] = "The song #{@track.name} has been added to this week's suggestions."
    else
      flash[:alert] = "Sorry, #{@playlist.first.title} was already suggested this week."
    end
    redirect_to root_path
  end

  def destroy
  end
end
