class SongsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about]

  def index
    @songs = Song.reorder("created_at DESC").paginate(:page => params[:page], :per_page => 15)
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.save
      flash[:success] = "Addition succeed."
      redirect_to songs_path
    else
      render 'new'
    end


  end

  def edit
    @song = Song.find(params[:id])
    authorize @song, :update?
  end

  def save_edit
    @song = Song.find(params[:id])
    authorize @song, :update?

    @song.update(song_params)

    if @song.save
      flash[:success] = "Song has been edited."
      redirect_to songs_path
    else
      render 'edit'
    end
  end

  def delete
    @song = Song.find(params[:id])

    authorize @song, :update?

    @song.destroy

    flash[:success] = "Song has been deleted."

    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:author, :name, :key,
                                    :chord, :instrument, :duration)
  end
end
