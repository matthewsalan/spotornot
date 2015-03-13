class SongSuggestionsController < ApplicationController
  before_action :authenticate_user!
  def show
    if params[:q]
      @tracks = RSpotify::Track.search(params[:q], limit: 20, offset: 0, market: 'US')
      @list = []
      @tracks.each do |t|
        temp = {spotify_id: t.id, title: t.name, artist: t.artists.first.name,
                  album: t.album.name, preview: t.preview_url, id: 1}
        @list << OpenStruct.new(temp)
      end
      @list = @list.paginate(:page => params[:page], :per_page => 10)
    end
    render :index
  end

  def index
    @vote = true
    @list = SongSuggestion.where(created_at: Playlist.last.range).shuffle
  end

  def create
    @week = Playlist.last
    @playlist = SongSuggestion.where(spotify_id: params[:id],
                created_at: @week.range)
    @votes = current_user.voted_songs.where(created_at: @week.range)
    if @playlist.size < 1 && @votes.size <= 20
      @track = RSpotify::Track.find(params[:id])
      @song = SongSuggestion.create(user_id: current_user.id,
                                          artist: @track.artists.first.name,
                                          title: @track.name,
                                          spotify_id: params[:id],
                                          album: @track.album.name,
                                          preview: @track.preview_url)
      @song.users << current_user
      flash[:notice] = "The song #{@track.name} has been added to this week's suggestions."
    elsif @votes.size > 20
      flash[:alert] = "You've used all 20 of your votes already."
    else
      flash[:alert] = "Sorry, #{@playlist.first.title} was already suggested this week."
    end
    redirect_to root_path
  end

  def destroy
  end
end
